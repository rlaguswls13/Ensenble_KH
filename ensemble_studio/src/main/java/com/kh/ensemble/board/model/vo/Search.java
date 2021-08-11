package com.kh.ensemble.board.model.vo;

public class Search {
	
	private String sk;
	private String sv;
	private int boardTypeNo;
	private int boardCTNo;
	
	public Search() {}

	public String getSk() {
		return sk;
	}

	public int getBoardCTNo() {
		return boardCTNo;
	}

	public void setBoardCTNo(int boardCTNo) {
		this.boardCTNo = boardCTNo;
	}

	public void setSk(String sk) {
		this.sk = sk;
	}

	public String getSv() {
		return sv;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}

	public int getBoardTypeNo() {
		return boardTypeNo;
	}

	public void setBoardTypeNo(int boardTypeNo) {
		this.boardTypeNo = boardTypeNo;
	}

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", boardTypeNo=" + boardTypeNo + ", boardCTNo=" + boardCTNo + "]";
	}	
}
