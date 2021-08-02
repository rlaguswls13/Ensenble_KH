package com.kh.ensemble.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ensemble.board.model.dao.boardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private boardDAO dao;
}
