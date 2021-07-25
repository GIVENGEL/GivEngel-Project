package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Repository("MypageDAO") 
public class MypageDAOImpl {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
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
}   
