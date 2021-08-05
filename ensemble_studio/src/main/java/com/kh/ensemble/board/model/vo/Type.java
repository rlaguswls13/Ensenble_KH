package com.kh.ensemble.board.model.vo;

public class Type {
	private int typeNo;
	private String boardName;
	private int boardCTNo;
	private String boardCTNM;
	
	public Type() {}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public int getBoardCTNo() {
		return boardCTNo;
	}

	public void setBoardCTNo(int boardCTNo) {
		this.boardCTNo = boardCTNo;
	}

	public String getBoardCTNM() {
		return boardCTNM;
	}

	public void setBoardCTNM(String boardCTNM) {
		this.boardCTNM = boardCTNM;
	}

	@Override
	public String toString() {
		return "Type [typeNo=" + typeNo + ", boardName=" + boardName + ", boardCTNo=" + boardCTNo + ", boardCTNM="
				+ boardCTNM + "]";
	}

	
	
}