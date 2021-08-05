package com.kh.ensemble.board.model.vo;

public class Pagination {
	
	private int currentPage;		// 목록상 현재 페이지 
	private int listCount;			// 게시글 전체 수
	
	private int limit = 10;			// 한 페이지에 보여질 게시글 수
	private int pageSize = 10; 		// 보여질 페이지 번호 개수
	
	private int maxPage;			// 게시글 목록의 마지막 페이지 번호
	private int startPage;			// 보여지는 페이지 번호 중 시작 번호
	private int endPage;			// 보여지는 페이지 번호 중 끝 번호
	
	private int prevPage;			// 이전 페이지 번호 목록 중 끝 번호
	private int nextPage;			// 다음 페이지 번호 목록 중 시작 번호
	
	private int boardCTNo;			// 게시판 타입 번호
	private String boardCTNm;		// 게시판 이름
	
	private int boardTypeNo;		// 게시판 글 종류 번호
	private String boardName;		// 게시판 글 종류 이름
	
	// 페이징 처리 메소드
	private void nMakePagination() {
		maxPage = (int)Math.ceil(   (double)listCount / limit   );
		
		startPage = (currentPage - 1 ) / pageSize * pageSize + 1;
		
		endPage = startPage + pageSize - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(currentPage < 10) 	prevPage = 1;
		else					prevPage = (currentPage - 1 ) / pageSize * pageSize ;
				
		nextPage = (currentPage + pageSize - 1) / pageSize * pageSize + 1;
		
		if(nextPage > maxPage) {
			nextPage = maxPage;
		}
	}
	
	
	public Pagination() {}

	public Pagination(int currentPage, int listCount, int boardTypeNo,
					String boardName, int boardCTNo, String boardCTNm) {
		this.currentPage = currentPage;
		this.listCount = listCount; 
		this.boardTypeNo = boardTypeNo;
		this.boardName = boardName;
		this.boardCTNo = boardCTNo;
		this.boardCTNm = boardCTNm;
		nMakePagination();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		nMakePagination();
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
		nMakePagination();
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
		nMakePagination();
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		nMakePagination();
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
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

	public int getBoardTypeNo() {
		return boardTypeNo;
	}

	public void setBoardTypeNo(int boardTypeNo) {
		this.boardTypeNo = boardTypeNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", boardCTNo=" + boardCTNo
				+ ", boardCTNm=" + boardCTNm + ", boardTypeNo=" + boardTypeNo + ", boardName=" + boardName + "]";
	}
	

}
