package com.kh.ensemble.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.service.ReplyService;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Reply;
import com.kh.ensemble.board.model.vo.Search;
import com.kh.ensemble.board.model.vo.Type;
import com.kh.ensemble.member.controller.MemberController;
import com.kh.ensemble.member.model.vo.Member;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({ "loginMember, boardList, pagination" })
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
	public String boardView(@PathVariable("boardTypeNo") int boardTypeNo, @PathVariable("boardNo") int boardNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
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

	// 게시글 삽입
	/*
	 * @RequestMapping(value="{boardTypeNo}/insert", method=RequestMethod.POST)
	 * public String insertBoard(@PathVariable("boardTypeNo") int boardTypeNo,
	 * 
	 * @ModelAttribute Board board, 커맨드객체
	 * 
	 * @ModelAttribute("loginMember") Member loginMember, HttpServletRequest
	 * request, RedirectAttributes ra ) { // 1) 로그인된 회원 정보에서 회원 번호를 얻어와 board 커맨드
	 * 객체에 세팅 board.setMemberNo( loginMember.getMemberNo() );
	 * 
	 * // 2) @PathVariable boardType을 board 커맨드 객체에 세팅
	 * board.setBoardTypeNo(boardTypeNo);
	 * 
	 * // 3) 웹상 접근 경로, 실제 파일 저장 경로 지정 String webPath = "resources/images/";
	 * 
	 * // 게시판 타입에 따라 업로드되는 파일의 경로를 지정 switch(boardTypeNo) { case 1 : webPath +=
	 * "freeboard/"; break; }
	 * 
	 * // 실제로 파일이 저장되는 경로 얻어오기 String savePath =
	 * request.getSession().getServletContext().getRealPath(webPath);
	 * 
	 * 
	 * // 4) 게시글 삽입 Service 호출 // int boardNo = serviceB.insertBoard(board, webPath,
	 * savePath); // 변수명이 boardNo인 이유? // -> 삽입 성공 시 해당 번호 글로 상세조회 하기 위해
	 * 
	 * 
	 * String path = null; if(boardNo > 0) { // 삽입 성공 // 상세 조회 페이지로 리다이렉트 ->
	 * /fin/board/1/600 // 현재 페이지 -> /fin/board/1/insert path = "redirect:" +
	 * boardNo; MemberController.swalSetMessage(ra, "success", "게시글 삽입 성공", null);
	 * 
	 * } else { // 삽입 실패 // 이전 게시글 작성 화면으로 리다이렉트 path = "redirect:" +
	 * request.getHeader("referer"); // 요청 이전 주소 MemberController.swalSetMessage(ra,
	 * "error", "게시글 삽입 실패", null); }
	 * 
	 * 
	 * return path; }
	 */

	// 게시글 첨부 파일 저장
	@RequestMapping(value = "insertImage", method = RequestMethod.POST)
	@ResponseBody
	public String insertImage(@PathVariable("boardTypeNo") int boardTypeNo,
			@ModelAttribute("loginMember") Member loginMember, HttpServletRequest request, RedirectAttributes ra) {

		// 3) 웹상 접근 경로, 실제 파일 저장 경로 지정
		String webPath = "resources/images/board";

		// 게시판 타입에 따라 업로드되는 파일의 경로를 지정
		switch (boardTypeNo) {
		case 1:
			webPath += "review/";
			break;
		case 2:
			webPath += "notice/";
			break;
		case 3:
			webPath += "FAQ/";
			break;
		case 4:
			webPath += "normalCS/";
			break;
		}
		String savePath = request.getSession().getServletContext().getRealPath(webPath);

		return null;
	}

	// SweetAlert 메소드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);

	}
}
