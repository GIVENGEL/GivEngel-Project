package com.project.givengel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public AdminVO login(AdminVO vo) {
		AdminVO vos = mybatis.selectOne("AdminDAO.login",vo);
		if(vos!=null) {
			System.out.println("[AdminDAOImple] login함수 실행 : " + vos.getAdmin_id());
		}
		return vos;
	}
	
	@Override
	public List<AdminVO> selectAdmins() {
		return mybatis.selectList("AdminDAO.selectAdmins");
	}
	
	@Override
	public int userCount() {
		return mybatis.selectOne("AdminDAO.userCount");
	}
	
	@Override
	public int priceCount() {
		return mybatis.selectOne("AdminDAO.priceCount");
	}
	
	@Override
	public int cashCount() {
		return mybatis.selectOne("AdminDAO.cashCount");
	}

	@Override
	public List<GoodVO> selectGood() {

		return mybatis.selectList("AdminDAO.selectGood");
	}

	@Override
	public List<SponVO> selectSpon() {
		
		return mybatis.selectList("AdminDAO.selectSpon");
	}

	
	
	@Override
	public void insertGood(GoodVO vo) {
		mybatis.insert("AdminDAO.insertGood", vo);
	}
	@Override
	public void updateGood(GoodVO vo) {
		mybatis.update("AdminDAO.updateGood",vo);
	}
	@Override
	public void deleteGood(GoodVO vo) {
		mybatis.delete("AdminDAO.deleteGood",vo);
	}
	
	@Override
	public List<GoodVO> searchGood(Map<String,String> map){	
		return mybatis.selectList("AdminDAO.searchGood", map);
	}

	
	
	
	@Override
	public AdminVO selectAdmin(String admin_id) {
		return mybatis.selectOne("AdminDAO.selectAdmin", admin_id);
		
	}

	
	
	@Override
	public void insertSpon(SponVO vo) {
		mybatis.insert("AdminDAO.insertSpon", vo);
	}
	@Override
	public void updateSpon(SponVO vo) {
		mybatis.update("AdminDAO.updateSpon",vo);
	}
	@Override
	public void deleteSpon(SponVO vo) {
		mybatis.delete("AdminDAO.deleteSpon",vo);
	}

	@Override
	public int orderCount() {
		int result = mybatis.selectOne("AdminDAO.selectUserBuyLog");
		return result;
	}

	@Override
	public List<AdminChartTimeVO> chartPricePerTime() {
		
		return mybatis.selectList("AdminDAO.chartPricePerTime");
	}

	@Override
	public List<AdminVO> searchAdmin(Map<String,String> map) {
		return mybatis.selectList("AdminDAO.searchAdmin", map);
	}

	@Override
	public int checkAdminId(AdminVO vo) {
		return mybatis.selectOne("AdminDAO.checkAdminId",vo);
	}

	@Override
	public void updateAdmins(AdminVO vo) {
		mybatis.update("AdminDAO.updateAdmins",vo);
		
	}

	@Override
	public void deleteAdmins(AdminVO vo) {
		mybatis.delete("AdminDAO.deleteAdmins",vo);
		
	}

	@Override
	public void insertAdmins(AdminVO vo) {
		mybatis.insert("AdminDAO.insertAdmins",vo);
		
	}

	

	

	

	

	

}
