package com.kh.ensemble.main.model.service;

import java.util.List;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.board.model.vo.Board;

public interface MainService {

	List<Room> selectRoomList();

	Room selectRoom(String roomHref);

	List<Board> selectNoticeList();

	List<Board> selectReviewList(String roomName);

	int countReview(String roomName);

}
