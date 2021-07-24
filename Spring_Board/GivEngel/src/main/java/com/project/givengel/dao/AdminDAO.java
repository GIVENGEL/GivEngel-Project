package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;

public interface AdminDAO {

	
	public AdminVO login(AdminVO vo);
	public int checkAdminId(AdminVO vo);
	
	
	
	
	public AdminVO selectAdmin(String admin_id);
	public List<AdminVO> selectAdmins();
	public void updateAdmins(AdminVO vo);
	public void deleteAdmins(AdminVO vo);
	public List<AdminVO> searchAdmin(Map<String,String> map);


	public int userCount();
	public int priceCount();
	public int cashCount();
	public int orderCount();

	

	

	public List<GoodVO> selectGood();
	public void insertGood(GoodVO vo);
	public void updateGood(GoodVO vo);
	public void deleteGood(GoodVO vo);
	public List<GoodVO> searchGood(Map<String,String> map);
	
	public List<SponVO> selectSpon();
	public void insertSpon(SponVO vo);
	public void updateSpon(SponVO vo);
	public void deleteSpon(SponVO vo);
	

	
	
	public List<AdminChartTimeVO> chartPricePerTime();
	
	

	
	


}
