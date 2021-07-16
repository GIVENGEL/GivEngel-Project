package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.UserVO;

public interface LoginService {
	UserVO login(UserVO vo);

	String join(UserVO vo,String confirm_pw);

	void find(UserVO vo);
	
	int idChk(UserVO vo);
	
	UserVO idFind(UserVO vo);
	UserVO pwFind(UserVO vo);
	
}
