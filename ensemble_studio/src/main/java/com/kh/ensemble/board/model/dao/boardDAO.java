package com.kh.ensemble.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;

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
	

}
