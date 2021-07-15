package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.LoginDAOImpl;
import com.project.givengel.vo.UserVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAOImpl loginDAO;
	
	@Override
	public void login(UserVO vo) {
		
		loginDAO.login(vo);
	}

	@Override
	public String join(UserVO vo,String confirm_pw) {
		
		return loginDAO.join(vo,confirm_pw);
	}

	@Override
	public void find(UserVO vo) {
		
		loginDAO.find(vo);
	}

}
