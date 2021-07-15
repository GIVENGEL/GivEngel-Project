package com.project.givengel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.UserVO;

@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void login(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void join(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void find(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserVO> test() {
		System.out.println("===> Mybatis getid() 호출");
		return mybatis.selectList("LoginDAO.test");
		
	}
	
	

}
