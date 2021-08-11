package com.kh.ensemble.board.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class Board {
	
	// board
	private int boardNo;
	private Timestamp boardDT;
	private Timestamp boardMT;
	private String boardStatus;
	private String boardTitle;
	private int boardReadCount;
	private String boardContent;
	
	// boardType
	private int boardTypeNo;
	private String boardNm;
	private int boardCTNo;
	private String boardCTNm;
	
	// member
	private int memberNo;
	private String memberNk;
	private String memberImage;
	
	// attachment
	private List<Attachment> atList;
	
	// boardLike
	private int likeNo;
	private String likeStatus;
	private int likeCNT;
	
	
	public Board() {}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public Timestamp getBoardDT() {
		return boardDT;
	}


	public void setBoardDT(Timestamp boardDT) {
		this.boardDT = boardDT;
	}


	public Timestamp getBoardMT() {
		return boardMT;
	}


	public void setBoardMT(Timestamp boardMT) {
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


	public int getBoardTypeNo() {
		return boardTypeNo;
	}


	public void setBoardTypeNo(int boardTypeNo) {
		this.boardTypeNo = boardTypeNo;
	}


	public String getBoardNm() {
		return boardNm;
	}


	public void setBoardNm(String boardNm) {
		this.boardNm = boardNm;
	}


	public int getBoardCTNo() {
		return boardCTNo;
	}


	public void setBoardCTNo(int boardCTNo) {
		this.boardCTNo = boardCTNo;
	}


	public String getBoardCTNm() {
		return boardCTNm;
	}


	public void setBoardCTNm(String boardCTNm) {
		this.boardCTNm = boardCTNm;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberNk() {
		return memberNk;
	}


	public void setMemberNk(String memberNk) {
		this.memberNk = memberNk;
	}


	public String getMemberImage() {
		return memberImage;
	}


	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}


	public List<Attachment> getAtList() {
		return atList;
	}


	public void setAtList(List<Attachment> atList) {
		this.atList = atList;
	}


	public int getLikeNo() {
		return likeNo;
	}


	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}


	public String getLikeStatus() {
		return likeStatus;
	}


	public void setLikeStatus(String likeStatus) {
		this.likeStatus = likeStatus;
	}


	public int getLikeCNT() {
		return likeCNT;
	}


	public void setLikeCNT(int likeCNT) {
		this.likeCNT = likeCNT;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardDT=" + boardDT + ", boardMT=" + boardMT + ", boardStatus="
				+ boardStatus + ", boardTitle=" + boardTitle + ", boardReadCount=" + boardReadCount + ", boardContent="
				+ boardContent + ", boardTypeNo=" + boardTypeNo + ", boardNm=" + boardNm + ", boardCTNo=" + boardCTNo
				+ ", boardCTNm=" + boardCTNm + ", memberNo=" + memberNo + ", memberNk=" + memberNk + ", memberImage="
				+ memberImage + ", atList=" + atList + ", likeNo=" + likeNo + ", likeStatus=" + likeStatus
				+ ", likeCNT=" + likeCNT + "]";
	}


	
	
}
