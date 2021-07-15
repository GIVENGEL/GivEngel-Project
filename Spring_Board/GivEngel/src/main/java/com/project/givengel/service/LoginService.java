package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.UserVO;

public interface LoginService {
	void login(UserVO vo);

	String join(UserVO vo,String confirm_pw);

	void find(UserVO vo);
	
	
}
