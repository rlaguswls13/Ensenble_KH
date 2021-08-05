package com.kh.ensemble.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	
	// 전체 게시글 수 + 게시판 이름 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		// 1) 전체 게시글 수 조회
		Pagination selectPg = dao.getListCount(pg.getBoardTypeNo());

		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(),selectPg.getListCount(),
							pg.getBoardTypeNo(), selectPg.getBoardName(),
							pg.getBoardCTNo(), pg.getBoardCTNm());
	}

	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return dao.selectBoardList(pagination);		
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
