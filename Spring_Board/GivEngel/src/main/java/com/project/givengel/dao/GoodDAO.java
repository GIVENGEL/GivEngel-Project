package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LikeToVO;

// ********************************************
// 김민주
// GoodDAO
public interface GoodDAO {
	
	// 전체상품(카테고리별)
	public List<GoodVO> getGoodList(String categories, String color, String sorting);
	// 인기상품
	public List<GoodVO> getPopularGoodList(String categories, String color);
	// 최신상품
	public List<GoodVO> getlatestGood1();
	public List<GoodVO> getlatestGood2();
	public List<GoodVO> getlatestGood3();
	// likeTo 테이블
	public List<LikeToVO> getGoodLike();
}
