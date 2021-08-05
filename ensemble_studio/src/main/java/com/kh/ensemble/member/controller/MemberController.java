package com.kh.ensemble.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.member.model.service.MemberService;
import com.kh.ensemble.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({ "loginMember" })
public class MemberController {

	@Autowired
	private MemberService service;

	// 로그인 화면 전환 Controller
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
		// /WEB-INF/views/member/login.jsp
	}

	// 로그인 Controller
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String memberLogin(Member inputMember, Model model, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes ra, @RequestParam(value = "save", required = false) String save) {

		Member loginMember = service.login(inputMember);

		if (loginMember != null) { // 로그인 성공 시
			model.addAttribute("loginMember", loginMember);

			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());

			if (save != null) { // 아이디저장 체크박스가 체크된 경우

				cookie.setMaxAge(60 * 60 * 24 * 30); // 한 달 유지

			} else { // 아이디저장 체크박스가 체크되지 않은 경우

				cookie.setMaxAge(0); // 쿠키 없애기

			}

			// 쿠키 사용 유효 경로 설정
			cookie.setPath(request.getContextPath()); // 최상위 경로(/ensemble) 아래 모든 경로 적용

			// 응답에 Cookie를 담아서 클라이언트에게 전달
			response.addCookie(cookie);

			System.out.println(loginMember);

		} else { // 로그인 실패 시

			HttpSession session = request.getSession();
			session.setAttribute("icon", "error");
			session.setAttribute("title", "로그인 실패");
			session.setAttribute("text", "아이디 또는 비밀번호를 확인해주세요.");

		}

		return "redirect:/";
	}

	// 로그아웃 Controller
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, @RequestHeader("referer") String referer) {

		status.setComplete();

		return "redirect:/";
	}

	// 회원가입 화면 전환 Controller
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUp() {
		return "member/signUp";
	}

	// 회원 가입 Controller
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(@ModelAttribute Member inputMember, RedirectAttributes ra) {

		int result = service.signUp(inputMember);

		if (result > 0) {
			swalSetMessage(ra, "success", "회원가입 성공", inputMember.getMemberNick() + "님 환영합니다!");
		} else {
			swalSetMessage(ra, "error", "회원가입 실패", "고객센터로 문의해주세요.");
		}

		return "redirect:/";
	}

	// 아이디 중복 검사 Controller(ajax)
	@ResponseBody
	@RequestMapping(value = "idDupCheck", method = RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {

		int result = service.idDupCheck(id);

		return result;
	}

	// 마이페이지 화면 전환 Controller
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(@ModelAttribute Member inputMember) {

		return "member/myPage";
	}

	// 회원정보 수정 화면 전환 Controller
	@RequestMapping(value = "updateMember", method = RequestMethod.GET)
	public String updateMember(@ModelAttribute("loginMember") Member loginMember) {

		return "member/updateMember";
	}

	// 회원정보 수정 Controller
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("loginMember") Member loginMember, String inputEmail, String inputPhone,
			String inputNick, @RequestParam("file") MultipartFile file, Member inputMember, RedirectAttributes ra,
			HttpServletRequest request) {

		inputMember.setMemberNo(loginMember.getMemberNo());
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberPhone(inputPhone);
		inputMember.setMemberNick(inputNick);

		// 실제로 파일이 저장되는 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/member/");

		String fileName = null;

		if (!file.getOriginalFilename().equals("")) { // 업로드된 이미지가 있을 때
			// 파일 이름 바꿔오기
			fileName = service.rename(file.getOriginalFilename());
			inputMember.setMemberImage("/resources/images/member/" + fileName);
		}

		// 회원 정보 수정 Service
		int result = service.updateMember(inputMember, savePath, file, fileName);

		if (result > 0) {
			swalSetMessage(ra, "success", "회원정보 수정 성공!", null);

			if (!file.getOriginalFilename().equals("")) { // 업로드된 이미지가 있을 때
				loginMember.setMemberImage("/resources/images/member/" + fileName);
			}

			loginMember.setMemberEmail(inputEmail);
			loginMember.setMemberPhone(inputPhone);
			loginMember.setMemberNick(inputNick);

		} else {
			swalSetMessage(ra, "error", "회원정보 수정 실패", null);
		}
		return "redirect:/member/myPage";
	}

	// 비밀번호 변경 화면 전환 Controller
	@RequestMapping(value = "changePwd", method = RequestMethod.GET)
	public String changePwd() {
		return "member/changePwd";
	}

	// 비밀번호 변경 Controller
	@RequestMapping(value = "changePwd", method = RequestMethod.POST)
	public String changePwd(@RequestParam("currentPwd") String currentPwd, @RequestParam("newPwd1") String newPwd,
			@ModelAttribute("loginMember") Member loginMember, RedirectAttributes ra) {

		int result = service.changePwd(currentPwd, newPwd, loginMember);

		String path = "redirect:";

		if (result > 0) { // 비밀번호 변경 성공
			swalSetMessage(ra, "success", "비밀번호가 변경되었습니다.", null);
			path += "myPage";
		} else {
			swalSetMessage(ra, "error", "비밀번호 변경 실패", "다시 확인해주세요.");
			path += "changePwd";
		}
		return path;
	}

	// 회원 탈퇴 화면 전환 Controller
	@RequestMapping(value="secession", method=RequestMethod.GET) 
	public String secession() {
		return "member/secession";
	}
	
	
	// 회원 탈퇴 화면 전환 Controller
	@RequestMapping(value="secession", method=RequestMethod.POST) 
	public String secession( @RequestParam("currentPwd") String currentPwd,
							@ModelAttribute("loginMember") Member loginMember,
							RedirectAttributes ra,
							SessionStatus status) {
	 
		int result = service.secession(currentPwd, loginMember);
		
		String path = "redirect:";
		
		System.out.println(result);
		if(result > 0) {
			swalSetMessage(ra, "success", "이용해주셔서 감사합니다.", null);
			status.setComplete(); // 세션 만료
			path += "/"; // 메인 페이지
		} else { 
			swalSetMessage(ra, "error", "회원 탈퇴 실패", null);
			path += "secession";
		}
		return path;
	}
	 

	// SweetAlert를 이용한 메세지 전달용 메소드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		// RedirectAttributes : 리다이렉트 시 값을 전달하는 용도의 객체
		// 객체를 참조하는 주소만 넘어옴.

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);

	}

}
