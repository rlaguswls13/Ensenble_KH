package com.kh.ensemble.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.ensemble.admin.model.service.AdminService;
import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.admin.model.vo.Sales;
import com.kh.ensemble.member.controller.MemberController;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;
import com.kh.ensemble.board.model.vo.Pagination;

@Controller
@SessionAttributes({ "loginMember" })
public class AdminController {

	@Autowired
	private AdminService service;

	
	
	@RequestMapping("/admin")
	public String admin(Model model) {
		List<Rv> mainRvList = service.selectMainRvList();
		model.addAttribute("mainRvList", mainRvList);

		List<Sales> salesList = service.selectSalesList();
		model.addAttribute("salesList", salesList);

		return "admin/admin-main";
	}

	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String login(@ModelAttribute Member inputMember, Model model, HttpSession session) {

		Member loginMember = service.login(inputMember);
		if (loginMember != null) {
			model.addAttribute("loginMember", loginMember);
		} else {
			session.setAttribute("icon", "error");
			session.setAttribute("title", "????????? ??????");
			session.setAttribute("text", "????????? ?????? ??????????????? ???????????? ????????????.");
		}

		return "redirect:/admin";
	}

	// ????????? ??????????????? ?????? ??????
	@RequestMapping(value = "/admin/reservation")
	public String selectReservation(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model, Pagination pg) {

		pg.setCurrentPage(cp);

		Pagination pagination = null;

		List<Rv> totalRvList = null;

		pagination = service.getPagination(pg);

		System.out.println("admin???????????? " + pagination);

		totalRvList = service.selectReservationList(pagination);

		System.out.println("admin???????????? " + totalRvList);

		model.addAttribute("totalRvList", totalRvList);
		model.addAttribute("pagination", pagination);

		return "admin/admin-reservation";
	}

	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public String memberList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		Pagination pagination = service.getMemberPagination();
		pagination.setCurrentPage(cp);
		pagination.setPageSize(5);
		List<Member> mList = service.memberList(pagination);

		model.addAttribute("mList", mList);
		model.addAttribute("pagination", pagination);

		return "admin/admin-member";
	}

	@RequestMapping(value = "/admin/studio", method = RequestMethod.GET)
	public String roomList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		Pagination pagination = service.getRoomPagination();
		pagination.setCurrentPage(cp);
		pagination.setPageSize(5);
		List<Room> rList = service.roomList(pagination);

		// System.out.println(rList);

		model.addAttribute("rList", rList);
		model.addAttribute("pagination", pagination);

		return "admin/admin-studio";
	}

	@RequestMapping(value = "/admin/studio/insert", method = RequestMethod.GET)
	public String gotoInsertRoom() {
		return "admin/admin-studio-insert";
	}

	@RequestMapping(value = "/admin/studio/insert", method = RequestMethod.POST)
	public String insertRoom(@ModelAttribute() Room room, @RequestParam("images") List<MultipartFile> images,
			RedirectAttributes ra, HttpServletRequest request) {

		String webPath = "resources/images/admin/studio/";
		String savePath = request.getSession().getServletContext().getRealPath(webPath);

		int roomNo = service.insertRoom(room, images, webPath, savePath);

		if (roomNo > 0) {
			MemberController.swalSetMessage(ra, "success", "?????? ?????? ??????", room.getRoomName() + "???(???) ??????????????? ???????????????????????????.");
		} else {
			MemberController.swalSetMessage(ra, "error", "?????? ?????? ??????", null);
		}

		return "redirect:/admin/studio";
	}

	@ResponseBody
	@RequestMapping(value = "admin/studio/updateRoomStatus", method = RequestMethod.POST)
	public int updateRoomStatusY(Room room) {
		// System.out.println(room);
		int result = 0;
		if (room.getRoomStatus().equals("Y")) {
			result = service.countRooms();
			if (result < 3) {
				result = service.updateRoomStatus(room);
			} else {
				result = 0;
			}
		} else {
			result = service.updateRoomStatus(room);
		}

		return result;
	}

	@RequestMapping(value = "admin/studio/update/{roomNo}", method = RequestMethod.GET)
	public String updateRoom(@PathVariable("roomNo") int roomNo, Model model) {
		Room room = service.selectRoom(roomNo);
		model.addAttribute("room", room);
		return "admin/admin-studio-update";
	}

	@RequestMapping(value = "admin/studio/update/{roomNo}", method = RequestMethod.POST)
	public String updateRoom(Room room, List<MultipartFile> images, RedirectAttributes ra, HttpServletRequest request) {

		String webPath = "resources/images/admin/studio/";
		String savePath = request.getSession().getServletContext().getRealPath(webPath);

		int result = service.updateRoom(room, images, webPath, savePath);
		if (result > 0) {
			MemberController.swalSetMessage(ra, "success", "?????? ?????? ??????", room.getRoomName() + "???(???) ??????????????? ???????????????????????????.");
		} else {
			MemberController.swalSetMessage(ra, "error", "?????? ?????? ??????", null);
		}
		return "redirect:/admin/studio";
	}

	@ResponseBody
	@RequestMapping(value = "admin/studio/deleteRooms", method = RequestMethod.POST)
	public int deleteRooms(String rooms) {

		// System.out.println(rooms);
		int result = service.deleteRooms(rooms);
		return result;
	}

	@RequestMapping("admin/sales")
	public String sales(Model model) {

		List<Sales> salesList = service.selectSalesList();
		model.addAttribute("salesList", salesList);

		return "admin/admin-sales";
	}

	@ResponseBody
	@RequestMapping(value = "admin/sales/getSalesByDay", method = RequestMethod.POST)
	public String getSalesByDay(@RequestParam("roomNo1") int roomNo1, @RequestParam("roomNo2") int roomNo2,
			@RequestParam("roomNo3") int roomNo3) {

		// System.out.println(roomNo1);
		// System.out.println(roomNo2);
		// System.out.println(roomNo3);

		List<Integer> salesByDay1 = service.getSalesByDay(roomNo1);
		List<Integer> salesByDay2 = service.getSalesByDay(roomNo2);
		List<Integer> salesByDay3 = service.getSalesByDay(roomNo3);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("salesByDay1", salesByDay1);
		map.put("salesByDay2", salesByDay2);
		map.put("salesByDay3", salesByDay3);

//		System.out.println(salesByDay1);
//		System.out.println(salesByDay2);
//		System.out.println(salesByDay3);

		return new Gson().toJson(map);
	}

	// ????????? ?????? ?????????
	@RequestMapping(value = "admin/{rvNo}", method = RequestMethod.GET)
	public String modifyRv(@PathVariable("rvNo") int rvNo, Model model
			
			) {

		List<Option> optionList = service.adminSelectOption();

		Rv rv = service.selectReservation(rvNo);
		
		
		
		List<Option> selectedOptionList= service.selectedOption(rvNo);
		
		List<Room> roomList = service.selectRoomList(); //???????????? ???
		
		Member rvMember = service.selectMember(rv);
		
			
		System.out.println("????????? ?????? ?????? " + selectedOptionList +roomList);
		
		model.addAttribute("rvMember", rvMember);
		model.addAttribute("roomList", roomList);
		model.addAttribute("rv", rv);
		model.addAttribute("optionList", optionList);
		model.addAttribute("selectedOptionList",selectedOptionList);

		return "admin/admin-modifyRv";
	}

	@RequestMapping(value = "admin/{rvNo}", method = RequestMethod.POST)
	public String modifyRv(@PathVariable("rvNo") int rvNo,
			@RequestParam("option") String[] option, Option optionNumber, Rv rv, RedirectAttributes ra) {
		
	
		
	
		
		rv.setMemberNo(rvNo);
		

		
		int result= service.modifyRv(rv);
		
	
		
	
		
		if(result>0) {
			for (int i = 0; i < option.length; i++) {

				int optionNo = Integer.parseInt(option[i]); 
			
			  result= service.setOptionNo(optionNo , rvNo);
		
		}
		
		if (result > 0) {
			swalSetMessage(ra, "success", "?????? ?????? ??????", null);

		} else {
			swalSetMessage(ra, "error", "?????? ?????? ??????", null);
		}
		}else { //rv ?????? ?????? 
			swalSetMessage(ra, "error", "?????? ?????? ??????", null);
		}

		// ?????? ?????? ?????? ??????.....
		

		return "redirect:/admin/reservation";


		
	
	}

	@ResponseBody
	@RequestMapping(value = "admin/reservation/updateRvStatus", method = RequestMethod.POST)
	public int updateRvStatus(Rv rv) {
		// System.out.println(rvNo);
		// System.out.println(rvStatus);

		int result = service.updateRvStatus(rv);

		return result;
	}
	
	
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		// RediectAttributes : ??????????????? ??? ?????? ???????????? ????????? ??????

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
}
