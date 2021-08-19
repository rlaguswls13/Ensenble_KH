package com.kh.ensemble.member.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.auth.SNSLogin;
import com.kh.ensemble.auth.SnsValue;
import com.kh.ensemble.member.model.service.MemberService;
import com.kh.ensemble.member.model.vo.Animal;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Rv;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({ "loginMember" })
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Inject
	private SnsValue naverSns;
	
	// 소셜로그인 한 결과가 나올 화면 Controller
	@RequestMapping(value = "/auth/naver/callBack", method = RequestMethod.GET)
	public String snsLoginCallback(Model model, @RequestParam("code") String code, HttpSession session,
								HttpServletRequest request, HttpServletResponse response,
								RedirectAttributes ra) throws Exception {

		SnsValue sns = null;
		Member member = null;
		Member navermember = null;
		int result = 0;
		
		sns = naverSns;

		SNSLogin snsLogin = new SNSLogin(sns);

		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		navermember = snsLogin.getUserProfile(code); // 1, 2번 동시

		// 3. DB에 해당 유저가 존재하는지 체크
		member = service.naverLogin(navermember); 
		
		if(member == null) { // 가입되지 않은 회원일 때
			
			result = service.naverSingUp(navermember); // 가입을 시킴 
		
			model.addAttribute("loginMember", member);
			
			if(result > 0) { // 가입이 됐다면
				model.addAttribute("loginMember", member);
				
				return "redirect:/";
				
			} else {
				swalSetMessage(ra, "회원 가입 실패", "고객센터에 문의하세요.", null);
			}
		}else { // 가입된 회원일 때
			model.addAttribute("loginMember", member);
		}
		return "redirect:/";
	}

	// 로그인 화면 전환 Controller
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		
		SNSLogin naverLogin = new SNSLogin(naverSns);
	      model.addAttribute("naver_url", naverLogin.getNaverAuthURL());
	      
		return "member/login";
		// /WEB-INF/views/member/login.jsp
	}

	// 로그인 Controller
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String memberLogin(Member inputMember, Model model, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes ra, @RequestParam(value = "save", required = false) String save) {

		String path = "redirect:";
		
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

			path += "/";
			
			System.out.println(loginMember);

		} else { // 로그인 실패 시

			HttpSession session = request.getSession();
			session.setAttribute("icon", "error");
			session.setAttribute("title", "로그인 실패");
			session.setAttribute("text", "아이디 또는 비밀번호를 확인해주세요.");

			path += "login";
		}

		return path;
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
	public String myPage(@ModelAttribute("loginMember") Member loginMember, Model model) {
		
		List<Rv> rvList = service.selectRvList(loginMember.getMemberNo());
		
		model.addAttribute("rvList", rvList);
		
		return "member/myPage";
	}
	
	//반려동물 정보 추가하기 화면전환
	@RequestMapping(value = "insertAnimal", method = RequestMethod.GET)
	public String insertAnimal() {
		return "member/insertPet";
	}
	
	
	//반려동물 정보 추가하기
	@RequestMapping(value = "insertAnimal", method = RequestMethod.POST)
	public String insertAnimal(@ModelAttribute("loginMember") Member loginMember, Animal animal, RedirectAttributes ra) {
		
		animal.setMemberNo(loginMember.getMemberNo());
		System.out.println(animal);
		
		int aniNo = service.insertAnimal(animal);
		if(aniNo>0) {
			swalSetMessage(ra, "success", "반려동물 정보 추가 성공", null);
			animal.setAniNo(aniNo);
			loginMember.getAniList().add(animal);
			
		}else {
			swalSetMessage(ra, "error", "반려동물 정보 추가 실패", null);
		}
		return "redirect:/member/myPage";
	}
	
	//반려동물 정보 수정 화면 전환
	@RequestMapping(value = "updateAnimal/{aniNo}", method = RequestMethod.GET)
	public String updateAnimal(@PathVariable("aniNo") int aniNo, Model model) {
		
		Animal ani = service.selectAnimal(aniNo);
		model.addAttribute("ani", ani);
		return "member/updatePet";
	}
	
	//반려동물 정보 수정 화면 전환
	@RequestMapping(value = "updateAnimal/{aniNo}", method = RequestMethod.POST)
	public String updateAnimal(@PathVariable("aniNo") int aniNo,
								@ModelAttribute("loginMember") Member loginMember, 
								Animal animal, RedirectAttributes ra) {
		animal.setAniNo(aniNo);
		int result = service.updateAnimal(animal);
		if(result>0) {
			swalSetMessage(ra, "success", "반려동물 정보 수정 성공", null);
			for(Animal a : loginMember.getAniList()) {
				if(a.getAniNo()== animal.getAniNo()) {
					a.setAniAge(animal.getAniAge());
					a.setAniGender(animal.getAniGender());
					a.setAniKg(animal.getAniKg());
					a.setAniName(animal.getAniName());
					a.setAniType(animal.getAniType());
				}
			}
		}else {
			swalSetMessage(ra, "error", "반려동물 정보 수정 실패", null);
		}
		
		return "redirect:/member/myPage";
	}

	//반려동물 정보 삭제하기
	@ResponseBody
	@RequestMapping(value = "deleteAnimal", method = RequestMethod.POST)
	public int deleteAnimal(@ModelAttribute("loginMember") Member loginMember, int aniNo) {
		int result= service.deleteAnimal(aniNo);
		if(result>0) {
			for(int i=0; i<loginMember.getAniList().size(); i++) {
				if(loginMember.getAniList().get(i).getAniNo()==aniNo) {
					loginMember.getAniList().remove(i);
				}
			}
		}
		return result; 
	}
	
	//------------------------------------------------------------------------
	
	// 회원정보 수정 화면 전환 Controller
	@RequestMapping(value = "updateMember", method = RequestMethod.GET)
	public String updateMember(@ModelAttribute("loginMember") Member loginMember) {

		return "member/updateMember";
	}

	// 회원정보 수정 Controller
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("loginMember") Member loginMember, String inputEmail, String inputPhone,
			String inputNick, @RequestParam("file") MultipartFile file, Member inputMember, RedirectAttributes ra,
			HttpServletRequest request, int deleteCheck) {

		inputMember.setMemberNo(loginMember.getMemberNo());
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberPhone(inputPhone);
		inputMember.setMemberNick(inputNick);

		System.out.println("inputMember : "+ inputMember);
		// 실제로 파일이 저장되는 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/member/");

		String fileName = null;

		if (!file.getOriginalFilename().equals("")) { // 업로드된 이미지가 있을 때
			// 파일 이름 바꿔오기
			fileName = service.rename(file.getOriginalFilename());
			inputMember.setMemberImage("/resources/images/member/" + fileName);
		}
		// 회원 정보 수정 Service
		int result = service.updateMember(inputMember, savePath, file, fileName, deleteCheck);

		if (result > 0) {
			swalSetMessage(ra, "success", "회원정보 수정 성공!", null);

			if (!file.getOriginalFilename().equals("")) { // 업로드된 이미지가 있을 때
				loginMember.setMemberImage("/resources/images/member/" + fileName);
			}

			if (deleteCheck == 1) {
				loginMember.setMemberImage("/resources/images/common/profile-img-default.png");
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
	@RequestMapping(value = "secession", method = RequestMethod.GET)
	public String secession() {
		return "member/secession";
	}

	// 회원 탈퇴  Controller
	@RequestMapping(value = "secession", method = RequestMethod.POST)
	public String secession(@RequestParam("currentPwd") String currentPwd,
			@ModelAttribute("loginMember") Member loginMember, RedirectAttributes ra, SessionStatus status) {

		int result = service.secession(currentPwd, loginMember);

		String path = "redirect:";

		System.out.println(result);
		if (result > 0) {
			swalSetMessage(ra, "success", "이용해주셔서 감사합니다.", null);
			status.setComplete(); // 세션 만료
			path += "/"; // 메인 페이지
		} else {
			swalSetMessage(ra, "error", "회원 탈퇴 실패", "비밀번호를 다시 확인해주세요.");
			path += "secession";
		}
		return path;
	}

	// 아이디/비밀번호 찾기 화면 전환 Controller
	@RequestMapping(value = "findIdPwd", method = RequestMethod.GET)
	public String findIdPwd() {
		return "member/findIdPwd";
	}

	// 아이디 찾기 Controller
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(HttpServletResponse response, @RequestParam("inputNick") String inputNick,
			@RequestParam("inputEmail") String inputEmail, Model model, @ModelAttribute Member findMember,
			RedirectAttributes ra) throws Exception {

		findMember.setMemberEmail(inputEmail);
		findMember.setMemberNick(inputNick);

		//System.out.println(findMember.getMemberNick());
		//System.out.println(findMember.getMemberEmail());
		
		String path = null;
		String result = service.findId(findMember);
		

		// 일치하는 아이디가 없을 때
		if (result == null) {
			swalSetMessage(ra, "error", "일치하는 아이디가 없습니다.", null);
			path = "redirect:findIdPwd";

		} else { // 일치하는 아이디가 있을 때
			result = result.replaceAll("(?<=.{3}).", "*");
			
			findMember.setMemberId(result);
			
			model.addAttribute("findMember", findMember);
			
			path = "member/findIdView";
		}

		//System.out.println(findMember);
		return path;

	}
	


	// 비밀번호 찾기 Controller
	@RequestMapping(value = "findPwd", method = RequestMethod.POST)
	public String findPwd(@ModelAttribute Member findMember, @RequestParam("inputId") String inputId,
			@RequestParam("inputEmail") String inputEmail, RedirectAttributes ra, HttpServletResponse response)
			throws Exception {

		findMember.setMemberId(inputId);
		findMember.setMemberEmail(inputEmail);

		int result = 0;
		String path = "redirect:";

		// 비번 변경
		result = service.findPwd(response, findMember);

		if (result == 2) {
			swalSetMessage(ra, "error", "등록되지 않은 아이디입니다.", "다시 확인해주세요.");
			path += "findIdPwd";

		} else if (result == 3) {
			swalSetMessage(ra, "error", "이메일이 일치하지 않습니다.", "다시 확인해주세요.");
			path += "findIdPwd";

		} else if (result == 1) {
			path += "findPwdView";
		} else {
			swalSetMessage(ra, "error", "비밀번호 찾기 실패", "고객센터에 문의해주세요.");
			path += "/";
		}

		return path;
	}

	// 비번찾기 결과 화면 전환 Controller
	@RequestMapping(value = "findPwdView", method = RequestMethod.GET)
	public String findPwdView() {
		return "member/findPwdView";
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
