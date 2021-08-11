package com.kh.ensemble.reservation.model.vo;

public class Option {

	private int optionNo;
	private String optionName;
	private String optionType;
	private String optionPrice;

	public Option() {
	}

	public Option(int optionNo, String optionName, String optionType, String optionPrice) {
		super();
		this.optionNo = optionNo;
		this.optionName = optionName;
		this.optionType = optionType;
		this.optionPrice = optionPrice;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionType() {
		return optionType;
	}

	public void setOptionType(String optionType) {
		this.optionType = optionType;
	}

	public String getOptionPrice() {
		return optionPrice;
	}

	public void setOptionPrice(String optionPrice) {
		this.optionPrice = optionPrice;
	}

	@Override
	public String toString() {
		return "Option [optionNo=" + optionNo + ", optionName=" + optionName + ", optionType=" + optionType
				+ ", optionPrice=" + optionPrice + "]";
	}

}
