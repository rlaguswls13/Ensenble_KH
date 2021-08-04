package com.kh.ensemble.board.model.service;

import java.util.List;

import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Search;

public interface BoardService {

	// 목록조회
	Pagination getPagination(Pagination pg);
	List<Board> selectBoardList(Pagination pagination);
	
	// 목록조회(검색)
	Pagination getPagination(Search search, Pagination pg);
	List<Board> selectBoardList(Search search, Pagination pagination);

}
