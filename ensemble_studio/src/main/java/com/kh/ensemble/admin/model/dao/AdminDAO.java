package com.kh.ensemble.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberId) {
		return sqlSession.selectOne("adminMapper.login", memberId);
	}
	
	public Pagination getMemberListCount() {
		return sqlSession.selectOne("adminMapper.getMemberListCount");
	}

	public List<Member> memberList(Pagination pg) {
		int offset = (pg.getCurrentPage()-1) * pg.getLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		
		return sqlSession.selectList("adminMapper.memberList", pg, rowBounds);
	}


}
