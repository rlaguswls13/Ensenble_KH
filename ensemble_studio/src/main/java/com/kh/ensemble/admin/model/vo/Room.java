package com.kh.ensemble.admin.model.vo;

public class Room {

	private int RoomNo;
	private String roomName;
	private String roomAbout;
	private String roomConfig;
	private int roomPrice;
	private int roomDiscount;
	private int roomDiscountedPrice;
	private String roomStatus;
	
	public Room() {
	}

	public int getRoomNo() {
		return RoomNo;
	}

	public void setRoomNo(int roomNo) {
		RoomNo = roomNo;
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
	}

	public int getRoomDiscount() {
		return roomDiscount;
	}

	public void setRoomDiscount(int roomDiscount) {
		this.roomDiscount = roomDiscount;
	}

	public int getRoomDiscountedPrice() {
		return (roomPrice/roomDiscount);
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

	@Override
	public String toString() {
		return "Room [RoomNo=" + RoomNo + ", roomName=" + roomName + ", roomAbout=" + roomAbout + ", roomConfig="
				+ roomConfig + ", roomPrice=" + roomPrice + ", roomDiscount=" + roomDiscount + ", roomDiscountedPrice="
				+ roomDiscountedPrice + ", roomStatus=" + roomStatus + "]";
	}
	
	
}
