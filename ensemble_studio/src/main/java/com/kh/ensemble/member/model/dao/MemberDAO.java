package com.kh.ensemble.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.member.model.vo.Animal;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Rv;

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


	/** 아이디 찾기 조회 
	 * @param inputName
	 * @param inputEmail
	 * @return
	 */
	public String findId(Member findMember) {
		
		return sqlSession.selectOne("memberMapper.findId", findMember);
	}

	/** 네이버 로그인 DAO
	 * @param navermember
	 * @return result
	 */
	public Member naverLogin(Member navermember) {
		
		return sqlSession.selectOne("memberMapper.naverLogin", navermember);
	}


	/** 네이버 DB에 저장 DAO
	 * @param navermember
	 * @return result
	 */
	public int naverSignUp(Member navermember) {
		
		return sqlSession.insert("memberMapper.naverSignUp", navermember);
	}

	
	//--------------------------------------------------------------------
	
	public int insertAnimal(Animal animal) {
		int result= sqlSession.insert("memberMapper.insertAnimal", animal);
		if(result>0) {
			return animal.getAniNo();
		}
		return 0;
	}


	public int deleteAnimal(int aniNo) {
		return sqlSession.delete("memberMapper.deleteAnimal", aniNo);
	}

	public Animal selectAnimal(int aniNo) {
		return sqlSession.selectOne("memberMapper.selectOneAnimal", aniNo);
	}


	public int updateAnimal(Animal animal) {
		return sqlSession.update("memberMapper.updateAnimal", animal);
	}


	public List<Rv> selectRvList(int memberNo) {
		return sqlSession.selectList("memberMapper.selectRvList", memberNo);
	}
	
	//--------------------------------------------------------------------

	// 탈퇴회원 멤버
	public List<Integer> selectSecessionMember() {
		return sqlSession.selectList("memberMapper.selectSecessionMember");
	}
}
