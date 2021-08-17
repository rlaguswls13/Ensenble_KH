package com.kh.ensemble.reservation.model.vo;


import java.util.List;

public class Rv {

	private int rvNo;
	private int memberNo;
	private String memberNick;
	private int roomNo;
	private String rvDate;
	private String rvTime;
	private int rvPeople;
	private int rvCars;
	private int rvAnimals;
	private String rvPurpose;
	private String rvEtc;
	private String rvStatus;
	private int wholePrice;
	
	
	private String roomConfig;
	
	private int roomDiscount;
	private int roomPrice;
	private String roomName;
	
	
	
	

	private List<Option> optionList;

	public Rv() {}

	
	
	
	
	
















	public int getWholePrice() {
		return wholePrice;
	}






















	public void setWholePrice(int wholePrice) {
		this.wholePrice = wholePrice;
	}






















	public String getRoomConfig() {
		return roomConfig;
	}






	public void setRoomConfig(String roomConfig) {
		this.roomConfig = roomConfig;
	}






	public String getRvStatus() {
		return rvStatus;
	}



	public void setRvStatus(String rvStatus) {
		this.rvStatus = rvStatus;
	}



	public String getMemberNick() {
		return memberNick;
	}



	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}



	public List<Option> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<Option> optionList) {
		this.optionList = optionList;
	}

	
	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}



	public String getRvDate() {
		return rvDate;
	}

	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}

	public String getRvTime() {
		return rvTime;
	}

	public void setRvTime(String rvTime) {
		this.rvTime = rvTime;
	}

	public int getRvPeople() {
		return rvPeople;
	}

	public void setRvPeople(int rvPeople) {
		this.rvPeople = rvPeople;
	}

	public int getRvCars() {
		return rvCars;
	}

	public void setRvCars(int rvCars) {
		this.rvCars = rvCars;
	}

	public int getRvAnimals() {
		return rvAnimals;
	}

	public void setRvAnimals(int rvAnimals) {
		this.rvAnimals = rvAnimals;
	}

	public String getRvPurpose() {
		return rvPurpose;
	}

	public void setRvPurpose(String rvPurpose) {
		this.rvPurpose = rvPurpose;
	}

	public String getRvEtc() {
		return rvEtc;
	}

	public void setRvEtc(String rvEtc) {
		this.rvEtc = rvEtc;
	}

	

	public int getRoomDiscount() {
		return roomDiscount;
	}

	public void setRoomDiscount(int roomDiscount) {
		this.roomDiscount = roomDiscount;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}



	@Override
	public String toString() {
		return "Rv [rvNo=" + rvNo + ", memberNo=" + memberNo + ", memberNick=" + memberNick + ", roomNo=" + roomNo
				+ ", rvDate=" + rvDate + ", rvTime=" + rvTime + ", rvPeople=" + rvPeople + ", rvCars=" + rvCars
				+ ", rvAnimals=" + rvAnimals + ", rvPurpose=" + rvPurpose + ", rvEtc=" + rvEtc + ", rvStatus="
				+ rvStatus + ", wholePrice=" + wholePrice + ", roomConfig=" + roomConfig + ", roomDiscount="
				+ roomDiscount + ", roomPrice=" + roomPrice + ", roomName=" + roomName + ", optionList=" + optionList
				+ "]";
	}


	
}
