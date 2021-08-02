package com.kh.ensemble.board.model.vo;

public class Category {
	private int boardCTNo;
	private String boardCTNM;
	
	public Category() {}

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
		return "Category [boardCTNo=" + boardCTNo + ", boardCTNM=" + boardCTNM + "]";
	}	
}
