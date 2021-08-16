package com.kh.ensemble.reservation.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Option;
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

	
	
	

	public List<Rv> selectRvTimeList(Rv rv) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("rvMapper.selectRvTimeList", rv);
	}

	//selectOption
	public List<Option> selectOption() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("rvMapper.selectOption");
	}
	//예약하기 DAO
	public int reservation(Rv rv) {
	
		return sqlSession.insert("rvMapper.reservation", rv);
	}

	public int setOptionNo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("rvMapper.setOptionNo", map);
	}

	public List<Rv> rvStatusList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("rvMapper.rvStatusList");
	}

	

}
