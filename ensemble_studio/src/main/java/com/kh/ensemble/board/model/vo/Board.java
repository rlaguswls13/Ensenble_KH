package com.kh.ensemble.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private Date boardDT;
	private Date boardMT;
	private String boardStatus;
	private String boardTitle;
	private int boardReadCount;
	private String boardContent;
	private int memberNo;
	private int boardTypeNo;
	
	public Board() {}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getBoardDT() {
		return boardDT;
	}

	public void setBoardDT(Date boardDT) {
		this.boardDT = boardDT;
	}

	public Date getBoardMT() {
		return boardMT;
	}

	public void setBoardMT(Date boardMT) {
		this.boardMT = boardMT;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardTypeNo() {
		return boardTypeNo;
	}

	public void setBoardTypeNo(int boardTypeNo) {
		this.boardTypeNo = boardTypeNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardDT=" + boardDT + ", boardMT=" + boardMT + ", boardStatus="
				+ boardStatus + ", boardTitle=" + boardTitle + ", boardReadCount=" + boardReadCount + ", boardContent="
				+ boardContent + ", memberNo=" + memberNo + ", boardTypeNo=" + boardTypeNo + "]";
	}	
}
