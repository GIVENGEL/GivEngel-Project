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
	
	@RequestMapping("/test.giv")
	public void Test(Model m) {
		List<UserVO> list = loginService.test();
		System.out.println("내용 출력"+list.get(0).getUser_id());  
		m.addAttribute("test",loginService.test());
	}
}
