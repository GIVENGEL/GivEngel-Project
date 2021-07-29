package com.project.givengel.vo;

public class Criteria {
	
	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지당 보여질 게시글의 수
	
	// 특정 페이지의 게시글 시작번호
	// 현재 페이지 게시글 시작번호 = (현재 페이지 번호 -1)*페이지당 보여질 게시글 수
	private int getPageStart() {
		return (this.page-1)*perPageNum;
	}

	public Criteria() {
		this.page = 1; // 페이지 번호
		this.perPageNum = 4; // 페이지당 보여줄 게시글 수 초기화
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
		} else {
			this.page = page;
		}
		
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = perPageNum;
		}
		
	}
	
	
		
	

}
