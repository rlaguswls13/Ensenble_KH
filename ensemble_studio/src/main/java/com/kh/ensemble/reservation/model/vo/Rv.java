package com.kh.ensemble.reservation.model.vo;


import java.util.List;

public class Rv {

	private int rvNo;
	private int memberNo;
	private int roomNo;
	private String rvDate;
	private String rvTime;
	private int rvPeople;
	private int rvCars;
	private int rvAnimals;
	private String rvPurpose;
	private String rvEtc;

	private String roomName;
	



	private List<Option> optionList;
	
	public Rv() {}

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

	

	@Override
	public String toString() {
		return "Rv [rvNo=" + rvNo + ", memberNo=" + memberNo + ", roomNo=" + roomNo + ", rvDate=" + rvDate + ", rvTime="
				+ rvTime + ", rvPeople=" + rvPeople + ", rvCars=" + rvCars + ", rvAnimals=" + rvAnimals + ", rvPurpose="
				+ rvPurpose + ", rvEtc=" + rvEtc + ", roomName=" + roomName + ", optionList=" + optionList + "]";
	}
	
	
	
	
	
	
}
