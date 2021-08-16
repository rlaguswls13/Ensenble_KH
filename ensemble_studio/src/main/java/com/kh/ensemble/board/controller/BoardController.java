package com.kh.ensemble.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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


import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.service.ReplyService;
import com.kh.ensemble.board.model.vo.Attachment;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Like;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Reply;
import com.kh.ensemble.board.model.vo.Search;
import com.kh.ensemble.board.model.vo.Type;
import com.kh.ensemble.member.controller.MemberController;
import com.kh.ensemble.member.model.vo.Member;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember","board"})
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
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
			, Model model, Pagination pg, Search search,
			@RequestParam(value = "bctN", required = false, defaultValue = "0") int bct) {

		pg.setBoardTypeNo(boardTypeNo);
		pg.setCurrentPage(cp);
		pg.setBoardCTNo(bct);
		
		search.setBoardTypeNo(boardTypeNo);
		search.setBoardCTNo(bct);		
		
		Pagination pagination = null;
		List<Board> boardList = null;
		List<Type> typeList = null;
		
		typeList = serviceB.selectType(boardTypeNo);
		
		if (search.getSk() == null) {
			if(pg.getBoardTypeNo() == 1) pg.setLimit(6);
			pagination = serviceB.getPagination(pg);
			if(pg.getBoardTypeNo() == 1) pagination.setLimit(6);
			boardList = serviceB.selectBoardList(pagination);
			
		} else {
			if(pg.getBoardTypeNo() == 1) pg.setLimit(6);
			pagination = serviceB.getPagination(pg);
			if(pg.getBoardTypeNo() == 1) pagination.setLimit(6);
			boardList = serviceB.selectSearchBoardList(search, pagination);
			
		}

		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("typeList", typeList);
		
		if (boardTypeNo == 1) { // 리뷰 게시판
			return "board/reviewBoardList";
		}else if(boardTypeNo == 2){ //공지 게시판
			return "board/noticeList";
		}else { // 일반 게시판
			return "board/normalBoardList";
		}

	}

	// 게시글 상세 조회
	@RequestMapping("{boardTypeNo}/{boardNo}")
	public String boardView(@PathVariable("boardTypeNo") int boardTypeNo,
							@PathVariable("boardNo") int boardNo,
							@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,				
							Model model, Like like, RedirectAttributes ra,							
							HttpSession session) {
		
		int loginMemberNo = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			like.setMemberNo(loginMember.getMemberNo());
			loginMemberNo = loginMember.getMemberNo();
		}
		like.setBoardNo(boardNo);
		
		Like selLike = serviceL.selectLike(like);
		Board board = serviceB.selectBoard(loginMemberNo, boardNo);
		
		if (board != null) {
			List<Reply> rList = serviceR.selectList(boardNo);
			
			model.addAttribute("selLike", selLike);
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
	
	// 게시글 url 파일 서버 저장
	@RequestMapping(value = "{boardTypeNo}/insertImageUrl", method = RequestMethod.POST)
	@ResponseBody
	public String uploadImage(@PathVariable("boardTypeNo") int boardTypeNo,
								@RequestParam("url") String url,
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
		String fileName = serviceB.uploadFile(url, savePath);		
		fileName = webPath + fileName;
			
		return fileName;
	}

	
	// 게시글 삽입
	@RequestMapping(value="{boardTypeNo}/insert", method=RequestMethod.POST)
	public String insertBoard(	@ModelAttribute("loginMember") Member loginMember,
								HttpServletRequest request, RedirectAttributes ra,
								Board board) {
		
		board.setMemberNo(loginMember.getMemberNo());
		int boardNo = serviceB.insertBoard(board);
		
		String path = null;
		
		if(boardNo > 0) {
			
			List<Attachment> atList = imgExtract(board);
			if(!atList.isEmpty()) serviceB.insertAt(atList);
			
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
							@ModelAttribute("loginMember") Member loginMember ,
							int boardNo, Model model) {
		
		int loginMemberNo = loginMember.getMemberNo();
		List<Type> typeList = serviceB.selectType(boardTypeNo);
		Type boardType = serviceB.selectboardType(boardTypeNo);
		
		Board board = serviceB.selectBoard(loginMemberNo, boardNo);
		model.addAttribute(board);
		model.addAttribute("typeList", typeList);
		model.addAttribute("boardType", boardType);
		
		return "board/boardUpdate";
	}
		
	// 게시글 수정
	@RequestMapping(value="{boardTypeNo}/update", method=RequestMethod.POST)
	public String updateBoard(@ModelAttribute("board") Board board, Model model,								
							  HttpServletRequest request, RedirectAttributes ra) {

		int result = serviceB.updateBoard(board);
		
		String path = null;
		
		if(result > 0) {
			
			// attachment에 정보 삽입문제야기는 추후
			List<Attachment> atList = imgExtract(board);
			if(!atList.isEmpty()) serviceB.updateAt(atList);
			else serviceB.updateAt(board.getBoardNo());
			
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
							  @ModelAttribute("loginMember") Member loginMember,
							  Like like,
							  HttpServletRequest request, RedirectAttributes ra) {

		
		int loginMemberNo = loginMember.getMemberNo();
		like.setMemberNo(loginMemberNo);
		like.setBoardNo(boardNo);
		
		int result = serviceB.deleteBoard(boardNo);

		String path = null;

		if(result > 0) {
			path = "redirect:list";
			MemberController.swalSetMessage(ra, "error", "게시글 삭제 성공",  null);
			serviceL.deleteLike(like);
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
	private List<Attachment> imgExtract(Board board) {
		
        // 저장할 빈 객체 생성
        String src = null;		// ajax로 서버저장되서 올라간 img의 src
        String filePath = null; // 저장할 위치
        String fileName = null; // 저장할 파일 이름
		int fileLv = 0; 		// 저장할 파일 LV
		List<Attachment> atList = new ArrayList<Attachment>(); // 파일 정보 담을 객체
		
		// img 태그 src 추출 정규표현식
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
        Matcher matcher = pattern.matcher(board.getBoardContent());     
        
        
        while(matcher.find()){
        	src=  matcher.group(0); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
            filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
            fileName = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.
            fileName = fileName.substring(0,fileName.indexOf("\"",0)); 
            		
            // Attachment 객체를 이용하여 DB에 파일 정보를 저장
            Attachment at = new Attachment(fileLv, filePath, fileName, board.getBoardNo());
            atList.add(at);
            fileLv ++;
         }

		
        return atList;
   	}
	

}