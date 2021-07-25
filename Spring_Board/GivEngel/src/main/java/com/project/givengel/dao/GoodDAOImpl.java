package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.Good_comVO;
import com.project.givengel.vo.LikeToVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;


//********************************************
//김민주
//GoodDAOImpl
@Repository("GoodDAO")
public class GoodDAOImpl implements GoodDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
//	전체상품(카테고리 별로) 가져옴 // 추후 파라매터 추가 예정(good_price 순 정렬)
	@Override
	public List<GoodVO> getGoodList(String categories,String color, String sorting, String keyword) {
		HashMap map = new HashMap();
		map.put("categories", categories);
		map.put("color", color);
		map.put("sorting", sorting);
		map.put("keyword", keyword);
		
		
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


	

//	상품 댓글 리스트
	@Override
	public List<Good_comVO> listGoodCom(Good_comVO comVO) {
		System.out.println("====>mybatis listGoodCom() 호출");
		return mybatis.selectList("GoodDAO.listGoodCom", comVO);
	}
	
	
//	상품 상세정보
	@Override
	public GoodVO getGoodView(GoodVO vo) {
		return mybatis.selectOne("GoodDAO.getGoodView", vo);
	}
	
//	판매량순 추천상품
	@Override
	public List<GoodVO> rankingGood() {
		return mybatis.selectList("GoodDAO.rankingGood");
	}


	
//	상품 댓글 유효성
	public UserVO loginCheckCom(UserVO uvo) {
		System.out.println("====>mybatis loginCheckCom() 호출");
		return mybatis.selectOne("GoodDAO.loginCheckCom", uvo);
	}
	
//	상품 댓글 입력
	@Override
	public void addGoodCom(Good_comVO gvo) {
		System.out.println("====>mybatis addGoodCom() 호출");		
		mybatis.insert("GoodDAO.addGoodCom", gvo);
	}

//	상품 댓글 삭제
	@Override
	public void deleteGoodCom(Good_comVO gvo) {
		System.out.println("====>mybatis deleteGoodCom() 호출");		
		mybatis.delete("GoodDAO.deleteGoodCom", gvo);
	}
	
//	상품 댓글 수정
	@Override
	public void modifyGoodCom(Good_comVO gvo) {
		System.out.println("====>mybatis modifyGoodCom() 호출");
		
		mybatis.update("GoodDAO.modifyGoodCom", gvo);
	}

//	상품 구매로그 저장
	@Override
	public void addUserBuyLog(User_buylogVO vo) {
		System.out.println("====>mybatis addUserBuyLog() 호출");		
		mybatis.insert("GoodDAO.addUserBuyLog", vo);
		
	}

//	유저 마일리지 적립
	@Override
	public void addUserM(String user_no, String buy_totalPrice, String good_no) {
		HashMap map = new HashMap();
		map.put("user_no", user_no);
		map.put("buy_totalPrice", buy_totalPrice);
		map.put("good_no", good_no);
		System.out.println("====>mybatis addUserM() 호출");
		mybatis.update("GoodDAO.addUserM", map);
	}
	
//	유저 마일리지 로그 업데이트
	@Override
	public void addUserMLog(User_cashlogVO vo) {
		System.out.println("====>mybatis addUserMLog() 호출");
		mybatis.insert("GoodDAO.addUserMLog", vo);		
	}
	
	
//	상품 재고 업데이트
	@Override
	public void countGoodStock(GoodVO gvo) {
		System.out.println("====>mybatis countGoodStock() 호출");		
		mybatis.update("GoodDAO.countGoodStock", gvo);
	}

//	장바구니 추가
	@Override
	public void addCart(CartVO vo) {
		System.out.println("====>mybatis addCart() 호출");		
		mybatis.insert("GoodDAO.addCart", vo);
	}


	



	



}
