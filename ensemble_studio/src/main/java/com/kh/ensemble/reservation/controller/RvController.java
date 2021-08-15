package com.kh.ensemble.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.service.RvService;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;
import com.kh.ensemble.reservation.model.vo.RvPagination;

@Controller
@RequestMapping("/reservation/*")
@SessionAttributes({ "loginMember" })
public class RvController {

	@Autowired
	private RvService service;

	// @Pathvariable 사용? 시기->? 특정 자원 구분(게시판 상세조회) 구분할 때 사용
	// 쿼리스트ㄹ링은 언제사용? -> 정렬, 필터링 검색할때 사용

	// 예약 내역 조회
	@RequestMapping(value = "rvList", method = RequestMethod.GET)
	public String rvList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			RvPagination pg/* 페이징 처리용 비어있는 객체 */, Rv rv, @ModelAttribute("loginMember") Member loginMember) {

		// rv.setMemberNo(rvMemberNo);
		/* System.out.println(loginMember); */

		pg.setMemberNo(loginMember.getMemberNo());
		pg.setCurrentPage(cp);

		// 2) 전체 게시글 수를 조회하여 Pagination 관련 내용을 계산하고 값을 저장한 객체 반환받기
		RvPagination pagination = service.getPagination(pg);

		pagination.setMemberNo(loginMember.getMemberNo());

		System.out.println("rvController" + pagination);

		// 3)생성된 페이지네이션을 이용하여 현재 목록페이지에 보여질 게시글 목록 조회
		List<Rv> rvList = service.selectRvList(pagination);

		System.out.println("rvList: " + rvList);

		/*
		 * //조회결과 임시 확인 for( Board b : boardList) { System.out.println(b); }
		 */

		model.addAttribute("rvList", rvList);
		model.addAttribute("pagination", pagination);

		// Model. 데이터 전달용 객체

		return "reservation/rvList";
	}

	// 예약 현황 화면 전환용
	@RequestMapping(value = "rvStatus", method = RequestMethod.GET)
	public String rvStatus() {

		return "reservation/rvStatus";
	}

	// 예약 하기 화면 전환용
	@RequestMapping(value = "reservation", method = RequestMethod.GET)
	public String reservation(HttpSession session, Model model, Rv rv,  RedirectAttributes ra) {

			

			Member loginMember = (Member)session.getAttribute("loginMember");
			
			if(loginMember!=null) {
				List<Option> optionList = service.selectOption();
				
				model.addAttribute("optionList", optionList);
				
				return "reservation/reservation";
			}else {
				swalSetMessage(ra, "error", "로그인 후 이용해주세요", null);
				
				return "redirect:/";
			}
			
		
		
	}

	// 예약 하기 내용 저장
	@RequestMapping(value = "reservation", method = RequestMethod.POST)
	public String reservation(@RequestParam("option") String[] option,Option optionNumber,
			@ModelAttribute("loginMember") Member loginMember, Rv rv, RedirectAttributes ra) {
		
		rv.setMemberNo(loginMember.getMemberNo());
		
		System.out.println("예약내용" + rv + option);
		
		

		int rvNo = service.reservation(rv);
		
		
		
		int result= 0;
		
		
		if(rvNo>0) {//삽입 성공
						
		for (int i = 0; i < option.length; i++) {

				int optionNo = Integer.parseInt(option[i]); 
			
			  result= service.setOptionNo(optionNo , rvNo);
		
		}
		
		if (result > 0) {
			swalSetMessage(ra, "success", "예약 성공", loginMember.getMemberNick() + "님 예약에 성공하셨습니다.");

		} else {
			swalSetMessage(ra, "error", "옵션 입력 실패", "고객센터에 문의 바랍니다.");
		}
		}else { //rv 입력 실패 
			swalSetMessage(ra, "error", "예약 실패", "고객센터에 문의 바랍니다.");
		}

		// 예약 성공 또는 실패.....
		

		return "redirect:/";// 메인페이지 재요청 -> / : 메인페이지

	}

	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public String selectRvTimeList(Rv rv) {

		/* System.out.println(rv); */

		List<Rv> rvTimeList = service.selectRvTimeList(rv);

		return new Gson().toJson(rvTimeList);
	}

	
	
	
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		// RediectAttributes : 리다이렉트 시 값을 전달하는 용도의 객체

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}

}
