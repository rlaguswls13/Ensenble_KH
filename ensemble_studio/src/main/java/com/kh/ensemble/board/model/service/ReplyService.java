package com.kh.ensemble.board.model.service;

import java.util.List;

import com.kh.ensemble.board.model.vo.Reply;

public interface ReplyService {

	// 게시글 댓글 조회
	List<Reply> selectList(int boardNo);

}
