package com.kh.ensemble.main.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.main.model.service.MainService;

@Controller
@SessionAttributes({"mainRList"})
public class MainController {

	@Autowired
	private MainService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<Room> mainRList = service.selectRoomList();
		model.addAttribute("mainRList", mainRList);
		
		return "main"; 
	}
	
	@RequestMapping("/studio/{roomNo}")
	public String studioView(@PathVariable("roomNo") int roomNo, Model model) {
		
		Room room = service.selectRoom(roomNo);
		model.addAttribute("room", room);
		
		return "common/studioView";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "common/about";
	}
}
