package com.kh.ensemble.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.admin.model.vo.Sales;
import com.kh.ensemble.admin.model.vo.StudioAttachment;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberId) {
		return sqlSession.selectOne("adminMapper.login", memberId);
	}

	public Pagination getMemberListCount() {
		return sqlSession.selectOne("adminMapper.getMemberListCount");
	}

	public List<Member> memberList(Pagination pg) {
		int offset = (pg.getCurrentPage() - 1) * pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());

		return sqlSession.selectList("adminMapper.memberList", pg, rowBounds);
	}

	public Pagination getRoomListCount() {
		return sqlSession.selectOne("adminMapper.getRoomListCount");
	}

	public List<Room> roomList(Pagination pg) {
		int offset = (pg.getCurrentPage() - 1) * pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());

		return sqlSession.selectList("adminMapper.roomList", pg, rowBounds);
	}

	public int insertRoom(Room room) {
		int result = sqlSession.insert("adminMapper.insertRoom", room);
		if (result > 0) {
			return room.getRoomNo();
		}
		return 0;
	}

	public int insertAttachment(List<StudioAttachment> atList) {
		return sqlSession.insert("adminMapper.insertAttachment", atList);
	}

	public int updateRoomStatus(Room room) {
		return sqlSession.update("adminMapper.updateRoomStatus", room);
	}

	public Room selectRoom(int roomNo) {
		return sqlSession.selectOne("adminMapper.selectRoom", roomNo);
	}

	public int updateRoom(Room room) {
		return sqlSession.update("adminMapper.updateRoom", room);
	}

	public int updateStudioAttachment(StudioAttachment a) {
		return sqlSession.update("adminMapper.updateStudioAttachment", a);
	}

	public int insertAttachment(StudioAttachment a) {
		return sqlSession.insert("adminMapper.insertOneAttachment", a);
	}

	public int deleteRooms(String rooms) {
		int result = sqlSession.delete("adminMapper.deleteStudioAttachments", rooms);
		if (result >= 0) {
			result = sqlSession.delete("adminMapper.deleteRooms", rooms);
		}
		return result;
	}

	public int countRooms() {
		return sqlSession.selectOne("adminMapper.countRooms");
	}

	public Pagination getListCount(Pagination pg) {
		return sqlSession.selectOne("rvMapper.getListCount");
	}

	public List<Rv> selectReservationList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("rvMapper.selectReservationList" ,pagination, rowBounds);
	}

	public Rv selectReservation(int rvNo) {

		return sqlSession.selectOne("rvMapper.selectReservation", rvNo);
	}

	public List<Option> adminSelectOption() {

		return sqlSession.selectList("rvMapper.adminSelectOption");
	}

	public List<Sales> selectSalesList() {
		return sqlSession.selectList("adminMapper.selectSalesList");
	}

	public List<Integer> getSalesByDay(int roomNo) {
		return sqlSession.selectList("adminMapper.getSalesByDay", roomNo);
	}

	public List<Rv> selectMainRvList() {
		return sqlSession.selectList("adminMapper.selectMainRvList");
	}

	public int updateRvStatus(Rv rv) {
		return sqlSession.update("adminMapper.updateRvStatus", rv);
	}

	public int modifyRv(Rv rv) {

		return sqlSession.update("rvMapper.modifyRv", rv);
	}

	public int deleteSelectOptionList(Rv rv) {
		return sqlSession.delete("rvMapper.deleteSelectOptionList", rv);

	}

	public int setOptionNo(Map<String, Object> map) {

		return sqlSession.insert("rvMapper.setOptionNo", map);
	}

	public List<Option> selectedOption(int rvNo) {

		return sqlSession.selectList("rvMapper.selectedOption", rvNo);
	}

	public List<Room> selectRoomList() {

		return sqlSession.selectList("adminMapper.selectRoomList");
	}

	public Member selectMember(Rv rv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMember", rv.getMemberNo());
	}

}
