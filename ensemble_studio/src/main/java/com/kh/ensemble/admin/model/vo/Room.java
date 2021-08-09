package com.kh.ensemble.admin.model.vo;

import java.util.List;

public class Room {

	private int roomNo;
	private String roomName;
	private String roomAbout;
	private String roomConfig;
	private int roomPrice;
	private int roomDiscount;
	private int roomDiscountedPrice;
	private String roomStatus;
	private List<StudioAttachment> atList;
	
	
	public Room() {
	}
	
	private void makeDiscountedPrice() {
		   roomDiscountedPrice = roomPrice -(int)(roomPrice*(roomDiscount/100.0));
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

	public String getRoomAbout() {
		return roomAbout;
	}

	public void setRoomAbout(String roomAbout) {
		this.roomAbout = roomAbout;
	}

	public String getRoomConfig() {
		return roomConfig;
	}

	public void setRoomConfig(String roomConfig) {
		this.roomConfig = roomConfig;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
		makeDiscountedPrice();
	}

	public int getRoomDiscount() {
		return roomDiscount;
	}

	public void setRoomDiscount(int roomDiscount) {
		this.roomDiscount = roomDiscount;
		makeDiscountedPrice();
	}

	public int getRoomDiscountedPrice() {
		return roomDiscountedPrice;
	}

	public void setRoomDiscountedPrice(int roomDiscountedPrice) {
		this.roomDiscountedPrice = roomDiscountedPrice;
	}

	public String getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
	}

	public List<StudioAttachment> getAtList() {
		return atList;
	}

	public void setAtList(List<StudioAttachment> atList) {
		this.atList = atList;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomName=" + roomName + ", roomAbout=" + roomAbout + ", roomConfig="
				+ roomConfig + ", roomPrice=" + roomPrice + ", roomDiscount=" + roomDiscount + ", roomDiscountedPrice="
				+ roomDiscountedPrice + ", roomStatus=" + roomStatus + ", atList=" + atList + "]";
	}

	
	
	
}
