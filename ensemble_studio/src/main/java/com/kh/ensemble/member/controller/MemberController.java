package com.kh.ensemble.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		return "redirect:/";
	}

}
