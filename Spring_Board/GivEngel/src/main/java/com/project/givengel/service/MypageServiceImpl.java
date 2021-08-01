package com.project.givengel.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.MypageDAOImpl;
import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Service("MypageService")
public class MypageServiceImpl {
	 
	@Autowired
	private MypageDAOImpl mypageDAO;
	//비밀번호 확인 업데이트

	public int myPwdConfirm(UserVO vo) {
		System.out.println(mypageDAO.myPwdConfirm(vo) + "뭔지확인");
		return mypageDAO.myPwdConfirm(vo);
	}
	
	public int myNickConfirm(UserVO vo) {
		return mypageDAO.myNickConfirm(vo);
	}
	
	public int myTelConfirm(UserVO vo) {
		return mypageDAO.myTelConfirm(vo);
	}
	
	public int myAddrConfirm(UserVO vo) {
		return mypageDAO.myAddrConfirm(vo);
	}
	
	public List<HashMap<String,Object>> myfleaMarket(UserVO vo){
		return mypageDAO.myfleaMarket(vo);
	}
	
	//바이로그 불러오기
	public List<HashMap<String,Object>> myBuyList(UserVO vo) {
		System.out.println(mypageDAO.myBuyList(vo)+ "서비스확인");
		return mypageDAO.myBuyList(vo);  
	}   
	
	 
	//로그 불러오기
	public List<User_cashlogVO> myCashList(UserVO vo) {
		
		return mypageDAO.myCashList(vo);
	} 
	
	public String genderDetect(UserVO vo) {
		  
		return mypageDAO.genderDetect(vo);
	}
	
	public String birthDetect(UserVO vo) {
		  
		return mypageDAO.birthDetect(vo);
	}
	
	public List<HashMap<String,Object>> myCartList(UserVO vo) {
		
		return mypageDAO.myCartList(vo);
	}
	 
	public void mycountGoodStock(GoodVO vo) {
		mypageDAO.mycountGoodStock(vo);
	}
	 
	public int userGradeBuy(UserVO vo) {
		return mypageDAO.userGradeBuy(vo);
	}
	   
	public void minusCart(CartVO vo) {
		mypageDAO.minusCart(vo);
	}
	public void plusCart(CartVO vo) {
		mypageDAO.plusCart(vo); 
	}
	
	public void allCartComplete(UserVO vo) {
		mypageDAO.allCartComplete(vo);
	}
	
	public void mydeleteCart(CartVO vo) {
		mypageDAO.mydeleteCart(vo);  
	} 
	
	public UserVO userInfoView(UserVO vo) {
		return mypageDAO.userInfoView(vo); 
	}
	   

} 
