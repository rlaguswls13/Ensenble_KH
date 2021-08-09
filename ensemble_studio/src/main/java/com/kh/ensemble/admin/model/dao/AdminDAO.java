package com.kh.ensemble.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.admin.model.vo.StudioAttachment;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;

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
		int offset = (pg.getCurrentPage()-1) * pg.getLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		
		return sqlSession.selectList("adminMapper.memberList", pg, rowBounds);
	}

	public Pagination getRoomListCount() {
		return sqlSession.selectOne("adminMapper.getRoomListCount");
	}

	public List<Room> roomList(Pagination pg) {
		int offset = (pg.getCurrentPage()-1) * pg.getLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		
		return sqlSession.selectList("adminMapper.roomList", pg, rowBounds);
	}

	public int insertRoom(Room room) {
		int result = sqlSession.insert("adminMapper.insertRoom", room);
		if(result>0) {
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


}
