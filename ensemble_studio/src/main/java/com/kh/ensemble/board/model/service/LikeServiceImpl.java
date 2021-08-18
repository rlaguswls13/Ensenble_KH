package com.kh.ensemble.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ensemble.board.model.dao.LikeDAO;
import com.kh.ensemble.board.model.vo.Like;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeDAO dao;

	// 좋아요 조회
	@Override
	public Like selectLike(Like like) {
		return dao.selectLike(like);
	}
	
	// 좋아요 추가
	@Override
	public int addLike(Like like) {
		return dao.addLike(like);
	}
	
	// 좋아요 삭제
	@Override
	public int deleteLike(Like like) {
		return dao.deleteLike(like);
	}
	
	// 탈퇴회원 좋아요 삭제
	@Override
	public int deleteSecessionLike(Integer secessionMemberNo) {
		return dao.deleteSecessionLike(secessionMemberNo);
	}
	
	
	
}
