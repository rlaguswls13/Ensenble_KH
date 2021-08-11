package com.kh.ensemble.member.model.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

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


	/** 로그인 Service
	 * @param inputMember
	 * @return result
	 */
	public abstract Member login(Member inputMember);


	/** 회원정보 수정 Service
	 * @param inputMember
	 * @param file 
	 * @param savePath 
	 * @param fileName 
	 * @param deleteCheck 
	 * @return result
	 */
	public abstract int updateMember(Member inputMember, String savePath, MultipartFile file, String fileName, int deleteCheck);


	/** 파일명 변경 메소드
	 * @param originalFilename
	 * @return result
	 */
	public abstract String rename(String originalFilename);


	/** 비밀번호 변경 Service
	 * @param currentPwd
	 * @param newPwd
	 * @param loginMember
	 * @return result
	 */
	public abstract int changePwd(String currentPwd, String newPwd, Member loginMember);


	/** 회원 탈퇴 Service 
	 * @param currentPwd
	 * @param loginMember
	 * @return result
	 */
	
	
	public abstract int secession(String currentPwd, Member loginMember);

	/** 이메일 발송 Service
	 * @param member
	 * @param div
	 * @throws Exception
	 */
	public abstract void sendEmail(Member member, String div) throws Exception;

	/** 비밀번호 찾기 Service
	 * @param response
	 * @param member
	 */
	public abstract int findPwd(HttpServletResponse response, Member findMember) throws Exception;


	/** 아이디 찾기 Service
	 * @param inputName
	 * @param inputEmail
	 * @return result
	 */
	public abstract String findId(Member findMember) throws Exception;




}
