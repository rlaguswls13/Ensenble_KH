package com.kh.ensemble.board.model.vo;

public class HashTag {

	private int hashNo;
	private String hashContent;
	private int boardNo;
	
	public HashTag() {}

	public int getHashNo() {
		return hashNo;
	}

	public void setHashNo(int hashNo) {
		this.hashNo = hashNo;
	}

	public String getHashContent() {
		return hashContent;
	}

	public void setHashContent(String hashContent) {
		this.hashContent = hashContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "HashTag [hashNo=" + hashNo + ", hashContent=" + hashContent + ", boardNo=" + boardNo + "]";
	}

		
}
