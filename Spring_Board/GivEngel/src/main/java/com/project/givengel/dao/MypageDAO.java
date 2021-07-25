package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

public interface MypageDAO {
	
	public int myPwdConfirm(UserVO vo); 
	public int myNickConfirm(UserVO vo);
	public int myTelConfirm(UserVO vo);
	public int myAddrConfirm(UserVO vo);
	public List<User_cashlogVO> myCashList(UserVO vo);
 
} 
