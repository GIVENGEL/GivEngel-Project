package com.project.givengel.controller;

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
	
	
	// 로그인 세션 관리 /////////////////////////
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
			return "/adminMode";
		}
		
		
	}
	@RequestMapping("/insertAdminLoginLog.giv")
	@ResponseBody
	public void insertAdminLoginLog(AdminVO adminvo) {
		
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[ADMIN_LOGIN]#"+adminvo.getAdmin_id());
		logService.insertLog(logvo);
		
	}
	// end ////////////////////////////////
	
	
	@RequestMapping(value = "/adminlogoutAction.giv", method = RequestMethod.GET)
	public String adminlogoutAction(HttpSession session) throws Exception{
		AdminVO vo = new AdminVO();
		vo = (AdminVO)session.getAttribute("admin");
		insertAdminLogoutLog(vo);
		session.invalidate();
		
		return "/index";
	}
	
	@RequestMapping("/insertAdminLogoutLog.giv")
	@ResponseBody
	public void insertAdminLogoutLog(AdminVO adminvo) {
		
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[ADMIN_LOGOUT]#"+adminvo.getAdmin_id());
		logService.insertLog(logvo);
		
	}
	
	@RequestMapping("/adminUserCount.giv")
	@ResponseBody
	public String adminUserCount() {
		int result = adminService.userCount();
		
		return Integer.toString(result) ;
	}
	
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
	
	@RequestMapping("/adminInsertGood.giv")
	public String adminInsertGood(GoodVO vo) {
		System.out.println("[adminInsertGood] 파라미터 보기 : " + vo.getGood_name() );
		return "/adminMode";
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
	@RequestMapping("/adminPanels.giv")
	public void adminPanels() {
		
	}
	@RequestMapping("/adminWidgets.giv")
	public void adminWidgets() {
		
	}
	
}
