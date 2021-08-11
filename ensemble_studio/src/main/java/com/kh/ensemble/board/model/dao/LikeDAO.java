package com.kh.ensemble.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.board.model.vo.Like;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 좋아요 조회
	public Like selectLike(Like like) {
		return sqlSession.selectOne("likeMapper.selectLike", like);
	}
	
	// 좋아요 추가
	public int addLike(Like like) {
		return sqlSession.insert("likeMapper.addLike", like);
	}
	
	// 좋아요 삭제
	public int deleteLike(Like like) {
		return sqlSession.delete("likeMapper.deleteLike", like);
	}
}
