package com.kh.ensemble.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.board.model.vo.Board;

@Repository
public class MainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Room> selectRoomList() {
		return sqlSession.selectList("mainMapper.selectRoomList");
	}

	public Room selectRoom(String roomHref) {
		return sqlSession.selectOne("mainMapper.selectRoom", roomHref);
	}

	public List<Board> selectNoticeList() {
		return sqlSession.selectList("mainMapper.selectNoticeList");
	}

	public List<Board> selectReviewList(String roomName) {
		return sqlSession.selectList("mainMapper.selectReviewList", roomName);
	}

	public int countReview(String roomName) {
		return sqlSession.selectOne("mainMapper.countReview",roomName);
	}
	
	
}
