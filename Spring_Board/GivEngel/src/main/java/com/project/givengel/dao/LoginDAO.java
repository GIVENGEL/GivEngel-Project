package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.UserVO;

public interface LoginDAO {
	public void login(UserVO vo);
	
	public String join(UserVO vo,String confirm_pw);
	
	public void find(UserVO vo);

	
	public int idChk(UserVO vo);
}
