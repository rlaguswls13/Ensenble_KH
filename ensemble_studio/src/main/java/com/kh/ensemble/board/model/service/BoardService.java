package com.kh.ensemble.board.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	// 파일 서버 저장
	String uploadFile(MultipartFile file, String savePath);
	
	// 게시글 삽입
	int insertBoard(Board board);
	
	// 게시글 수정
	int updateBoard(Board board);
	
	// 게시글 삭제
	int deleteBoard(int boardNo);
	

}
