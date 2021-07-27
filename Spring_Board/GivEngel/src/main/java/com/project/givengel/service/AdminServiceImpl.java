package com.project.givengel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.AdminDAO;
import com.project.givengel.vo.AdminChartBarVO;
import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	
	
	@Autowired
	private AdminDAO adminDAO;
	
	
	
	
	
	
	
	/************************************************
	 * 개발자 모드 로그인 관리 Service 						*
	 ************************************************/
	@Override
	public AdminVO login(AdminVO vo) {
		return adminDAO.login(vo);
	}
	@Override
	public int checkAdminId(AdminVO vo) {
		return adminDAO.checkAdminId(vo);
	}
	
	/************************************************/
	
	
	
	
	
	
	
	
	/************************************************
	 * 개발자 모드 개발자 계정 관리 Service 					*
	 ************************************************/
	@Override
	public List<AdminVO> selectAdmins() {
		return adminDAO.selectAdmins();
	}
	@Override
	public AdminVO selectAdmin(String admin_id) {
		return adminDAO.selectAdmin(admin_id);
	}
	@Override
	public List<AdminVO> searchAdmin(Map<String,String> map) {
		return adminDAO.searchAdmin(map);
	}
	@Override
	public void updateAdmins(AdminVO vo) {
		adminDAO.updateAdmins(vo);	
	}
	@Override
	public void deleteAdmins(AdminVO vo) {
		adminDAO.deleteAdmins(vo);	
	}
	@Override
	public void insertAdmins(AdminVO vo) {
		adminDAO.insertAdmins(vo);
	}
	/************************************************/

	
	
	
	
	
	
	
	
	/************************************************
	 * 개발자 모드 유저 계정 관리 Service 					*
	 ************************************************/
	@Override
	public List<UserVO> selectUsers() {
		return adminDAO.selectUsers();
	}
	@Override
	public List<UserVO> searchUser(Map<String, String> map) {
		return adminDAO.searchUser(map);
	}
	@Override
	public UserVO selectUser(UserVO vo) {
		return adminDAO.selectUser(vo);
	}
	@Override
	public void deleteUser(UserVO vo) {
		adminDAO.deleteUser(vo);
	}
	@Override
	public void updateUser(UserVO vo) {
		adminDAO.updateUser(vo);
	}

	
	/************************************************/

	
	
	
	
	
	/************************************************
	 * 개발자 모드 누적 데이터 관리 Service 					*
	 ************************************************/
	@Override
	public int userCount() {
		return adminDAO.userCount();
	}
	@Override
	public int priceCount() {
		return adminDAO.priceCount();
	}
	@Override
	public int cashCount() {
		return adminDAO.cashCount();
	}
	@Override
	public int orderCount() {
		return adminDAO.orderCount();
	}
	
	/************************************************/
	
	
	
	
	
	
	
	/************************************************
	 * 개발자 모드 상품 관리 Service 						*
	 ************************************************/
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
	
	/************************************************/

	
	
	
	
	
	
	/************************************************
	 * 개발자 모드 후원 단체 관리 Service 					*
	 ************************************************/
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
	
	/************************************************/



	
	
	
	
	
	/************************************************
	 * 개발자 모드 중고 장터 관리 Service 					*
	 ************************************************/
	@Override
	public List<FleaVO> selectFleaList() {
		return adminDAO.selectFleaList();
	}
	@Override
	public List<FleaVO> searchFlea(Map<String, Object> map) {
		return adminDAO.searchFlea(map);
	}
	@Override
	public FleaVO selectFlea(FleaVO vo) {
		return adminDAO.selectFlea(vo);
	}
	@Override
	public void updateFleaTest(Map<String, Object> map) {
		adminDAO.updateFleaTest(map);
	}
	@Override
	public void deleteFlea(FleaVO vo) {
		adminDAO.deleteFlea(vo);
	}
	
	/************************************************/

	
	
	
	


	/************************************************
	 * 개발자 모드 차트 데이터 관리 Service 					*
	 ************************************************/
	@Override
	public List<AdminChartTimeVO> chartPricePerTime() {
		return adminDAO.chartPricePerTime();
	}
	@Override
	public List<AdminChartBarVO> chartPriceAndCash() {
		return adminDAO.chartPriceAndCash();
	}

	
	


	
	

	

}
