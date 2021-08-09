package com.kh.ensemble.member.model.service;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ensemble.board.exception.SaveFileException;
import com.kh.ensemble.member.model.dao.MemberDAO;
import com.kh.ensemble.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

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

		if (loginMember != null) {

			if (!bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {

				loginMember = null;

			} else {
				loginMember.setMemberPw(null);
			}
		}

		return loginMember;
	}

	// 회원정보수정 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member inputMember, String savePath, MultipartFile file, String fileName, int deleteCheck) {

		int result = dao.updateMember(inputMember);
		// System.out.println("deleteCheck : " + deleteCheck);
		if (deleteCheck == 1) { // 삭제한 경우에만
			result = dao.deleteMemberImage(inputMember.getMemberNo());
			// System.out.println("삭제 결과 : " + result);
		}

		if (file.getOriginalFilename() != null) { // 업로드된 이미지가 있을 때

			try {
				// 저장명 바꿔주기
				file.transferTo(new File(savePath + fileName));

			} catch (Exception e) {
				e.printStackTrace();
				throw new SaveFileException();
			}
		}

		return result;
	}

	// 비밀번호 변경 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changePwd(String currentPwd, String newPwd, Member loginMember) {

		// DB에 저장되어있는 현재 회원의 비밀번호 조회
		String savePwd = dao.selectPassword(loginMember.getMemberNo());

		int result = 0;

		if (bCryptPasswordEncoder.matches(currentPwd, savePwd)) {

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

		if (bCryptPasswordEncoder.matches(currentPwd, savePwd)) {

			result = dao.secession(loginMember);
		}
		return result;
	}

	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}

	// 메일 발송 메소드
	@Override
	public void sendEmail(Member member, String div) throws Exception {

		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if (div.equals("findpwd")) {
			subject = "베프마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMemberPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getMemberEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	// 비밀번호 찾기 메소드
	@Override
	public void findPwd(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Member ck = dao.readMember(member.getMemberId());
		PrintWriter out = response.getWriter();
		

		// 가입된 아이디가 없으면
		if (dao.readMember(member.getMemberId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!member.getMemberEmail().equals(ck.getMemberEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setMemberPw(pw);
			// 비밀번호 변경
			dao.updatePwd(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}

	}

}
