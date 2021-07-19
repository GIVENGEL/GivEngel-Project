package com.project.givengel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.givengel.service.AdminService;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
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
			return "/adminMode";
		}
		
		
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
