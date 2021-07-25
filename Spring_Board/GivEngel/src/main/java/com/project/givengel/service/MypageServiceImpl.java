package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.MypageDAOImpl;
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
	 
	//로그 불러오기
	public List<User_cashlogVO> myCashList(UserVO vo) {
		
		return mypageDAO.myCashList(vo);
	} 

} 
