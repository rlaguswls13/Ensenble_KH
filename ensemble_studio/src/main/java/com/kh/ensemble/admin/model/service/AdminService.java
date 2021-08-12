package com.kh.ensemble.admin.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;

public interface AdminService {

	Member login(Member inputMember);

	List<Member> memberList(Pagination pg);

	Pagination getMemberPagination();

	Pagination getRoomPagination();

	List<Room> roomList(Pagination pagination);

	int insertRoom(Room room, List<MultipartFile> images, String webPath, String savePath);

	int updateRoomStatus(Room room);

	Room selectRoom(int roomNo);

	int updateRoom(Room room, List<MultipartFile> images, String webPath, String savePath);

	int deleteRooms(String rooms);

	int countRooms();

	//예약 목록 pagination
	Pagination getPagination(Pagination pg);
	//예약 목록 불러오기 
	List<Rv> selectReservationList(Pagination pagination);

	
	//예약 내용 수정 페이지 
	Rv selectReservation(int rvNo);

	

	List<Option> adminSelectOption();

}
