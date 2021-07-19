package com.project.givengel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.UserVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public AdminVO login(AdminVO vo) {
		System.out.println("[AdminDAOImple] 파라미터 입력 : " + vo.getAdmin_id());
		AdminVO vos = mybatis.selectOne("AdminDAO.login",vo);
		if(vos!=null) {
			System.out.println("[AdminDAOImple] login함수 실행 : " + vos.getAdmin_id());
		}
		return vos;
	}
	
	@Override
	public int userCount() {
		return mybatis.selectOne("AdminDAO.userCount");
	}

	

}
