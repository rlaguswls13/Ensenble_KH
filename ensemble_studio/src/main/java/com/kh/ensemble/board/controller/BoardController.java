package com.kh.ensemble.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.kh.ensemble.board.exception.SaveFileException;
import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.service.ReplyService;
import com.kh.ensemble.board.model.vo.Attachment;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Reply;
import com.kh.ensemble.board.model.vo.Search;
import com.kh.ensemble.board.model.vo.Type;
import com.kh.ensemble.member.controller.MemberController;
import com.kh.ensemble.member.model.vo.Member;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember"})
public class BoardController {

	@Autowired
	private BoardService serviceB;
	@Autowired
	private ReplyService serviceR;
	@Autowired
	private LikeService serviceL;

	// 게시글 목록 조회
	@RequestMapping("{boardTypeNo}/list")
	public String boardList(@PathVariable("boardTypeNo") int boardTypeNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg,
			Search search) {

		pg.setBoardTypeNo(boardTypeNo);
		pg.setCurrentPage(cp);

		Pagination pagination = null;
		List<Board> boardList = null;

		if (search.getSk() == null) {
			pagination = serviceB.getPagination(pg);
			boardList = serviceB.selectBoardList(pagination);
		} else {
			pagination = serviceB.getPagination(search, pg);
			boardList = serviceB.selectBoardList(search, pagination);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);

		if (boardTypeNo == 1) { // 리뷰 게시판
			return "board/reviewBoardList";
		} else { // 일반 게시판
			return "board/normalBoardList";
		}

	}

	// 게시글 상세 조회
	@RequestMapping("{boardTypeNo}/{boardNo}")
	public String boardView(@PathVariable("boardTypeNo") int boardTypeNo,
							@PathVariable("boardNo") int boardNo,
							@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							Model model,
							RedirectAttributes ra) {

		Board board = serviceB.selectBoard(boardNo);

		if (board != null) {
			List<Reply> rList = serviceR.selectList(boardNo);
			model.addAttribute("rList", rList);
			model.addAttribute("board", board);
			return "board/boardView";

		} else {
			swalSetMessage(ra, "error", "게시글 상세 조회 실패", "해당 글이 존재하지 않습니다.");
			return "redirect:list";
		}
	}

	// 특정 게시글 삽입 화면 전환
	@RequestMapping(value = "{boardTypeNo}/insert", method = RequestMethod.GET)
	public String insertForm(@PathVariable("boardTypeNo") int boardTypeNo, Model model) {

		List<Type> typeList = serviceB.selectType(boardTypeNo);
		Type boardType = serviceB.selectboardType(boardTypeNo);

		model.addAttribute("typeList", typeList);
		model.addAttribute("boardType", boardType);

		return "board/boardInsert";
	}

	
	// 게시글 첨부 파일 서버 저장
	@RequestMapping(value = "{boardTypeNo}/insertImage", method = RequestMethod.POST)
	@ResponseBody
	public String uploadImage(@PathVariable("boardTypeNo") int boardTypeNo,
							@RequestParam("file") MultipartFile file,
							HttpServletRequest request) {
		
		// 웹상 접근 경로, 실제 파일 저장 경로 지정
		String webPath = "resources/images/board";

		// 게시판 타입에 따라 업로드되는 파일의 경로를 지정
		switch (boardTypeNo) {
			case 1:	webPath += "/review/"; break;
			case 2: webPath += "/notice/"; break;
			case 3:	webPath += "/FAQ/"; break;
			case 4:	webPath += "/normalCS/"; break;
		}
		
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		String fileName = serviceB.uploadFile(file, savePath);		
		
			fileName = webPath + fileName;

		return fileName;
	}

	
	// 게시글 삽입
	@RequestMapping(value="{boardTypeNo}/insert", method=RequestMethod.POST)
	public String insertBoard(	@ModelAttribute("board") Board board, 
								@ModelAttribute("loginMember") Member loginMember,
								HttpServletRequest request, RedirectAttributes ra) {
		
		String content = imgExtract(board);
		
		board.setMemberNo(loginMember.getMemberNo());
		int boardNo = serviceB.insertBoard(board);
		
		String path = null;
		
		if(boardNo > 0) {
			path = "redirect:" + boardNo;
			MemberController.swalSetMessage(ra, "success", "게시글 삽입 성공",  null);
			
		} else { 
			path = "redirect:" + request.getHeader("referer");
			MemberController.swalSetMessage(ra, "error", "게시글 삽입 실패",  null);
		}
				
		return path;
	}
	
	// 게시글 수정 화면 전환
	@RequestMapping(value="{boardTypeNo}/updateForm", method=RequestMethod.POST)
	public String updateBoard(@PathVariable("boardTypeNo") int boardTypeNo,
								int boardNo, Model model) {
		
		List<Type> typeList = serviceB.selectType(boardTypeNo);
		Type boardType = serviceB.selectboardType(boardTypeNo);
		
		Board board = serviceB.selectBoard(boardNo);
		model.addAttribute(board);
		model.addAttribute("typeList", typeList);
		model.addAttribute("boardType", boardType);
		
		return "board/boardUpdate";
	}
		
	// 게시글 수정
	@RequestMapping(value="{boardTypeNo}/update", method=RequestMethod.POST)
	public String updateBoard(@ModelAttribute Board board, Model model,								
							  HttpServletRequest request, RedirectAttributes ra) {

		int result = serviceB.updateBoard(board);
		
		String path = null;
		
		if(result > 0) {
			path = "redirect:"+board.getBoardNo();
			MemberController.swalSetMessage(ra, "success", "게시글 수정 성공",  null);
			
		} else { 
			path = "redirect:"+request.getHeader("referer");
			MemberController.swalSetMessage(ra, "error", "게시글 수정 실패",  null);
		}
		return path;
	}
	
	// 게시글 삭제
	@RequestMapping(value="{boardTypeNo}/delete", method=RequestMethod.POST)
	public String deleteBoard(@RequestParam("boardNo") int boardNo,
							  @RequestParam("boardTypeNo") int boardTypeNo,
							  HttpServletRequest request, RedirectAttributes ra) {

		int result = serviceB.deleteBoard(boardNo);
		String path = null;

		if(result > 0) {
			path = "redirect:list";
			MemberController.swalSetMessage(ra, "error", "게시글 삭제 성공",  null);
		} else {
			path = "redirect:" + boardNo;
			MemberController.swalSetMessage(ra, "success", "게시글 삭제 실패",  null);
		}
		
		return path;
	}
	

	// SweetAlert 메소드
	private void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
	
	// summernote img 추출
	private String imgExtract(Board board) {
		
		// img 태그 src 추출 정규표현식
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>$");
        Matcher matcher = pattern.matcher(board.getBoardContent());     
        String content = matcher.group();
        System.out.println(content);
        
        // 저장할 빈 객체 생성
        String src = null;		// ajax로 서버저장되서 올라간 img의 src
        String filePath = null; // 저장할 위치
        String fileName = null; // 저장할 파일 이름
		
        return fileName;
   	}
	

}
