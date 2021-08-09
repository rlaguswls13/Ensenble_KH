package com.kh.ensemble.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO dao;

	@Override
	public List<Room> selectRoomList() {
		return dao.selectRoomList();
	}

	@Override
	public Room selectRoom(int roomNo) {
		return dao.selectRoom(roomNo);
	}
	
}
