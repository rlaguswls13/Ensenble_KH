package com.kh.ensemble.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 회원가입 DAO
	 * @param inputMember
	 * @return result
	 */
	public int signUp(Member inputMember) {
		
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}


	/** 아이디 중복검사 DAO
	 * @param id
	 * @return result
	 */
	public int idDupCheck(String id) {

		return sqlSession.selectOne("memberMapper.idDupCheck", id);
	}


	/** 로그인 DAO
	 * @param memberId
	 * @return loginMember
	 */
	public Member login(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.login", memberId);
	}

}
