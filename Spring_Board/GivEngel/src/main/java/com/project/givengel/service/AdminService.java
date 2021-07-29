package com.project.givengel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.givengel.vo.AdminChartBarVO;
import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.MsgVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

public interface AdminService {

	/************************************************
	 * 개발자 모드 로그인 관리 Service 						*
	 ************************************************/
	AdminVO login(AdminVO vo);
	public int checkAdminId(AdminVO vo);

	
	/************************************************
	 * 개발자 모드 개발자 계정 관리 Service 					*
	 ************************************************/
	public List<AdminVO> selectAdmins();
	public AdminVO selectAdmin(String admin_id);
	public void insertAdmins(AdminVO vo);
	public void updateAdmins(AdminVO vo);
	public void deleteAdmins(AdminVO vo);
	public List<AdminVO> searchAdmin(Map<String,String> map);

	
	
	
	/************************************************
	 * 개발자 모드 유저 계정 관리 Service 					*
	 ************************************************/
	public List<UserVO> selectUsers();
	public List<UserVO> searchUser(Map<String,String> map);
	public UserVO selectUser(UserVO vo);
	public void deleteUser(UserVO vo);
	public void updateUser(UserVO vo);

	
	
	

	
	/************************************************
	 * 개발자 모드 누적 데이터 관리 Service 					*
	 ************************************************/
	public int userCount();
	public int priceCount();
	public int cashCount();
	public int orderCount();
	public int adminCount();
	public int selectTodayUser();
	public int priceRate();
	public int userRate();
	public int cashRate();
	public int countBag();
	public int countAcc();
	public int countTop();
	public int countBottom();

	

	
	/************************************************
	 * 개발자 모드 상품 관리 Service 						*
	 ************************************************/
	public List<GoodVO> selectGood();
	public void insertGood(GoodVO vo);
	public void updateGood(GoodVO vo);
	public void deleteGood(GoodVO vo);
	public List<GoodVO> searchGood(Map<String, String> map);	
	
	
	
	
	/************************************************
	 * 개발자 모드 후원 단체 관리 Service 					*
	 ************************************************/
	public List<SponVO> selectSpon();
	public void insertSpon(SponVO vo);
	public void updateSpon(SponVO vo);
	public void deleteSpon(SponVO vo);

	

	
	

	/************************************************
	 * 개발자 모드 중고 장터 관리 Service 					*
	 ************************************************/
	public List<FleaVO> selectFleaList();
	public List<FleaVO> searchFlea(Map<String,Object> map);
	public FleaVO selectFlea(FleaVO vo);
	public void updateFleaTest(Map<String,Object> map);
	public void deleteFlea(FleaVO vo);


	/************************************************
	 * 개발자 모드 차트 데이터 관리 Service 					*
	 ************************************************/
	public List<AdminChartTimeVO> chartPricePerTime();
	public List<AdminChartBarVO> chartPriceAndCash();
	public List<HashMap<String,Object>> chartHotCatergory();



	/************************************************
	* 개발자 모드 메시지 데이터 관리 DAO 						*
	************************************************/
	public void insertMsg(MsgVO vo);
	public List<MsgVO> selectMsg(MsgVO vo);
	public List<MsgVO> myMsg(String msg_from);
	public List<MsgVO> timeLine(MsgVO vo);







}
