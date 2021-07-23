package com.project.givengel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;

public interface AdminService {
		AdminVO login(AdminVO vo);
		
		public int userCount();
		
		public int priceCount();
		public int cashCount();
		
		public List<GoodVO> selectGood();
		
		public List<SponVO> selectSpon();
		
		public void insertGood(GoodVO vo);
		public void updateGood(GoodVO vo);
		public List<GoodVO> searchGood(Map<String, String> map);		
		
		public void insertSpon(SponVO vo);
		public void updateSpon(SponVO vo);
		public void deleteSpon(SponVO vo);
		
		public AdminVO selectAdmin(String admin_id);
		
		
		

}
