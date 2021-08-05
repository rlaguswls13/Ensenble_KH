package com.kh.ensemble.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ensemble.board.exception.SaveFileException;
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
		
		if(loginMember != null) {
			
			if(!bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw()) ) {
				
			loginMember = null;
			
			}else {
				loginMember.setMemberPw(null);
			}
		}
		
		return loginMember;
	}

	// 회원정보수정 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member inputMember, String savePath, MultipartFile file, String fileName) {
		
		if(file.getOriginalFilename() != null) { // 업로드된 이미지가 있을 때 
			
			try {
				// 저장명 바꿔주기
				file.transferTo( new File(savePath + fileName));
				
			}catch(Exception e) {
				e.printStackTrace();
				throw new SaveFileException();
			}
		}
		
		return dao.updateMember(inputMember);
	}

	
	// 비밀번호 변경 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changePwd(String currentPwd, String newPwd, Member loginMember) {
		
		// DB에 저장되어있는 현재 회원의 비밀번호 조회
		String savePwd = dao.selectPassword(loginMember.getMemberNo());
		
		int result = 0;
		
		if(bCryptPasswordEncoder.matches(currentPwd, savePwd)) {
			
			// 새 비밀번호 암호화
			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			
			loginMember.setMemberPw(encPwd);
			
			result = dao.changePwd(loginMember);
			
			loginMember.setMemberPw(null);
		}
		return result;
	}
	
	
	// 회원 탈퇴 Service
	@Override
	public int secession(String currentPwd, Member loginMember) {
		
		String savePwd = dao.selectPassword(loginMember.getMemberNo());
		
		int result = 0;
		
		if(bCryptPasswordEncoder.matches(currentPwd, savePwd)) {
			
			result = dao.secession(loginMember);
		}
		return result;
	}
	
	
	
	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}




}
