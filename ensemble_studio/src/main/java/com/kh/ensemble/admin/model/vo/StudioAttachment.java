package com.kh.ensemble.admin.model.vo;

public class StudioAttachment {
	private int fileNo;
	private int fileLevel;
	private String filePath;
	private String fileName;
	private int fileType;
	private int roomNo;
	
	public StudioAttachment() {}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileType() {
		return fileType;
	}

	public void setFileType(int fileType) {
		this.fileType = fileType;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "StudioAttachment [fileNo=" + fileNo + ", fileLevel=" + fileLevel + ", filePath=" + filePath
				+ ", fileName=" + fileName + ", fileType=" + fileType + ", roomNo=" + roomNo + "]";
	}

	
	
}
