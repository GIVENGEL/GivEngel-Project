package com.project.givengel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.givengel.service.LoginService;
import com.project.givengel.vo.UserVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	
	
	/*****************************************************
	 * 함수명 			: 	loginAction
	 * 
	 * 함수 기능 		:	1. 유저가 로그인 성공시 세션 속성 설정
	 * 					2. 유저 로그인 성공/실패에 따른 페이지 전환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	loginService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value="/loginAction.giv",method = RequestMethod.POST)
	public String loginAction(UserVO vo,HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		UserVO login = loginService.login(vo);
		System.out.println("LoginAction 파라미터 체크 : " + vo.getUser_id());
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
			return "/loginForm";
		}else {
			System.out.println("LoginAction 세션 생성 : " + login.getUser_id());
			session.setAttribute("user", login);
		}
		return "/index";
	}
	
	
	/*****************************************************
	 * 함수명 			: 	logout
	 * 
	 * 함수 기능 		:	1. 유저가 로그아웃할 경우 모든  세션 초기화
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	-
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value = "/logout.giv", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "/index";
	}
	
	
	
	
	/*****************************************************
	 * 함수명 			: 	joinAction
	 * 
	 * 함수 기능 		:	1. 유저의 회원가입 정보를 DB에 저장
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	loginService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/joinAction.giv")
	public String joinAction(UserVO vo,String confirm_pw) {
		return loginService.join(vo,confirm_pw);
	}
	
	
	
	
	
	/*****************************************************
	 * 함수명 			: 	idCheck
	 * 
	 * 함수 기능 		:	1. 유저 아이디의 중복체크 
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	loginService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/idCheck.giv")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		UserVO vo = new UserVO();
		vo.setUser_id(userId);
		int result=loginService.idChk(vo);
		return Integer.toString(result);
	}
	
	
	/*****************************************************
	 * 함수명 			: 	idFind
	 * 
	 * 함수 기능 		:	1. 유저아이디를 찾기위해 입력된 정보가 일치할 경우
	 * 						유저아이디를 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	loginService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value="/idFind.giv",method=RequestMethod.POST)
	@ResponseBody
	public String idFind(UserVO vo) {
		String result;
		UserVO vos = loginService.findId(vo);
		if(vos.getUser_id()==null) {
			result = "err";
		}
		else {
			result = vos.getUser_id();
		}
		return result;
	}
	

	/*****************************************************
	 * 함수명 			: 	pwFind
	 * 
	 * 함수 기능 		:	1. 유저패스워드를 찾기위해 입력된 정보가 일치할 경우
	 * 						유저패스워드를 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	loginService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping(value="/pwFind.giv",method=RequestMethod.POST)
	@ResponseBody
	public String pwFind(UserVO vo) {
		String result;
		UserVO vos = loginService.findPw(vo);
		if(vos.getUser_pw()==null) {
			result = "err";
		}
		else {
			result = vos.getUser_pw();
		}
		System.out.println(result);
		return result;
	}
	

	@RequestMapping("/joinForm.giv")
	public void joinForm() {
		
	}
	
	@RequestMapping("/findForm.giv")
	public void findForm() {
		
	}
	@RequestMapping("/findAction.giv")
	public void findAfter() {
		
	}
	
}
