package com.kh.ensemble.board.model.service;

import java.util.List;

import com.kh.ensemble.board.model.vo.Reply;

public interface ReplyService {

	// 댓글 조회
	List<Reply> selectList(int boardNo);
	
	// 신고 댓글 조회
	List<Reply> selectReportList(Reply reply);
	
	// 댓글 삽입
	int insertReply(Reply reply);

	// 댓글 수정
	int updateReply(Reply reply);

	// 댓글 삭제
	int deleteReply(int replyNo);

	// 댓글 신고
	int reportReply(Reply reply);

}
