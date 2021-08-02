package com.kh.ensemble.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.service.ReplyService;

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
	
	// 일반 게시글 목록 조회
	
	// 리뷰 게시글 
	

}
