package com.kh.ensemble.common.schedule;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.ensemble.board.model.service.BoardService;
import com.kh.ensemble.board.model.service.LikeService;
import com.kh.ensemble.board.model.service.ReplyService;
import com.kh.ensemble.member.model.service.MemberService;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.service.RvService;

@Component
public class deleteMemberData {

	@Autowired
	private BoardService serviceB;
	@Autowired
	private LikeService serviceL;
	@Autowired
	private ReplyService serviceR;
	@Autowired
	private MemberService serviceM;

	
	@Scheduled(cron = "* * * * * */10")
	public void blindData() {
		
		List<Integer> secessionMemberList = serviceM.selectSecessionMember();
		int result = 0;
		
		for(Integer secessionMemberNo : secessionMemberList) {
			
			serviceR.deleteSecessionReply(secessionMemberNo);
			serviceL.deleteSecessionLike(secessionMemberNo);
			serviceB.deleteSecessionBoard(secessionMemberNo);
		}		
		System.out.println("DB 확인해봐");
	}	
}
