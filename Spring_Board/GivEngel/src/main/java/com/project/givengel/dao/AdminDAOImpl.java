package com.project.givengel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.givengel.vo.AdminChartBarVO;
import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.MsgVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	/************************************************
	 * 개발자 모드 로그인 DAO 							*
	 ************************************************/
	@Override
	public AdminVO login(AdminVO vo) {
		AdminVO vos = mybatis.selectOne("AdminDAO.login",vo);
		if(vos!=null) {
			System.out.println("[AdminDAOImple] login함수 실행 : " + vos.getAdmin_id());
		}
		return vos;
	}
	@Override
	public int checkAdminId(AdminVO vo) {
		return mybatis.selectOne("AdminDAO.checkAdminId",vo);
	}
	
	/************************************************/
	
	
	
	
	
	
	/************************************************
	 * 개발자 모드 계정 관리 DAO 							*
	 ************************************************/
	@Override
	public List<AdminVO> selectAdmins() {
		return mybatis.selectList("AdminDAO.selectAdmins");
	}
	@Override
	public AdminVO selectAdmin(String admin_id) {
		return mybatis.selectOne("AdminDAO.selectAdmin", admin_id);
	}
	@Override
	public List<AdminVO> searchAdmin(Map<String,String> map) {
		return mybatis.selectList("AdminDAO.searchAdmin", map);
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
	
	/************************************************/
	
	
	
	
	
	
	
	
	/************************************************
	* 개발자 모드 유저 계정 관리 DAO 						*
	************************************************/
	@Override
	public List<UserVO> selectUsers() {
		return mybatis.selectList("AdminDAO.selectUsers");
	}
	@Override
	public List<UserVO> searchUser(Map<String, String> map) {
		return mybatis.selectList("AdminDAO.searchUser",map);
	}
	@Override
	public UserVO selectUser(UserVO vo) {
		return mybatis.selectOne("AdminDAO.selectUser", vo);
	}
	@Override
	public void updateUser(UserVO vo) {
		mybatis.update("AdminDAO.updateUser",vo);
	}
	@Override
	public void deleteUser(UserVO vo) {
		mybatis.delete("AdminDAO.deleteUser", vo);
	}
	
	/************************************************/

	
	
	
	
	
	
	/************************************************
	* 개발자 모드 누적 데이터 관리 DAO 						*
	************************************************/
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
	public int orderCount() {
		int result = mybatis.selectOne("AdminDAO.selectUserBuyLog");
		return result;
	}
	@Override
	public int adminCount() {
		return mybatis.selectOne("AdminDAO.adminCount");
	}
	@Override
	public int selectTodayUser() {
		return mybatis.selectOne("AdminDAO.selectTodayUser");
	}
	@Override
	public int priceRate() {
		int x = Math.round(mybatis.selectOne("AdminDAO.priceRate"));
		return x;
	}
	@Override
	public int userRate() {
		int x = Math.round(mybatis.selectOne("AdminDAO.userRate"));
		return x;
	}
	@Override
	public int cashRate() {
		int x = Math.round(mybatis.selectOne("AdminDAO.cashRate"));
		return x;
	}
	@Override
	public int countBag() {
		return mybatis.selectOne("AdminDAO.countBag");
	}
	@Override
	public int countAcc() {
		return mybatis.selectOne("AdminDAO.countAcc");
	}
	@Override
	public int countTop() {
		return mybatis.selectOne("AdminDAO.countTop");
	}
	@Override
	public int countBottom() {
		return mybatis.selectOne("AdminDAO.countBottom");
	}
	


	
	/************************************************/
	
	
	
	
	
	
	
	
	/************************************************
	* 개발자 모드 상품 관리 DAO 							*
	************************************************/
	@Override
	public List<GoodVO> selectGood() {
		return mybatis.selectList("AdminDAO.selectGood");
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
		mybatis.delete("AdminDAO.deleteGodd_com",vo);
	}
	@Override
	public List<GoodVO> searchGood(Map<String,String> map){	
		return mybatis.selectList("AdminDAO.searchGood", map);
	}
	
	/************************************************/

	
	
	
	
	
	
	
	/************************************************
	* 개발자 모드 후원 단체 관리 DAO 						*
	************************************************/
	@Override
	public List<SponVO> selectSpon() {	
		return mybatis.selectList("AdminDAO.selectSpon");
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
		mybatis.delete("AdminDAO.deleteSpon_com",vo);
	}
	/************************************************/



	
	
	
	
	
	
	
	
	/************************************************
	* 개발자 모드 중고장터 관리 DAO 						*
	************************************************/
	@Override
	public List<FleaVO> selectFleaList() {
		return mybatis.selectList("AdminDAO.selectFleaList");
	}
	@Override
	public List<FleaVO> searchFlea(Map<String, Object> map) {
		return mybatis.selectList("AdminDAO.searchFlea", map);
	}
	@Override
	public FleaVO selectFlea(FleaVO vo) {
		return mybatis.selectOne("AdminDAO.selectFlea",vo);
	}
	@Override
	public void updateFleaTest(Map<String, Object> map) {
		mybatis.update("AdminDAO.updateFleaTest", map);
	}
	@Override
	public void deleteFlea(FleaVO vo) {
		mybatis.delete("AdminDAO.deleteFlea", vo);
	}
	
	/************************************************/

	
	
	
	
	
	
	
	
	
	
	
	/************************************************
	* 개발자 모드 차트 데이터 관리 DAO 						*
	************************************************/
	@Override
	public List<AdminChartTimeVO> chartPricePerTime() {
		return mybatis.selectList("AdminDAO.chartPricePerTime");
	}
	@Override
	public List<AdminChartBarVO> chartPriceAndCash() {
		return mybatis.selectList("AdminDAO.chartPriceAndCash");
	}
	@Override
	public List<HashMap<String,Object>> chartHotCatergory(){
		return mybatis.selectList("AdminDAO.chartHotCategory");
	}

	/************************************************/


	
	
	
	
	
	
	
	
	/************************************************
	* 개발자 모드 메시지 데이터 관리 DAO 						*
	************************************************/
	public void insertMsg(MsgVO vo) {
		mybatis.insert("MsgDAO.insertMsg",vo);
	}
	public List<MsgVO> selectMsg(MsgVO vo){
		return mybatis.selectList("MsgDAO.selectMsg",vo);
	}
	@Override
	public List<MsgVO> myMsg(String msg_from) {
		return mybatis.selectList("MsgDAO.myMsg", msg_from);
	}
	@Override
	public List<MsgVO> timeLine(MsgVO vo){
		return mybatis.selectList("MsgDAO.timeLine",vo);
	}

	



}
