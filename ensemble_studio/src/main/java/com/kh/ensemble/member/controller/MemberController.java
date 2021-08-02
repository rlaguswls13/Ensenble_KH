package com.kh.ensemble.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ensemble.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	private MemberService service;
	
	
	// 로그인 화면 전환 Controller
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "member/login";
		// /WEB-INF/views/member/login.jsp
	}

}
