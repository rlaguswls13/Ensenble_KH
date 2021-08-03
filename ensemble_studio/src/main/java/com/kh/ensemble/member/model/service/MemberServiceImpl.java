package com.kh.ensemble.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ensemble.member.model.dao.MemberDAO;
import com.kh.ensemble.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberDAO dao;
	
	// 회원가입 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member inputMember) {

		String encPwd = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		inputMember.setMemberPw(encPwd);
		
		return dao.signUp(inputMember);
	}

	// 아이디 중복검사 Service
	@Override
	public int idDupCheck(String id) {
		
		return dao.idDupCheck(id);
	}

	// 로그인 Service
	@Override
	public Member login(Member inputMember) {
		
		// 입력받은 비밀번호 암호화
		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		Member loginMember = dao.login(inputMember.getMemberId());
		
		return loginMember;
	}

}
