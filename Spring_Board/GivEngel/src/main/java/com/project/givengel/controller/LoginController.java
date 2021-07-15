package com.project.givengel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.givengel.service.LoginService;
import com.project.givengel.vo.UserVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/joinForm.giv")
	public void joinForm() {
		
	}
	
	@RequestMapping("/findForm.giv")
	public void findForm() {
		
	}
	
	@RequestMapping("/joinAction.giv")
	public String joinAction(UserVO vo,String confirm_pw) {
		
		System.out.println("JoinAction : " + vo.getUser_id());
		System.out.println("JoinAction : " + confirm_pw);
		return loginService.join(vo,confirm_pw);
		
	}
	
	@RequestMapping("/findAfter.giv")
	public void findAfter() {
		
	}
	
}
