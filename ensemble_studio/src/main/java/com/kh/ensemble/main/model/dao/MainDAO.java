package com.kh.ensemble.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.admin.model.vo.Room;

@Repository
public class MainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Room> selectRoomList() {
		return sqlSession.selectList("mainMapper.selectRoomList");
	}
	
	
}
