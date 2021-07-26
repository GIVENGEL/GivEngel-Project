package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.givengel.vo.AdminChartBarVO;
import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

public interface AdminDAO {

	
	public AdminVO login(AdminVO vo);
	public int checkAdminId(AdminVO vo);
	
	
	
	
	public AdminVO selectAdmin(String admin_id);
	public List<AdminVO> selectAdmins();
	public void insertAdmins(AdminVO vo);
	public void updateAdmins(AdminVO vo);
	public void deleteAdmins(AdminVO vo);
	public List<AdminVO> searchAdmin(Map<String,String> map);


	public int userCount();
	public int priceCount();
	public int cashCount();
	public int orderCount();

	public List<UserVO> selectUsers();
	public List<UserVO> searchUser(Map<String,String> map);
	public void deleteUser(UserVO vo);
	public UserVO selectUser(UserVO vo);

	

	public List<GoodVO> selectGood();
	public void insertGood(GoodVO vo);
	public void updateGood(GoodVO vo);
	public void deleteGood(GoodVO vo);
	public List<GoodVO> searchGood(Map<String,String> map);
	
	
	
	
	public List<SponVO> selectSpon();
	public void insertSpon(SponVO vo);
	public void updateSpon(SponVO vo);
	public void deleteSpon(SponVO vo);
	
	
	
	
	public List<FleaVO> selectFleaList();
	public List<FleaVO> searchFlea(Map<String,Object> map);
	public FleaVO selectFlea(FleaVO vo);
	public void updateFleaTest(Map<String,Object> map);
	public void deleteFlea(FleaVO vo);

	

	
	
	public List<AdminChartTimeVO> chartPricePerTime();
	public List<AdminChartBarVO> chartPriceAndCash();
	

	
	


}
