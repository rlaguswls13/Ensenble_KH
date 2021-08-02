package com.kh.ensemble.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ensemble.board.model.service.LikeService;

@Controller
@RequestMapping("/like/*")
@SessionAttributes({"loginMember"})
public class LikeController {

	@Autowired
	private LikeService serviceL;
}
