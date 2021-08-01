package com.project.givengel.vo;

public class SearchCriteriaGood extends CriteriaGood {
	
	private String searchType;
	private String keyword;
	private String categories;
	private String color;
	private String spon_no;

	public String getSpon_no() {
		return spon_no;
	}

	public void setSpon_no(String spon_no) {
		this.spon_no = spon_no;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteriaMJ [searchType=" + searchType + ", keyword=" + keyword + ", categories=" + categories
				+ ", color=" + color + ", spon_no=" + spon_no + "]";
	}




	
	

}
