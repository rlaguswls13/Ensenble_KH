package com.kh.ensemble.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ensemble.admin.model.service.AdminService;
import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.member.controller.MemberController;
import com.kh.ensemble.member.model.service.MemberService;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.vo.Pagination;

@Controller
@SessionAttributes({"loginMember"})
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin/admin-main";
	}
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/admin/reservation", method=RequestMethod.GET)
	public String selectReservation() {
		return "admin/admin-reservation";
	}
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String memberList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
							Model model) {
		
		Pagination pagination = service.getMemberPagination();
		pagination.setCurrentPage(cp);
		pagination.setPageSize(5);
		List<Member> mList = service.memberList(pagination);
		
		model.addAttribute("mList", mList);
		model.addAttribute("pagination", pagination);
		
		return "admin/admin-member";
	}
	
	@RequestMapping(value="/admin/studio", method=RequestMethod.GET)
	public String roomList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
			Model model) {
		
		Pagination pagination = service.getRoomPagination();
		pagination.setCurrentPage(cp);
		pagination.setPageSize(5);
		List<Room> rList = service.roomList(pagination);
		
		//System.out.println(rList);
		
		model.addAttribute("rList", rList);
		model.addAttribute("pagination", pagination);
		
		return "admin/admin-studio";
	}
	
	@RequestMapping(value="/admin/studio/insert", method=RequestMethod.GET)
	public String gotoInsertRoom() {
		return "admin/admin-studio-insert";
	}
	
	@RequestMapping(value="/admin/studio/insert", method=RequestMethod.POST)
	public String insertRoom(@ModelAttribute() Room room, 
							@RequestParam("images") List<MultipartFile> images,
							 RedirectAttributes ra,
							 HttpServletRequest request) {
		
		String webPath ="resources/images/admin/studio";
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		
		int roomNo = service.insertRoom(room, images, webPath, savePath);
		
		if(roomNo>0) {
			MemberController.swalSetMessage(ra, "success", "상품 등록 성공", room.getRoomName()+"이(가) 정상적으로 업데이트되었습니다.");
		}else {
			MemberController.swalSetMessage(ra, "error", "상품 등록 실패", null);
		}
		
		
		return "redirect:/admin/studio";
	}
}