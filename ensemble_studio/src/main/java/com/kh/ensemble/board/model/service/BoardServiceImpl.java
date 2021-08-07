package com.kh.ensemble.board.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ensemble.board.exception.SaveFileException;
import com.kh.ensemble.board.model.dao.boardDAO;
import com.kh.ensemble.board.model.vo.Attachment;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Search;
import com.kh.ensemble.board.model.vo.Type;

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
	// 게시판 pagination
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
	
	// 게시글 상세조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {
		
		Board board = dao.selectBoard(boardNo);
		
		if(board != null) {
			dao.increaseReadCount(boardNo);
			board.setBoardReadCount(board.getBoardReadCount() + 1);
		}			
		return board;
	}
	
	// 특정 게시판 카테고리 조회
	@Override
	public List<Type> selectType(int boardTypeNo) {
		return dao.selectType(boardTypeNo);
	}
	@Override
	public Type selectboardType(int boardTypeNo) {
		return dao.selectboardType(boardTypeNo);
	}
	
	// 파일 서버 저장
	@Override
	public String uploadFile(MultipartFile file, String savePath) {
		
		String fileName = rename(file.getOriginalFilename());
		String realPath = savePath + fileName;
		
		try {
			file.transferTo(new File(realPath));
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			throw new SaveFileException();	
		}		
	}
	
	
	
	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Board board) {
		return dao.insertBoard(board);
	}
	
	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}
	
	// 게시글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(int boardNo) {
		
		int result = 0;
		
		Attachment sResult = dao.selectAttachment(boardNo);	
		
		if(sResult != null) {
			result = dao.deleteAttachment(boardNo);
			if(result == 0 ) result = dao.deleteBoard(boardNo);
		} else result = dao.deleteBoard(boardNo);
		
		return result;
	}
	
	
	// 파일명 변경 메소드
	private String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
	
	
	
}
