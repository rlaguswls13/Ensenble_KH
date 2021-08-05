package com.kh.ensemble.admin.model.service;

import java.util.List;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;

public interface AdminService {

	Member login(Member inputMember);

	List<Member> memberList(Pagination pg);

	Pagination getMemberPagination();

	Pagination getRoomPagination();

	List<Room> roomList(Pagination pagination);

}
