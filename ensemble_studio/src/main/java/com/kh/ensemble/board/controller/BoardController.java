package com.kh.ensemble.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.service.ReplyService;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Search;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember, boardList, pagination"})
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
					@RequestParam(value="cp", required=false, defaultValue="1") int cp,
					Model model, Pagination pg, Search search) {
		
		pg.setBoardTypeNo(boardTypeNo);	
		pg.setCurrentPage(cp);
		
		Pagination pagination = null;
		List<Board> boardList = null;
		
		if(search.getSk() == null) {
			pagination = serviceB.getPagination(pg);
			boardList = serviceB.selectBoardList(pagination);
		} else { 
			pagination = serviceB.getPagination(search, pg); 
			boardList = serviceB.selectBoardList(search, pagination);
		}
		model.addAttribute("boardList",boardList);
		model.addAttribute("pagination",pagination);
		
		if(boardTypeNo==1) { // 리뷰 게시판
			return "board/reviewBoardList";
		}else { // 일반 게시판
			return "board/normalBoardList";
		}
		
	}
	

}
