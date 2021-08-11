package com.kh.ensemble.board.model.vo;

public class Like {
	private int likeNo;
	private String likeStatus;
	private int boardNo;
	private int memberNo;
	private int likeCNT;
	
	public Like() {}
	
	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getLikeStatus() {
		return likeStatus;
	}

	public void setLikeStatus(String likeStatus) {
		this.likeStatus = likeStatus;
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

	public int getLikeCNT() {
		return likeCNT;
	}

	public void setLikeCNT(int likeCNT) {
		this.likeCNT = likeCNT;
	}

	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", likeStatus=" + likeStatus + ", boardNo=" + boardNo + ", memberNo="
				+ memberNo + ", likeCNT=" + likeCNT + "]";
	}
}
