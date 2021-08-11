package com.kh.ensemble.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.vo.Like;

@RestController
@RequestMapping("/like/*")
@SessionAttributes({"loginMember","like"})
public class LikeController {

	@Autowired
	private LikeService serviceL;
	
	// 좋아요 조회
	@RequestMapping("selectLike")
	public Like selectLike(int loginMemberNo, int boardNo, Like like) {
		like.setMemberNo(loginMemberNo);
		like.setBoardNo(boardNo);
		return serviceL.selectLike(like);
	}
	
	// 좋아요 추가
	@RequestMapping("addLike")
	public int addLike(int loginMemberNo, int boardNo, Like like) {
		like.setMemberNo(loginMemberNo);
		like.setBoardNo(boardNo);
		return serviceL.addLike(like);
	}
	
	// 좋아요 삭제
	@RequestMapping("deleteLike")
	public int deleteLike(int loginMemberNo, int boardNo, Like like) {
		like.setMemberNo(loginMemberNo);
		like.setBoardNo(boardNo);
		return serviceL.deleteLike(like);
	}
}
