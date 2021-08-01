package com.project.givengel.vo;

import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingVO {
	
	
	private CriteriaGood cri;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 3;
	
	public CriteriaGood getCri() {
		return cri;
	}
	public void setCri(CriteriaGood cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	// cri.getPage() 현재페이지 번호
	// cri.getPerPageNum() 한 페이지당 보여줄 게시글의 수
	// 끝 페이지 번호 = (현재페이지 번호 / 화면에 보여질 페이지 번호의 개수) * 화면에 보여질 페이지 번호의 개수
	// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 수
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		startPage = (endPage - displayPageNum) +1;
		if(startPage <= 0) startPage=1;
		
		prev = startPage == 1 ? false:true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false:true;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int dispalyPageNum) {
		this.displayPageNum = dispalyPageNum;
	}
	@Override
	public String toString() {
		return "PagingVO [cri=" + cri + "totalCount=" + totalCount + "startPage=" + startPage + "endPage="
				+ endPage + "prev=" + prev + "next=" + next + "displayPageNum=" + displayPageNum + "]";
	}

	

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
		.queryParam("page", page)
		.queryParam("pagePageNum", cri.getPerPageNum())
		.build();
		
		return uriComponents.toUriString();
	}
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pagePageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteriaGood)cri).getSearchType())
				.queryParam("keyword", encodingkeyword(((SearchCriteriaGood)cri).getKeyword()))
				.queryParam("categories", encodingCategories(((SearchCriteriaGood)cri).getCategories()))
				.queryParam("color", encodingColor(((SearchCriteriaGood)cri).getColor()))
				.queryParam("spon_no", encodingSpon_no(((SearchCriteriaGood)cri).getSpon_no()))
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String encodingkeyword(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(Exception e) {
			return "";
		}
	}
	public String encodingCategories(String categories) {
		if(categories == null || categories.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(categories, "UTF-8");
		} catch(Exception e) {
			return "";
		}
	}
	public String encodingColor(String color) {
		if(color == null || color.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(color, "UTF-8");
		} catch(Exception e) {
			return "";
		}
	}
	public String encodingSpon_no(String spon_no) {
		if(spon_no == null || spon_no.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(spon_no, "UTF-8");
		} catch(Exception e) {
			return "";
		}
	}


}
