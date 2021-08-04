package com.kh.ensemble.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.admin.model.service.AdminService;
import com.kh.ensemble.member.controller.MemberController;
import com.kh.ensemble.member.model.service.MemberService;
import com.kh.ensemble.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
@SessionAttributes({"loginMember"})
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	
	@RequestMapping("/")
	public String admin() {
		return "admin/admin-main";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute Member inputMember, Model model, HttpSession session) {
		
		Member loginMember = service.login(inputMember);
		if(loginMember != null) {
			model.addAttribute("loginMember", loginMember);
		}else {
			session.setAttribute("icon", "error");
			session.setAttribute("title", "로그인 실패");
			session.setAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect:/admin";
	}
	
}
