package com.kh.ensemble.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.member.model.service.MemberService;
import com.kh.ensemble.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired 
	private MemberService service;
	
	
	// 로그인 화면 전환 Controller
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "member/login";
		// /WEB-INF/views/member/login.jsp
	}
	
	// 회원가입 화면 전환 Controller
	@RequestMapping(value="signUp", method=RequestMethod.GET)
	public String signUp() {
		return "member/signUp";
	}
	
	// 회원 가입 Controller
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	public String signUp(@ModelAttribute Member inputMember, RedirectAttributes ra) {
		
		int result = service.signUp(inputMember);
	
		
		if( result > 0 ) {
			swalSetMessage(ra, "success", "회원가입 성공", inputMember.getMemberNick()+"님 환영합니다!");
		}else {
			swalSetMessage(ra, "error", "회원가입 실패", "고객센터로 문의해주세요.");
		}
		
		return "redirect:/";
	}
	
	// 아이디 중복 검사 Controller(ajax)
	@ResponseBody
	@RequestMapping(value="idDupCheck", method=RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {
		
		int result = service.idDupCheck(id);
		
		return result;
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
