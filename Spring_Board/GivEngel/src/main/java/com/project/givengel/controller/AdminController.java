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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.givengel.service.AdminService;
import com.project.givengel.service.LogService;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private LogService logService;
	
	
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
	 * 사용된 서비스 	:	-
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
	 * 함수명 			: 	insertAdminLogoutLog
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
	 * 함수명 			: 	adminSelectSpon
	 * 
	 * 함수 기능 		:	1. 후원단체 리스트 전체를 맵에 담아 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스	 	:	adminService
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
	
	
	/*****************************************************
	 * 함수명 			: 	adminInsertGood
	 * 
	 * 함수 기능 		:	1. 상품의 정보를 받아 DB에 저장
	 * 					2. 상품의 이미지 파일을 로컬/서버에 저장
	 * 
	 * 사용된 함수 		:	insertAdminGoodLog
	 * 사용된 서비스 		:	adminService
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
	 * 사용된 서비스 		:	logService
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
	 * 함수명 			: 	selectAdmin
	 * 
	 * 함수 기능 		:	1. admin_id로 VO를 찾아주는 함수
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 		:	adminService
	 * 마지막 수정		:	2021-07-22
	 *****************************************************/
	@RequestMapping("/selectAdmin.giv")
	@ResponseBody
	public AdminVO selectAdmin(String admin_id) {
		AdminVO adminvo = new AdminVO();
		
		adminvo = adminService.selectAdmin(admin_id);
		return adminvo;
	}
	
	
	@RequestMapping("/adminMode.giv")
	public void adminMode() {
		
	}
	
	@RequestMapping("/adminCharts.giv")
	public void adminCharts() {
		
	}
	@RequestMapping("/adminElements.giv")
	public void adminElements() {
		
	}
	@RequestMapping("/adminElements2.giv")
	public void adminElements2() {
		
	}
	@RequestMapping("/adminAccount.giv")
	public void adminAccount() {
		
	}
	@RequestMapping("/adminPanels.giv")
	public void adminPanels() {
		
	}
	@RequestMapping("/adminWidgets.giv")
	public void adminWidgets() {
		
	}
	
	
	
	
}
