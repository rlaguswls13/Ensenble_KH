package com.kh.ensemble.board.model.vo;

public class Search {
	
	private String sk;
	private String sv;
	private int boardTypeNo;
	private int bct;
	
	public Search() {}

	public String getSk() {
		return sk;
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

	public int getBct() {
		return bct;
	}

	public void setBct(int bct) {
		this.bct = bct;
	}

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", boardTypeNo=" + boardTypeNo + ", bct=" + bct + "]";
	}
}
