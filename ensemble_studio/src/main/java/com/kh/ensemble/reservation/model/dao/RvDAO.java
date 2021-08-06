package com.kh.ensemble.reservation.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.reservation.model.vo.Rv;
import com.kh.ensemble.reservation.model.vo.RvPagination;

@Repository
public class RvDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public RvPagination getRvListCount(RvPagination pg) {
	
		
		return sqlSession.selectOne("rvMapper.getRvListCount", pg.getMemberNo());
	}

	public List<Rv> selectRvLIst(RvPagination pagination) {
		
		
		int offset = (pagination.getCurrentPage()- 1)* pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("rvMapper.selectRvList", pagination.getMemberNo() , rowBounds );
	}


	

}
