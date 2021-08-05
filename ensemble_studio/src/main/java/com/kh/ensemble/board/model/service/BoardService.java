package com.kh.ensemble.board.model.service;

import java.util.List;

import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Search;
import com.kh.ensemble.board.model.vo.Type;

public interface BoardService {

	// 목록조회
	Pagination getPagination(Pagination pg);
	List<Board> selectBoardList(Pagination pagination);
	
	// 목록조회(검색)
	Pagination getPagination(Search search, Pagination pg);
	List<Board> selectBoardList(Search search, Pagination pagination);
	
	// 게시글 상세조회
	Board selectBoard(int boardNo);
	
	// 게시글 타입조회
	List<Type> selectType(int boardTypeNo);
	Type selectboardType(int boardTypeNo);

}
