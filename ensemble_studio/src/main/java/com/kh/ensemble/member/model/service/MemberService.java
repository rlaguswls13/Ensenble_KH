package com.kh.ensemble.member.model.service;

import com.kh.ensemble.member.model.vo.Member;

public interface MemberService {

	
	
	/** 회원가입 Service
	 * @param inputMember
	 * @return result
	 */
	public abstract int signUp(Member inputMember);

	
	/** 아이디 중복검사 Service
	 * @param id
	 * @return result
	 */
	public abstract int idDupCheck(String id);

}
