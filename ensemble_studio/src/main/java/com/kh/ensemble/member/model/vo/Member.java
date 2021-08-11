package com.kh.ensemble.member.model.vo;

import java.sql.Date;
import java.util.List;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberEmail;
	private String memberNick;
	private String memberImage;
	private String memberPhone;
	private Date enrollDate;
	private String memberStatus;
	private String memberPath;
	private String memberGrade;
	
	private List<Animal> aniList;
	
	public Member() {}

	
	// 회원정보 조회 매개변수 생성자
	public Member(int memberNo, String memberId, String memberPw, String memberEmail,
			String memberNick, String memberImage, String memberPhone, Date enrollDate, String memberStatus,
			String memberPath, String memberGrade) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberEmail = memberEmail;
		this.memberNick = memberNick;
		this.memberImage = memberImage;
		this.memberPhone = memberPhone;
		this.enrollDate = enrollDate;
		this.memberStatus = memberStatus;
		this.memberPath = memberPath;
		this.memberGrade = memberGrade;
	}

	public Member(String memberId, String memberEmail, String memberNick, String memberImage, String memberPhone) {
		super();
		this.memberId = memberId;
		this.memberEmail = memberEmail;
		this.memberNick = memberNick;
		this.memberImage = memberImage;
		this.memberPhone = memberPhone;
	}


	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberPath() {
		return memberPath;
	}

	public void setMemberPath(String memberPath) {
		this.memberPath = memberPath;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}


	public List<Animal> getAniList() {
		return aniList;
	}


	public void setAniList(List<Animal> aniList) {
		this.aniList = aniList;
	}


	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberEmail="
				+ memberEmail + ", memberNick=" + memberNick + ", memberImage=" + memberImage + ", memberPhone="
				+ memberPhone + ", enrollDate=" + enrollDate + ", memberStatus=" + memberStatus + ", memberPath="
				+ memberPath + ", memberGrade=" + memberGrade + ", aniList=" + aniList + "]";
	}


	
	
}
