package com.kh.ensemble.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ensemble.board.model.dao.boardDAO;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Search;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private boardDAO dao;

	@Override
	public Pagination getPagination(Pagination pg) {
		return null;
	}

	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return null;
	}

	@Override
	public Pagination getPagination(Search search, Pagination pg) {
		return null;
	}

	@Override
	public List<Board> selectBoardList(Search search, Pagination pagination) {
		return null;
	}
	
	
}
