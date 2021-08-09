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

		return sqlSession.selectOne("memberMapper.login", memberId);
	}


	/** 회원정보수정 DAO
	 * @param inputMember
	 * @return result
	 */
	public int updateMember(Member inputMember) {
		
		return sqlSession.update("memberMapper.updateMember", inputMember);
	}


	/** 비밀번호 조회 DAO
	 * @param memberNo
	 * @return savaPwd
	 */
	public String selectPassword(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.selectPassword", memberNo);
	}


	/** 비밀번호 변경 DAO
	 * @param loginMember
	 * @return result
	 */
	public int changePwd(Member loginMember) {
		
		return sqlSession.update("memberMapper.changePwd", loginMember);
	}


	/** 회원 탈퇴 DAO
	 * @param loginMember
	 * @return result 
	 */
	public int secession(Member loginMember) {

		return sqlSession.update("memberMapper.secession", loginMember);
	}


	/** 회원 이미지 삭제
	 * @param memberNo
	 * @return result
	 */
	public int deleteMemberImage(int memberNo) {
		return sqlSession.update("memberMapper.deleteMemberImage", memberNo);
	}


	/** 비밀번호 변경
	 * @param member
	 */
	public int updatePwd(Member member) {
		return sqlSession.update("memberMapper.updatePwd", member);
		
	}


	/** 비번 찾기 회원 정보 조회
	 * @param memberId
	 * @return result
	 */
	public Member readMember(String memberId) {
		return sqlSession.selectOne("memberMapper.readMember", memberId);
	}


}
