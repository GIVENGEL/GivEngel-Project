package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.AdminDAO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public AdminVO login(AdminVO vo) {
		return adminDAO.login(vo);
	}
	
	public int userCount() {
		return adminDAO.userCount();
	}
	
	public int priceCount() {
		return adminDAO.priceCount();
	}
	
	@Override
	public int cashCount() {
		return adminDAO.cashCount();
	}

	@Override
	public List<GoodVO> selectGood() {
		return adminDAO.selectGood();
	}

	@Override
	public List<SponVO> selectSpon() {
		return adminDAO.selectSpon();
	}

	@Override
	public void insertGood(GoodVO vo) {
		adminDAO.insertGood(vo);
		
	}

	@Override
	public AdminVO selectAdmin(String admin_id) {
		return adminDAO.selectAdmin(admin_id);
	}

	@Override
	public void insertSpon(SponVO vo) {
		adminDAO.insertSpon(vo);
	}

}
