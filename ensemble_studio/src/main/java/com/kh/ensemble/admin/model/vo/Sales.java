package com.kh.ensemble.admin.model.vo;

import java.sql.Date;
import java.util.List;

public class Sales {

	private int roomNo;
	private String roomName;
	private int roomSalesCount;
	private Date rvDate;
	
	public Sales() {
		// TODO Auto-generated constructor stub
	}

	
	public Date getRvDate() {
		return rvDate;
	}


	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}


	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomSalesCount() {
		return roomSalesCount;
	}

	public void setRoomSalesCount(int roomSalesCount) {
		this.roomSalesCount = roomSalesCount;
	}


	@Override
	public String toString() {
		return "Sales [roomNo=" + roomNo + ", roomName=" + roomName + ", roomSalesCount=" + roomSalesCount + ", rvDate="
				+ rvDate + "]";
	}

	
	
	
	
}
