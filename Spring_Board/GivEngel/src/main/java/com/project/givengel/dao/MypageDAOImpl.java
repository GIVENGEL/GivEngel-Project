package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Repository("MypageDAO") 
public class MypageDAOImpl {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HashMap<String,Object>> myfleaMarket(UserVO vo){
		
		return mybatis.selectList("MypageDAO.myfleaMarket", vo);
	}
	
	public void mycountGoodStock(GoodVO vo) {
		mybatis.update("MypageDAO.mycountGoodStock", vo);
	}
	
	public String birthDetect(UserVO vo) {
		
		return mybatis.selectOne("MypageDAO.birthDetect", vo);
	} 
	
	public String genderDetect(UserVO vo) {
		
		return mybatis.selectOne("MypageDAO.genderDetect", vo);
	} 
	
	
	public List<HashMap<String,Object>> myCartList(UserVO vo) {
		return mybatis.selectList("MypageDAO.myCartList", vo);
	}
	 public List<HashMap<String,Object>> myBuyList(UserVO vo) {
	  System.out.println(mybatis.selectList("MypageDAO.myBuyList",vo) + "리스트 확인");
	      
	 return mybatis.selectList("MypageDAO.myBuyList",vo); }  
	    
		//비번확인 후 업데이트
	public int myPwdConfirm(UserVO vo) { 
		System.out.println();
		return mybatis.update("MypageDAO.myPwdConfirm", vo);
	} 
	 
	public int myNickConfirm(UserVO vo) {
		return mybatis.update("MypageDAO.myNickConfirm", vo);
	}
	 
	public int myTelConfirm(UserVO vo) {
		return mybatis.update("MypageDAO.myTelConfirm",vo);
	}
	
	public int myAddrConfirm(UserVO vo) {
		return mybatis.update("MypageDAO.myAddrConfirm", vo);
	}
	  
	//캐시로그 리스트 
	public List<User_cashlogVO> myCashList(UserVO vo){
		
		return mybatis.selectList("MypageDAO.myCashList", vo); 
	}
	 
	public int userGradeBuy(UserVO vo) {
		return mybatis.selectOne("MypageDAO.userGradeBuy", vo);
	}
	
	public void minusCart(CartVO vo) { 
		mybatis.update("MypageDAO.minusCart", vo);
	}
	
	public void plusCart(CartVO vo) {
		mybatis.update("MypageDAO.plusCart", vo);
	}
	
}   
