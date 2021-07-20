package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LikeToVO;
//*******************************************************************
// 김민주
// 상품리스트 서비스
public interface GoodListService {
	
	// 전체상품
	List<GoodVO> getGoodList(String categories, String color,String sorting);
	// 인기상품
	List<GoodVO> getPopularGoodList(String categories, String color);
	// 최신상품
	List<GoodVO> getlatestGood1();
	List<GoodVO> getlatestGood2();
	List<GoodVO> getlatestGood3();
	// 좋아요 카운트
	List<LikeToVO> getGoodLike();
	
}
