package com.kh.ensemble.board.model.vo;

import java.sql.Timestamp;

public class Reply {
	// reply
	private int replyNo;
	private String replyContent;
	private Timestamp replyDT;
	private Timestamp replyMT;
	private String replyST;
	
	// board
	private int boardNo;
	
	// member
	private int memberNo;
	private String memberNk;
	private String memberImage;
	
	public Reply() {}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyDT() {
		return replyDT;
	}

	public void setReplyDT(Timestamp replyDT) {
		this.replyDT = replyDT;
	}

	public Timestamp getReplyMT() {
		return replyMT;
	}

	public void setReplyMT(Timestamp replyMT) {
		this.replyMT = replyMT;
	}

	public String getReplyST() {
		return replyST;
	}

	public void setReplyST(String replyST) {
		this.replyST = replyST;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberNk() {
		return memberNk;
	}

	public void setMemberNk(String memberNk) {
		this.memberNk = memberNk;
	}
	
	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDT=" + replyDT + ", replyMT="
				+ replyMT + ", replyST=" + replyST + ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", memberNk="
				+ memberNk + ", memberImage=" + memberImage + "]";
	}
	
}
