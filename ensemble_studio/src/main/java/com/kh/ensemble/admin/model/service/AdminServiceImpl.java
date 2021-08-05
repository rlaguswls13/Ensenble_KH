package com.kh.ensemble.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ensemble.admin.model.dao.AdminDAO;
import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public Member login(Member inputMember) {
		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		Member loginMember = dao.login(inputMember.getMemberId());
		
		if(loginMember != null) {
	         if (!bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
	            loginMember = null;
	         } else {
	            loginMember.setMemberPw(null);
	         }
	         
	      }
		
		return loginMember;
	}

	@Override
	public List<Member> memberList(Pagination pg) {
		return dao.memberList(pg);
	}

	@Override
	public Pagination getMemberPagination() {
		return dao.getMemberListCount();
	}

	@Override
	public Pagination getRoomPagination() {
		return dao.getRoomListCount();
	}

	@Override
	public List<Room> roomList(Pagination pagination) {
		return dao.roomList(pagination);
	}

}
