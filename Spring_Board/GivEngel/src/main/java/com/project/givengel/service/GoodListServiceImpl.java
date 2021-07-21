package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.GoodDAOImpl;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LikeToVO;
//*******************************************************************
//김민주
//상품리스트 서비스
@Service("goodListService")
public class GoodListServiceImpl implements GoodListService {
	
	@Autowired
	private GoodDAOImpl goodDAO;
	
//	전체상품(카테고리 별로) 가져옴 // 추후 파라매터 추가 예정(good_price 순 정렬)
	@Override
	public List<GoodVO> getGoodList(String categories, String color, String sorting) {
		
		return goodDAO.getGoodList(categories,color,sorting);
	}
	
//	인기상품(like 순)
	@Override
	public List<GoodVO> getPopularGoodList(String categories, String color) {
		
		return goodDAO.getPopularGoodList(categories,color);
	}
	
//  최신상품(date 순 정렬) 가져옴
	@Override
	public List<GoodVO> getlatestGood1() {
		
		return goodDAO.getlatestGood1();
	}
	@Override
	public List<GoodVO> getlatestGood2() {
		
		return goodDAO.getlatestGood2();
	}
	@Override
	public List<GoodVO> getlatestGood3() {
		
		return goodDAO.getlatestGood3();
	}


	@Override
	public List<LikeToVO> getGoodLike() {
		return goodDAO.getGoodLike();
	}
	

}
