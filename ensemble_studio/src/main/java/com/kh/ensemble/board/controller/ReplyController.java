package com.kh.ensemble.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ensemble.board.model.service.ReplyService;
import com.kh.ensemble.board.model.vo.Attachment;
import com.kh.ensemble.board.model.vo.Reply;
import com.kh.ensemble.member.model.vo.Member;

@RestController
@RequestMapping("/reply/*")
@SessionAttributes({"loginMember"})
public class ReplyController {
	
	@Autowired
	private ReplyService serviceR;
	
	// 댓글 목록 조회
	@RequestMapping(value="list", method=RequestMethod.POST)
	public String selectReply(int boardNo) {
		List<Reply> rList = serviceR.selectList(boardNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(rList);
	}
	
	// 댓글 삽입
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public int insertReply(Reply reply) {
		return serviceR.insertReply(reply);
	}
	
	// 댓글 수정
	@RequestMapping(value="updateReply", method=RequestMethod.POST)
	public int updateReply(Reply reply) {
		return serviceR.updateReply(reply);
	}
	
	// 댓글 삭제
	@RequestMapping(value="deleteReply", method=RequestMethod.GET)
	public int deleteReply(int replyNo) {
		return serviceR.deleteReply(replyNo);
	}
	
	// 댓글 신고
	@RequestMapping(value="reportReply", method=RequestMethod.GET)
	public int reportReply(int replyNo) {
		return serviceR.reportReply(replyNo);
	}
}
