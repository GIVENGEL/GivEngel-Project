package com.project.givengel.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.givengel.service.AdminService;
import com.project.givengel.service.CampaignService;
import com.project.givengel.service.GoodListService;
import com.project.givengel.service.LogService;
import com.project.givengel.service.SponService;
import com.project.givengel.vo.AdminChartTimeVO;
import com.project.givengel.vo.AdminChartBarVO;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.FleaVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

@Controller
public class AdminController {
	
	
	/********************************************************/
	/****** Autowired ***/
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private LogService logService;
	
	@Autowired
	private SponService sponService;
	
	@Autowired
	private CampaignService campaignService;
	
	@Autowired
	private GoodListService goodListService;
	/********************************************************/
	
	

	
	/************************************************************************************************************
	 * 개발자모드 - 로그인/로그아웃 영역 	start																			*
	 ************************************************************************************************************/
	/************************
	 * 유틸 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	selectAdmin	[ajax]
	 * 
	 * 함수 기능 		:	1. admin_id로 VO를 찾아주는 함수
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-22
	 *****************************************************/
	@RequestMapping("/selectAdmin.giv")
	@ResponseBody
	public AdminVO selectAdmin(String admin_id) {
		AdminVO adminvo = new AdminVO();
		
		adminvo = adminService.selectAdmin(admin_id);
		return adminvo;
	}
	
	/************************
	 * 유틸 영역  end			*
	 ************************/
	
	
	
	
	
	/************************
	 * 로그인/아웃 영역 start 	*
	 ************************/
	/*****************************************************
	 * 함수명 			: 	adminLoginAction
	 * 
	 * 함수 기능 		:	1. 개발자 로그인 성공 시 세션 속성 저장
	 * 					2. 개발자 로그인 실패/성공에 따른 화면 전환
	 * 					3. 개발자 로그인 시 DB에 로그인 기록 저장
	 * 
	 * 사용된 함수 		:	insertAdminLoginLog
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value="/adminLoginAction.giv",method = RequestMethod.POST)
	public String adminLoginAction(AdminVO vo,HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		AdminVO login = adminService.login(vo);
		System.out.println("[AdminLoginAction] 파라미터 체크 : " + vo.getAdmin_id());
		if(login == null) {

			session.setAttribute("admin", null);
			rttr.addFlashAttribute("msg", false);
			return "/adminLogin";
		}else {
			System.out.println("[AdminLoginAction] 세션 생성 : " + login.getAdmin_id());

			session.setAttribute("admin", login);
			insertAdminLoginLog(vo);
			return "redirect:adminMode.giv";
		}
	}
	
	
	/*****************************************************
	 * 함수명 			: 	insertAdminLoginLog
	 * 
	 * 함수 기능 		:	1. 개발자 로그인 시 DB에 로그인 기록 저장
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/insertAdminLoginLog.giv")
	@ResponseBody
	public void insertAdminLoginLog(AdminVO adminvo) {
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[ADMIN_LOGIN]#"+adminvo.getAdmin_id());
		logService.insertLog(logvo);
	}

	/*****************************************************
	 * 함수명 			: 	adminLogOutAction
	 * 
	 * 함수 기능 		:	1. 개발자 로그아웃 시 세션  초기화
	 * 					2. 개발자 로그아웃 시 DB에 로그아웃 기록 저장
	 * 
	 * 사용된 함수 		:	insertAdminLogoutLog
	 * 사용된 서비스	 	:	-
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value = "/adminlogoutAction.giv", method = RequestMethod.GET)
	public String adminlogoutAction(HttpSession session) throws Exception{
		if(session.getAttribute("admin")!=null) {
			AdminVO vo = new AdminVO();
			vo = (AdminVO)session.getAttribute("admin");
			insertAdminLogoutLog(vo);
			session.invalidate();
			return "/index";
		}
		else {
			return "/index";
		}
		
	}
	
	/*****************************************************
	 * 함수명 			: 	insertAdminLogoutLog	[ajax]
	 * 
	 * 함수 기능 		:	1. 개발자 로그아웃 시 DB에 로그아웃 기록 저장
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/insertAdminLogoutLog.giv")
	@ResponseBody
	public void insertAdminLogoutLog(AdminVO adminvo) {
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[ADMIN_LOGOUT]#"+adminvo.getAdmin_id());
		logService.insertLog(logvo);
		
	}
	
	/************************
	 * 로그인/아웃 영역 end		*
	 ************************/

	/************************************************************************************************************
	 * 개발자모드 - 로그인/로그아웃 영역 	end																				*
	 ************************************************************************************************************/
	

	
	
	
	
	

	
	

	/************************************************************************************************************
	 * 개발자모드 - 상품 관리 영역 	start																				*
	 ************************************************************************************************************/
	/************************
	 * 유틸 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminSelectGoods
	 * 
	 * 함수 기능 		:	1. 상품 리스트를 맵으로 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/adminSelectGoods.giv")
	@ResponseBody
	public Map<String,Object> adminSelectGoods() {
		List<GoodVO> list = adminService.selectGood();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		return map;
	}
	
	
	/*****************************************************
	 * 함수명 			: 	adminSelectGood
	 * 
	 * 함수 기능 		:	1. 상품 리스트 중 4개를 맵으로 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/adminSelectGood.giv")
	@ResponseBody
	public Map<String,Object> adminSelectGood() {
		List<GoodVO> list = adminService.selectGood();
		List<GoodVO> temp = new ArrayList<GoodVO>();
		for(int i=0;i<4;i++) {
			temp.add(list.get(i));
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", temp);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	searchGood [ajax]
	 * 
	 * 함수 기능 		:	1. 상품을 검색하는 기능(part와 searchData 이용)
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/searchGood.giv")
	@ResponseBody
	public Map<String,Object> searchGood(String part,String searchData) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("part", part);
		map.put("searchData", searchData);
		List<GoodVO> list = new ArrayList<GoodVO>();
		list = adminService.searchGood(map);
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("list",list);
		return maps;
	}
	
	/************************
	 * 유틸 영역  end			*
	 ************************/
	
	
	/************************
	 * 삽입 영역  start			*
	 ************************/
	
	// 관리자 모드 - 상품관리 - 상품 추가 페이지 이동
	@RequestMapping("/adminElements.giv")
	public void adminElements() {
		
	}
	
	/*****************************************************
	 * 함수명 			: 	adminInsertGood
	 * 
	 * 함수 기능 		:	1. 상품의 정보를 받아 DB에 저장
	 * 					2. 상품의 이미지 파일을 로컬/서버에 저장
	 * 
	 * 사용된 함수 		:	insertAdminGoodLog
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value="/adminInsertGood.giv",method = RequestMethod.POST)
	public String adminInsertGood(GoodVO vo,String admin,String good_tags,String url,MultipartHttpServletRequest request) throws IllegalStateException, IOException {	
		// 서버 경로 
		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path = "resources\\img\\good\\";
		String path =root_path+attach_path;
		MultipartFile files = request.getFile("file");
		if(vo.getFile()==null) {
			System.out.println("파일이 비어있습니다.");
			vo.setFile(files,path);
		}else {
			vo.setFile(vo.getFile(),path);
		}	
		vo.setGood_tag(vo.getGood_tag()+good_tags);
		adminService.insertGood(vo);
		insertAdminGoodLog(vo,admin);
		return "redirect:adminMode.giv";
	}
	
	/*****************************************************
	 * 함수명 			: 	insertAdminGoodLog
	 * 
	 * 함수 기능 		:	1. 개발자 상품 등록 시 DB에 상품 등록 기록 저장
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/insertAdminGoodLog.giv")
	@ResponseBody
	public void insertAdminGoodLog(GoodVO goodvo,String admin) {
		LogVO logvo = new LogVO();
		if(admin==null) {
			admin="ERR";
		}
		logvo.setLog_detail("[ADMIN_INSERT_GOOD]#"+admin+"#"+goodvo.getGood_name());
		logService.insertLog(logvo);
	}
	
	/************************
	 * 삽입 영역  end			*
	 ************************/
	
	
	
	/************************
	 * 수정 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminGoodModify 
	 * 
	 * 함수 기능 		:	1. 상품 리스트 데이터를 Model 형태로 페이지에 전달하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminGoodModify.giv")
	public void adminGoodModify(GoodVO vo, Model m) {
		m.addAttribute("goodList",adminService.selectGood());
	}
	
	/*****************************************************
	 * 함수명 			: 	adminGoodModifyForm 
	 * 
	 * 함수 기능 		:	1. 특정 상품 정보를 Map의 형태로 페이지에 전달
	 * 					2. 태그 정보를 분할하여 데이터 전송
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	goodListService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminGoodModifyForm.giv")
	public Map<String, GoodVO> adminGoodModifyForm(GoodVO vo) {
		System.out.println("[adminGoodModifyForm] : " + vo.getGood_no());
		GoodVO vos = goodListService.getGoodView(vo);
		String[] tags =vos.getGood_tag().split("#");
		String result_tag="";
		for(int i=1;i<tags.length;i++) {
			result_tag += "#"+tags[i];
		}
		vos.setGood_tag(result_tag);
		Map<String, GoodVO> map = new HashMap<String, GoodVO>();
		map.put("good", vos);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminGoodDeleteAction 
	 * 
	 * 함수 기능 		:	1. 특정 상품의 정보롤 DB에서 수정하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping(value="/adminGoodModifyAction.giv",method = RequestMethod.POST)
	public String adminGoodModifyAction(GoodVO vo,String admin,String good_tags,String url) throws IllegalStateException, IOException {	
		vo.setGood_tag(vo.getGood_tag()+good_tags);
		adminService.updateGood(vo);
		return "redirect:adminGoodModify.giv";
	}
	
	/************************
	 * 수정 영역  end			*
	 ************************/
	
	
	/************************
	 * 삭제 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminGoodDelete 
	 * 
	 * 함수 기능 		:	1. 상품 리스트 데이터를 Model 형태로 페이지에 전달하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminGoodDelete.giv")
	public void adminGoodDelete(GoodVO vo, Model m) {
		m.addAttribute("goodList",adminService.selectGood());
	}
	
	/*****************************************************
	 * 함수명 			: 	adminGoodDeleteForm 
	 * 
	 * 함수 기능 		:	1. 특정 상품 정보를 Map의 형태로 페이지에 전달
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	goodListService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminGoodDeleteForm.giv")
	public Map<String, GoodVO> adminGoodDeleteForm(GoodVO vo) {
		GoodVO good = new GoodVO();
		good = goodListService.getGoodView(vo);
		Map<String, GoodVO> map = new HashMap<String, GoodVO>();
		map.put("good", good);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminGoodDeleteAction 
	 * 
	 * 함수 기능 		:	1. 상품을 DB에서 삭제하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminGoodDeleteAction.giv")
	public String adminGoodDeleteAction(GoodVO vo) {
		adminService.deleteGood(vo);
		return "redirect:adminGoodDelete.giv";
		
	}
	
	/************************
	 * 삭제 영역  end			*
	 ************************/
	
	/************************************************************************************************************
	 * 개발자모드 - 상품 관리 영역 	end																					*
	 ************************************************************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/************************************************************************************************************
	 * 개발자모드 - 후원 단체 관리 영역 	start																			*
	 ************************************************************************************************************/
	
	/************************
	 * 유틸 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminSelectSpon
	 * 
	 * 함수 기능 		:	1. 후원단체 리스트 전체를 맵에 담아 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스	 :	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/adminSelectSpon.giv")
	@ResponseBody
	public Map<String,Object> adminSelectSpon() {
		List<SponVO> list = adminService.selectSpon();
		List<SponVO> temp = new ArrayList<SponVO>();
		for(int i=0;i<list.size();i++) {
			temp.add(list.get(i));
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", temp);
		return map;
	}
	
	
	/************************
	 * 유틸 영역  end			*
	 ************************/
	
	

	/************************
	 * 삽입 영역  start			*
	 ************************/
	
	// 관리자 모드 - 후원 단체 관리 - 후원 단체 등록 페이지 이동
		@RequestMapping("/adminElements2.giv")
		public void adminElements2() {
			
		}
		
		
	/*****************************************************
	 * 함수명 			: 	adminInsertSpon
	 * 
	 * 함수 기능 		:	1. 후원단체 등록 기능
	 * 					2. 개발자 로그에 기록 저장
	 * 
	 * 사용된 함수 		:	insertAdminSponLog
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping(value="/adminInsertSpon.giv",method = RequestMethod.POST)
	public String adminInsertSpon(SponVO vo,String admins,MultipartHttpServletRequest request) throws IllegalStateException, IOException {	
		// 서버 경로 
		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path = "resources\\img\\spon\\";
		String path =root_path+attach_path;
		
		
		MultipartFile files = request.getFile("file");
		if(vo.getFile()==null) {
			System.out.println("파일이 비어있습니다.");
			vo.setFile(files,path);
		}else {
			vo.setFile(vo.getFile(),path);
		}	
		if(vo.getSpon_end()==null) {
			vo.setSpon_iscampaign(false);
			vo.setSpon_end("2999-12-31");
		}else {
			vo.setSpon_iscampaign(true);
		}
		if(vo.getSpon_url()==null) {
			vo.setSpon_url("www.Givengel.giv");
		}
		adminService.insertSpon(vo);
		insertAdminSponLog(vo,admins);
		return "redirect:adminMode.giv";
	}
	
	/*****************************************************
	 * 함수명 			: 	insertAdminSponLog
	 * 
	 * 함수 기능 		:	1. 개발자 후원 단체 등록 시 DB에 상품 등록 기록 저장
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-22
	 *****************************************************/
	@RequestMapping("/insertAdminSponLog.giv")
	@ResponseBody
	public void insertAdminSponLog(SponVO sponvo,String admin) {
		LogVO logvo = new LogVO();
		if(admin==null) {
			admin="ERR";
		}
		logvo.setLog_detail("[ADMIN_INSERT_SPON]#"+admin+"#"+sponvo.getSpon_name());
		logService.insertLog(logvo);
		
	}
	
	/************************
	 * 삽입 영역  end			*
	 ************************/
	
	


	/************************
	 * 수정 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminSponModify
	 * 
	 * 함수 기능 		:	1. 후원 단체 리스트를 Model 에 담아 페이지로 전송
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	campaignService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminSponModify.giv")
	public void adminSponModify(SponVO vo, Model m) {
		m.addAttribute("sponList", sponService.getSponList(vo));
		List<SponVO> spon_list = new ArrayList<SponVO>();
		spon_list = campaignService.campaignList();
		m.addAttribute("spon_list", spon_list);
	}
	
	/*****************************************************
	 * 함수명 			: 	adminSponModifyForm
	 * 
	 * 함수 기능 		:	1. 특정 후원 단체 정보를 Map 에 담아 전송해주는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	sponService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminSponModifyForm.giv")
	public Map<String, SponVO> adminSponModifyForm(SponVO vo) {
		SponVO spon = new SponVO();
		spon = sponService.getSpon(vo);
		Map<String, SponVO> map = new HashMap<String, SponVO>();
		map.put("spon", spon);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminSponModifyAction
	 * 
	 * 함수 기능 		:	1. 수정된 후원 단체 정보를 받아서 DB에 수정해주는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminSponModifyAction.giv")
	public String adminSponModifyAction(SponVO vo) {
		
		if(vo.getSpon_end()==null) {
			vo.setSpon_iscampaign(false);
			vo.setSpon_end("2999-12-31");
		}else {
			vo.setSpon_iscampaign(true);
		}
		adminService.updateSpon(vo);
		return "redirect:adminSponModify.giv";
	}
	
	/************************
	 * 수정 영역  end			*
	 ************************/
	
	

	/************************
	 * 삭제 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminSponDelete
	 * 
	 * 함수 기능 		:	1. 후원 단체 리스트를 Model 에 담아 페이지로 전송
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminSponDelete.giv")
	public void adminSponDelete(SponVO vo,Model m) {
		m.addAttribute("sponList", sponService.getSponList(vo));
		List<SponVO> spon_list = new ArrayList<SponVO>();
		spon_list = campaignService.campaignList();
		m.addAttribute("spon_list", spon_list);
		
	}
	
	/*****************************************************
	 * 함수명 			: 	adminSponDeleteForm
	 * 
	 * 함수 기능 		:	1. 특정 후원 단체 정보를 Map 에 담아 전송해주는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	sponService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminSponDeleteForm.giv")
	public Map<String, SponVO> adminSponDeleteForm(SponVO vo) {
		SponVO spon = new SponVO();
		spon = sponService.getSpon(vo);
		Map<String, SponVO> map = new HashMap<String, SponVO>();
		map.put("spon", spon);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminSponDeleteAction
	 * 
	 * 함수 기능 		:	1. 수정된 후원 단체 정보를 받아서 DB에서 삭제하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminSponDeleteAction.giv")
	public String adminSponDeleteAction(SponVO vo) {
		adminService.deleteSpon(vo);
		return "redirect:adminSponDelete.giv";
		
	}
	
	/************************
	 * 삭제 영역  end			*
	 ************************/
	/************************************************************************************************************
	 * 개발자모드 - 후원 단체 관리 영역 	end																				*
	 ************************************************************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 계정 관리 영역 	start																			*
	 ************************************************************************************************************/
	
	/************************
	 * 유틸 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	searchAdmin [ajax]
	 * 
	 * 함수 기능 		:	1. 개발자 계정을 검색하는 기능(searchData만 이용함)
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/searchAdmin.giv")
	@ResponseBody
	public Map<String,Object> searchAdmin(String level,String searchData) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("level", level);
		map.put("searchData", searchData);
		
		List<AdminVO> list = new ArrayList<AdminVO>();
		list = adminService.searchAdmin(map);
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("list",list);
		return maps;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminAccount
	 * 
	 * 함수 기능 		:	1. 개발자 계정 리스트를 Model을 이용하여 페이지로 전송
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminAccount.giv")
	public void adminAccount(Model m) {
		m.addAttribute("adminList",adminService.selectAdmins());
	}
	
	/*****************************************************
	 * 함수명 			: 	checkAdminId [ajax]
	 * 
	 * 함수 기능 		:	1. 개발자 계정 중복 검사 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/checkAdminId.giv")
	@ResponseBody
	public String checkAdminId(AdminVO vo) {
		int result = adminService.checkAdminId(vo);
		return Integer.toString(result);
		
	}

	/************************
	 * 유틸 영역  end			*
	 ************************/
	
	
	
	
	/************************
	 * 삽입 영역  start			*
	 ************************/
	
	// 개발자 모드 - 개발자 계정 관리 - 개발자 계정 등록
	@RequestMapping("/adminAccountInsertForm.giv")
	public void adminAccountInsertForm() {
	
	}
		
	/*****************************************************
	 * 함수명 			: 	adminAccountInsertAction
	 * 
	 * 함수 기능 		:	1. 개발자 계정 추가 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminAccountInsertAction.giv")
	public String adminAccountInsertAction(AdminVO vo, String pwCheck) {
		if(vo.getAdmin_pw().equals(pwCheck)) {
			adminService.insertAdmins(vo);
			return "redirect:adminAccount.giv";
		}
		else {
			return "adminAccountInsertAction.giv";
		}
		
	}

	/************************
	 * 삽입 영역  end			*
	 ************************/
	
	
	
	
	/************************
	 * 수정 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminAccountModifyForm
	 * 
	 * 함수 기능 		:	1. 특정 개발자 계정 정보를 Map 형태로 페이지에 전달
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminAccountModifyForm.giv")
	public Map<String, AdminVO> adminAccountModifyForm(AdminVO vo) {
		AdminVO admins = new AdminVO();
		admins = adminService.selectAdmin(vo.getAdmin_id());
		Map<String, AdminVO> map = new HashMap<String, AdminVO>();
		map.put("admins", admins);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminAccountModifyAction
	 * 
	 * 함수 기능 		:	1. 개발자 계정 정보를 수정하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-24
	 *****************************************************/
	@RequestMapping("/adminAccountModifyAction.giv")
	public String adminAccountModifyAction(AdminVO vo) {
		adminService.updateAdmins(vo);
		return "redirect:adminAccount.giv";
	}
	
	/************************
	 * 수정 영역  end			*
	 ************************/
	
	
	
	
	/************************
	 * 삭제 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminAccountDeleteForm
	 * 
	 * 함수 기능 		:	1. 특정 개발자 계정 정보를 Map 형태로 페이지에 전달
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminAccountDeleteForm.giv")
	public Map<String, AdminVO> adminAccountDeleteForm(AdminVO vo) {
		AdminVO admins = new AdminVO();
		admins = adminService.selectAdmin(vo.getAdmin_id());
		Map<String, AdminVO> map = new HashMap<String, AdminVO>();
		map.put("admins", admins);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminAccountDeleteAction
	 * 
	 * 함수 기능 		:	1. 개발자 계정의 정보를 삭제하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminAccountDeleteAction.giv")
	public String adminAccountDeleteAction(AdminVO vo) {
		adminService.deleteAdmins(vo);
		return "redirect:adminAccount.giv";
		
	}
	
	/************************
	 * 삭제 영역  end			*
	 ************************/

	/************************************************************************************************************
	 * 개발자모드 - 개발자 계정 관리 영역 	end																				*
	 ************************************************************************************************************/
	
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 유저 계정 관리 영역 start																		*
	 ************************************************************************************************************/
	
	/************************
	 * 유틸 영역  start			*
	 ************************/
	/*****************************************************
	 * 함수명 			: 	adminUserAccount
	 * 
	 * 함수 기능 		:	1. 유저 계정 리스트를 가져오는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminUserAccount.giv")
	public void adminUserAccount(Model m) {
		m.addAttribute("userList", adminService.selectUsers());
	}
	
	/*****************************************************
	 * 함수명 			: 	searchUser	[ajax]
	 * 
	 * 함수 기능 		:	1. 유저 계정 검색 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/searchUser.giv")
	@ResponseBody
	public Map<String,Object> searchUser(String searchData) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchData", searchData);
		
		List<UserVO> list = new ArrayList<UserVO>();
		list = adminService.searchUser(map);
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("list",list);
		return maps;
	}
	
	
	
	/************************
	 * 유틸 영역  end			*
	 ************************/
	
	/************************
	 * 수정 영역  start			*
	 ************************/
	/*****************************************************
	 * 함수명 			: 	adminUserAccountModifyForm	
	 * 
	 * 함수 기능 		:	1. 특정 유저의 계정 정보를 맵에 담아 반환하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminUserAccountModifyForm.giv")
	public Map<String, UserVO> adminUserAccountModifyForm(UserVO vo) {
		UserVO users = new UserVO();
		users = adminService.selectUser(vo);
		Map<String, UserVO> map = new HashMap<String, UserVO>();
		map.put("users", users);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminUserAccountModifyAction
	 * 
	 * 함수 기능 		:	1. 특정 유저의 계정 정보 수정하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-27
	 *****************************************************/
	@RequestMapping("/adminUserAccountModifyAction.giv")
	public String adminUserAccountModifyAction(UserVO vo) {
		adminService.updateUser(vo);
		return "redirect:adminUserAccount.giv";
	}
	
	/************************
	 * 수정 영역  end			*
	 ************************/
	
	
	
	/************************
	 * 삭제 영역  start			*
	 ************************/
	/*****************************************************
	 * 함수명 			: 	adminUserAccountDeleteForm	
	 * 
	 * 함수 기능 		:	1. 특정 유저의 계정 정보를 맵에 담아 반환하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminUserAccountDeleteForm.giv")
	public Map<String, UserVO> adminUserAccountDeleteForm(UserVO vo) {
		UserVO users = new UserVO();
		users = adminService.selectUser(vo);
		Map<String, UserVO> map = new HashMap<String, UserVO>();
		map.put("users", users);
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminUserAccountDeleteAction	
	 * 
	 * 함수 기능 		:	1. 특정 유저의 계정을 삭제하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/adminUserAccountDeleteAction.giv")
	public String adminUserAccountDeleteAction(UserVO vo) {
		adminService.deleteUser(vo);
		return "redirect:adminUserAccount.giv";

	}
	
	
	
	/************************
	 * 삭제 영역  end			*
	 ************************/
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 유저 계정 관리 영역 end																			*
	 ************************************************************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 중고 장터 관리 영역 start																		*
	 ************************************************************************************************************/
	/************************
	 * 유틸 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminFlea	
	 * 
	 * 함수 기능 		:	1. 중고 장터 전체 상품리스트를 모델에 담아 반환
	 * 					하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/adminFlea.giv")
	public void adminFlea(Model m) {
		m.addAttribute("fleaList", adminService.selectFleaList());
	}
	
	/*****************************************************
	 * 함수명 			: 	searchFlea	[ajax]
	 * 
	 * 함수 기능 		:	1. 중고 장터 상품을 검색하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/searchFlea.giv")
	@ResponseBody
	public Map<String,Object> searchFlea(String searchData,String test) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchData", searchData);
		if(test != null) {
			map.put("test",test);
		}else {
			map.put("test",null);
		}
		
		List<FleaVO> list = new ArrayList<FleaVO>();
		list = adminService.searchFlea(map);
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("list",list);
		
		return maps;
	}
	
	
	/************************
	 * 유틸 영역  end			*
	 ************************/
	
	
	
	
	/************************
	 * 테스트 영역  start		*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminFleaTestForm
	 * 
	 * 함수 기능 		:	1. 특정 중고 상품에 대한 정보를 맵에 담아 반환
	 * 					하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/adminFleaTestForm.giv")
	public Map<String, Object> adminFleaTestForm(FleaVO vo) {
		FleaVO fleas = new FleaVO();
		fleas = adminService.selectFlea(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flea", fleas);
		
		
		return map;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminFleaTestAction
	 * 
	 * 함수 기능 		:	1. 중고 상품의 심사 상태를 업데이트하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/adminFleaTestAction.giv")
	@ResponseBody
	public void adminFleaTestAction(String test,int flea_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("test", test);
		map.put("flea_no",flea_no);
		
		adminService.updateFleaTest(map);
	}
	/************************
	 * 테스트 영역  end			*
	 ************************/
	
	
	
	/************************
	 * 삭제 영역  end			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminFleaDeleteForm
	 * 
	 * 함수 기능 		:	1. 특정 중고 상품에 대한 정보를 맵에 담아 반환
	 * 					하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/adminFleaDeleteForm.giv")
	public Map<String, FleaVO> adminFleaDeleteForm(FleaVO vo) {
		FleaVO fleas = new FleaVO();
		fleas = adminService.selectFlea(vo);
		Map<String, FleaVO> map = new HashMap<String, FleaVO>();
		map.put("flea", fleas);
		return map;
	}
	
	
	
	/*****************************************************
	 * 함수명 			: 	adminFleaDeleteForm
	 * 
	 * 함수 기능 		:	1. 중고 상품을 삭제하는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/adminFleaDeleteAction.giv")
	public String adminFleaDeleteAction(FleaVO vo) {
		adminService.deleteFlea(vo);
		return "redirect:adminFlea.giv";

	}
	
	
	/************************
	 * 삭제 영역  end			*
	 ************************/
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 중고 장터 관리 영역 end																			*
	 ************************************************************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 차트 및 유틸리티 관리 영역 start																	*
	 ************************************************************************************************************/
	/************************
	 * 차트 영역  start			*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	chartPricePerTime [ajax]
	 * 
	 * 함수 기능 		:	1. user_buylog를 이용하여 Line-Chart에
	 * 					 시간대별 구입량,수입 데이터를 Map에 담아 전송
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/chartPricePerTime.giv")
	@ResponseBody
	public  Map<String,Object> chartPricePerTime() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AdminChartTimeVO> list = new ArrayList<AdminChartTimeVO>();
		list = adminService.chartPricePerTime();
		
		map.put("chartList", list);
		return map;
		
	}
	
	/*****************************************************
	 * 함수명 			: 	chartPriceAndCash [ajax]
	 * 
	 * 함수 기능 		:	1. user_cashlog와 user_buylog를 활용하여
	 * 					최근 7일 간의 데이터를 전송해주는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-25
	 *****************************************************/
	@RequestMapping("/chartPriceAndCash.giv")
	@ResponseBody
	public  Map<String,Object> chartPriceAndCash() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AdminChartBarVO> list = new ArrayList<AdminChartBarVO>();
		list = adminService.chartPriceAndCash();
		
		map.put("chartBarList", list);
		return map;
		
	}
	/************************
	 * 차트 영역  end			*
	 ************************/
	
	
	
	
	
	/************************
	 * 로그 보드 영역  start		*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	insertToDoLog
	 * 
	 * 함수 기능 		:	1. 개발자 별 개인 할 일 목록 저장
	 * 					2. 로그 테이블을 이용하여 형식에 맞게 저장
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-23
	 *****************************************************/
	@RequestMapping("/insertToDoLog.giv")
	@ResponseBody
	public void insertToDoLog(String todo_detail,HttpServletRequest request) {
		LogVO logvo = new LogVO();
		HttpSession session = request.getSession();
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		String admin = adminvo.getAdmin_id();
		if(admin==null) {
			admin="ERR";
		}
		logvo.setLog_detail("[TODO]#"+admin+"#"+todo_detail);
		logService.insertLog(logvo);
		
	}
	
	/*****************************************************
	 * 함수명 			: 	deleteToDoLog
	 * 
	 * 함수 기능 		:	1. 개발자 별 개인 할 일 목록 삭제
	 * 					2. 로그 테이블에 존재하는 할 일 목록 탐색 후 삭제
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-23
	 *****************************************************/
	@RequestMapping("/deleteToDoLog.giv")
	@ResponseBody
	public void deleteToDoLog(LogVO logvo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("[deleteToDoLog] vo 체크 : " + logvo.getLog_no());
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		// 접속 정보가 없을 경우 
		if(adminvo != null) {
			System.out.println("[deleteToDoLog] deleteLog 실행 ");
			logService.deleteLog(logvo);
		}else {
			 
		}	
	}
	
	/*****************************************************
	 * 함수명 			: 	insertNoticeLog	[ajax]
	 * 
	 * 함수 기능 		:	1. 마스터 계정의 공지 로그를 남기는 기능
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-26
	 *****************************************************/
	@RequestMapping("/insertNoticeLog.giv")
	@ResponseBody
	public void insertNoticeLog(String notice_detail,HttpServletRequest request) {
		LogVO logvo = new LogVO();
		HttpSession session = request.getSession();
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		String admin = adminvo.getAdmin_id();
		if(admin==null) {
			admin="ERR";
		}else {
			if(notice_detail.contains("#")) {
				String[] temp = notice_detail.split("#");
				logvo.setLog_detail("[ADMIN_NOTICE]#"+admin+"#"+temp[0]+"#"+temp[1]);
				logService.insertLog(logvo);
			}
			
		}

	}
	/************************
	 * 로그 보드 영역  end		*
	 ************************/
	
	
	
	
	/************************
	 * 기타 유틸리티 영역 start	*
	 ************************/
	
	/*****************************************************
	 * 함수명 			: 	adminUserCount
	 * 
	 * 함수 기능 		:	1. 가입된 유저의 수를 문자형으로 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/adminUserCount.giv")
	@ResponseBody
	public String adminUserCount() {
		int result = adminService.userCount();
		return Integer.toString(result) ;
	}
	
	/*****************************************************
	 * 함수명 			: 	adminOrderCount
	 * 
	 * 함수 기능 		:	1. 구입 내역의 수를 문자형으로 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	adminService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/adminOrderCount.giv")
	@ResponseBody
	public String adminOrderCount() {
		int result = adminService.orderCount();
		return Integer.toString(result) ;
	}

	
	/************************
	 * 기타 유틸리티 영역 end		*
	 ************************/
	/************************************************************************************************************
	 * 개발자모드 - 개발자 차트 및 유틸리티 관리 영역 end																		*
	 ************************************************************************************************************/
	
	
	
	
	/************************************************************************************************************
	 * 개발자모드 - 개발자 중고 장터 관리 영역 start																		*
	 ************************************************************************************************************/
	
	
	@RequestMapping("/adminMode.giv")
	public void adminMode() {
		
	}
	
	@RequestMapping("/adminCharts.giv")
	public void adminCharts() {
		
	}
	
	@RequestMapping("/adminPanels.giv")
	public void adminPanels() {
		
	}
	@RequestMapping("/adminWidgets.giv")
	public void adminWidgets() {
		
	}
	
	
	
}
