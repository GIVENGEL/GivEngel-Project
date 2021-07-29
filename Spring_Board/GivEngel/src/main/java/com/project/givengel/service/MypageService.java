package com.project.givengel.service;

import java.util.HashMap;
import java.util.List;

import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

public interface MypageService {
	public int userGradeBuy(UserVO vo);
	public List<HashMap<String,Object>> myfleaMarket(UserVO vo);
	public void mycountGoodStock(GoodVO vo);
	public List<HashMap<String,Object>> myCartList(UserVO vo);
	
	public List<HashMap<String,Object>> myBuyList(UserVO vo);
	  
	public String birthDetect(UserVO vo);
	
	public String genderDetect(UserVO vo);
	 
	public int myPwdConfirm(UserVO vo); 
	 
	public int myNickConfirm(UserVO vo);
	
	public int myTelConfirm(UserVO vo);
	
	public int myAddrConfirm(UserVO vo);
	 
	public List<User_cashlogVO> myCashList(UserVO vo);
	
	public void minusCart(CartVO vo);
	
	public void plusCart(CartVO vo);
 
}
