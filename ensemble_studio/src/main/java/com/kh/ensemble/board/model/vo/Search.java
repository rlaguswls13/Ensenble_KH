package com.kh.ensemble.board.model.vo;

public class Search {
	
	private String sk;
	private String sv;
	private int boardType;
	
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

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", boardType=" + boardType + "]";
	}	
}
