package com.project.givengel.service;

import java.util.List;

import com.project.givengel.vo.UserVO;

public interface LoginService {
	void login(UserVO vo);

	void join(UserVO vo);

	void find(UserVO vo);
	
	List<UserVO> test();
	
}
