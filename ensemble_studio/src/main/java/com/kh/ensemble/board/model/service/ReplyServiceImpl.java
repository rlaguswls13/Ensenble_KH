package com.kh.ensemble.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ensemble.board.model.dao.ReplyDAO;
import com.kh.ensemble.board.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO dao;

	// 댓글 목록 조회
	@Override
	public List<Reply> selectList(int boardNo) {
		return dao.selectList(boardNo);
	}
	
	
	
}
