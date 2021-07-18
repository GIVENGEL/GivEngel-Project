package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.UserVO;

public interface LoginDAO {
	public UserVO login(UserVO vo);
	
	public String join(UserVO vo,String confirm_pw);
	
	public void find(UserVO vo);

	
	public int idChk(UserVO vo);
	
	public UserVO idFind(UserVO vo);
	public UserVO pwFind(UserVO vo);
	public UserVO findId(UserVO vo);
	public UserVO findPw(UserVO vo);
}
