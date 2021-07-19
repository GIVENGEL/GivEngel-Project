package com.project.givengel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.AdminDAO;
import com.project.givengel.vo.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public AdminVO login(AdminVO vo) {
		return adminDAO.login(vo);
	}
}
