package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.UserVO;

public interface LoginDAO {
	public void login(UserVO vo);
	
	public void join(UserVO vo);
	
	public void find(UserVO vo);
	
	public List<UserVO> test();
}
