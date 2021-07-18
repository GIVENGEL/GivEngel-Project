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
	public UserVO login(UserVO vo) {
		
		return loginDAO.login(vo);
	}

	@Override
	public String join(UserVO vo,String confirm_pw) {
		
		return loginDAO.join(vo,confirm_pw);
	}

	@Override
	public void find(UserVO vo) {
		
		loginDAO.find(vo);
	}
	@Override
	public int idChk(UserVO vo) {
		return loginDAO.idChk(vo);
	}
	@Override
	public UserVO idFind(UserVO vo) {
		return loginDAO.idFind(vo);
	}
	@Override
	public UserVO pwFind(UserVO vo) {
		return loginDAO.pwFind(vo);
	}
	
	@Override
	public UserVO findId(UserVO vo) {
		
		return loginDAO.findId(vo);
	}
	
	@Override
	public UserVO findPw(UserVO vo) {
		
		return loginDAO.findPw(vo);
	}

}
