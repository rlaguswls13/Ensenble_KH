package com.kh.ensemble.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.board.model.vo.Attachment;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Type;

@Repository
public class boardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 게시판 전체 게시글 수 조회
	 * @param boardTypeNo
	 * @return pagination
	 */
	public Pagination getListCount(int boardTypeNo) {
		return sqlSession.selectOne("boardMapper.getListCount", boardTypeNo);
	}

	/** 게시글 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("boardMapper.selectBoardList", pagination.getBoardTypeNo(), rowBounds);
	}

	/** 특정 게시글 상세 조회
	 * @param boardNo
	 * @return board
	 */
	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}

	/** 특정 게시글 조회수 증가
	 * @param boardNo
	 */
	public void increaseReadCount(int boardNo) {
		sqlSession.update("boardMapper.increaseReadCount",boardNo);
	}

	/** 특정 게시판 카테고리 조회
	 * @return type
	 */
	public List<Type> selectType(int boardTypeNo) {
		return sqlSession.selectList("boardMapper.selectType", boardTypeNo);
	}
	public Type selectboardType(int boardTypeNo) {
		return sqlSession.selectOne("boardMapper.selectboardType", boardTypeNo);
	}

	
	/** 게시글 삽입
	 * @param board
	 * @return boardNo
	 */
	public int insertBoard(Board board) {
		
		int result = sqlSession.insert("boardMapper.insertBoard", board);

		if(result > 0) {
			return board.getBoardNo();
		}else {
			return 0;
		}
	}
	/** 파일 정보 DB 삽입
	 * @param atFile
	 */
	public void insertAt(List<Attachment> atList) {
		sqlSession.insert("boardMapper.insertAt", atList);
	}
	

	/** 특정 게시글 수정
	 * @param board
	 * @return result
	 */
	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}


	/** 특정 게시글 삭제
	 * @param boardNo
	 * @return result
	 */
	public int deleteBoard(int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	/** 특정 게시글 첨부 파일 갯수 조회
	 * @param boardNo
	 * @return rResult
	 */
	public Attachment selectAttachment(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectAttachment", boardNo);
	}

	/** 특정 게시글 첨부 파일 정보 삭제
	 * @param boardNo
	 * @return result
	 */
	public int deleteAttachment(int boardNo) {
		return sqlSession.delete("boardMapper.deleteAttachment", boardNo);
	}

	
	
	
	
	
	
	
	
	
	/** 파일 정보 DB 수정
	 * @param atFile
	 */
	public void updateAt(List<Attachment> atList) {
		sqlSession.update("boardMapper.updateAt", atList);
	}
	/** 특정 게시글 일부 첨부 파일 정보 삭제
	 * @param atList
	 */
	public void deleteAt(List<Attachment> atList) {
		sqlSession.delete("boardMapper.deleteAt", atList);
	}




	
	

}
