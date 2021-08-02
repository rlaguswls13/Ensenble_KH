package com.kh.ensemble.board.model.vo;

public class Attachment {
	private int atNo;
	private int atLv;
	private String atPath;
	private String atName;
	private int boardNo;
	
	public Attachment() {}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public int getAtLv() {
		return atLv;
	}

	public void setAtLv(int atLv) {
		this.atLv = atLv;
	}

	public String getAtPath() {
		return atPath;
	}

	public void setAtPath(String atPath) {
		this.atPath = atPath;
	}

	public String getAtName() {
		return atName;
	}

	public void setAtName(String atName) {
		this.atName = atName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Attachment [atNo=" + atNo + ", atLv=" + atLv + ", atPath=" + atPath + ", atName=" + atName
				+ ", boardNo=" + boardNo + "]";
	}
	
	
	
}
