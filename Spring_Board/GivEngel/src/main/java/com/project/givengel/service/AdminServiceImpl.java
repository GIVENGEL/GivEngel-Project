package com.project.givengel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.AdminDAO;
import com.project.givengel.vo.AdminChartTimeVO;
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
	public AdminVO selectAdmin(String admin_id) {
		return adminDAO.selectAdmin(admin_id);
	}

	
	@Override
	public List<GoodVO> selectGood() {
		return adminDAO.selectGood();
	}
	@Override
	public void insertGood(GoodVO vo) {
		adminDAO.insertGood(vo);
	}
	@Override
	public void updateGood(GoodVO vo) {
		adminDAO.updateGood(vo);
	}
	@Override
	public void deleteGood(GoodVO vo) {
		adminDAO.deleteGood(vo);
	}

	@Override
	public List<GoodVO> searchGood(Map<String, String> map) {
		return adminDAO.searchGood(map);
	}
	
	
	
	
	@Override
	public List<SponVO> selectSpon() {
		return adminDAO.selectSpon();
	}
	@Override
	public void insertSpon(SponVO vo) {
		adminDAO.insertSpon(vo);
	}
	@Override
	public void updateSpon(SponVO vo) {
		adminDAO.updateSpon(vo);
	}
	@Override
	public void deleteSpon(SponVO vo) {
		adminDAO.deleteSpon(vo);
	}

	@Override
	public int orderCount() {
		return adminDAO.orderCount();
	}

	@Override
	public List<AdminChartTimeVO> chartPricePerTime() {
		// TODO Auto-generated method stub
		return adminDAO.chartPricePerTime();
	}

	@Override
	public List<AdminVO> selectAdmins() {
		return adminDAO.selectAdmins();
	}

	@Override
	public List<AdminVO> searchAdmin(Map<String,String> map) {
		return adminDAO.searchAdmin(map);
	}

	@Override
	public int checkAdminId(AdminVO vo) {
		return adminDAO.checkAdminId(vo);
	}

	@Override
	public void updateAdmins(AdminVO vo) {
		adminDAO.updateAdmins(vo);
		
	}

	@Override
	public void deleteAdmins(AdminVO vo) {
		adminDAO.deleteAdmins(vo);
		
	}
	


	
	

	

}
