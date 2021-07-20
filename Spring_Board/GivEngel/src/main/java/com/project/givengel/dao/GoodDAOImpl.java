package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LikeToVO;


//********************************************
//김민주
//GoodDAOImpl
@Repository("GoodDAO")
public class GoodDAOImpl implements GoodDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
//	전체상품(카테고리 별로) 가져옴 // 추후 파라매터 추가 예정(good_price 순 정렬)
	@Override
	public List<GoodVO> getGoodList(String categories,String color, String sorting) {
		HashMap map = new HashMap();
		map.put("categories", categories);
		map.put("color", color);
		map.put("sorting", sorting);
		
		return mybatis.selectList("GoodDAO.getGoodList",map);
	}
	
//	인기상품(like 순 정렬) 가져옴
	@Override
	public List<GoodVO> getPopularGoodList(String categories,String color) {
		HashMap map = new HashMap();
		map.put("categories", categories);
		map.put("color", color);
		
		return mybatis.selectList("GoodDAO.getGoodList",map);
	}

//  최신상품(date 순 정렬) 가져옴
	@Override
	public List<GoodVO> getlatestGood1() {
		return mybatis.selectList("GoodDAO.getlatestGood1");
	}
//  최신상품(date 순 정렬) 가져옴
	@Override
	public List<GoodVO> getlatestGood2() {
		return mybatis.selectList("GoodDAO.getlatestGood2");
	}
//  최신상품(date 순 정렬) 가져옴
	@Override
	public List<GoodVO> getlatestGood3() {
		return mybatis.selectList("GoodDAO.getlatestGood3");
	}

//	좋아요 카운트
	public List<LikeToVO> getGoodLike() {
		return mybatis.selectList("GoodDAO.getGoodLike");
	}


}
