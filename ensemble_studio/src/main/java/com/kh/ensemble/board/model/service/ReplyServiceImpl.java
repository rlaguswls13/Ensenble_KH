package com.kh.ensemble.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	// 신고 댓글 조회
	@Override
	public List<Reply> selectReportList(Reply reply) {
		return dao.selectReportList(reply);
	}

	// 댓글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Reply reply) {
		reply.setReplyContent(replaceParameter(reply.getReplyContent()));
		reply.setReplyContent(reply.getReplyContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.insertReply(reply);
	}
	
	// 댓글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReply(Reply reply) {
		reply.setReplyContent(replaceParameter( reply.getReplyContent()));
		reply.setReplyContent(  reply.getReplyContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		return dao.updateReply(reply);
	}

	// 댓글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReply(int replyNo) {
		return dao.deleteReply(replyNo);
	}
	
	
	// 댓글 신고
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reportReply(int replyNo) {
		return dao.reportReply(replyNo);
	}
	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}
	
}
