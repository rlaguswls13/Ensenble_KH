package com.kh.ensemble.member.model.vo;

public class Animal {

	private int aniNo;
	private String aniName;
	private String aniGender;
	private String aniType;
	private int aniAge;
	private int aniKg;
	private int MemberNo;

	
	public Animal() {
	}
	
	public int getAniNo() {
		return aniNo;
	}
	
	public void setAniNo(int aniNo) {
		this.aniNo = aniNo;
	}
	public String getAniName() {
		return aniName;
	}
	public void setAniName(String aniName) {
		this.aniName = aniName;
	}
	public String getAniGender() {
		return aniGender;
	}
	public void setAniGender(String aniGender) {
		this.aniGender = aniGender;
	}
	public String getAniType() {
		return aniType;
	}
	public void setAniType(String aniType) {
		this.aniType = aniType;
	}
	public int getAniAge() {
		return aniAge;
	}
	public void setAniAge(int aniAge) {
		this.aniAge = aniAge;
	}
	public int getAniKg() {
		return aniKg;
	}
	public void setAniKg(int aniKg) {
		this.aniKg = aniKg;
	}
	public int getMemberNo() {
		return MemberNo;
	}
	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Animal [aniNo=" + aniNo + ", aniName=" + aniName + ", aniGender=" + aniGender + ", aniType=" + aniType
				+ ", aniAge=" + aniAge + ", aniKg=" + aniKg + ", MemberNo=" + MemberNo + "]";
	}
	
	
}
