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
	public void join(UserVO vo) {
		
		loginDAO.join(vo);
	}

	@Override
	public void find(UserVO vo) {
		
		loginDAO.find(vo);
	}
	
	public List<UserVO> test() {
		return loginDAO.test();
	}

}
