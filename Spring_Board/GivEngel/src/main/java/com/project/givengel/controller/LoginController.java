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
	
	@RequestMapping(value="/loginAction.giv",method = RequestMethod.POST)
	public String loginAction(UserVO vo,HttpServletRequest req, RedirectAttributes rttr) {
		
		
		HttpSession session = req.getSession();
		UserVO login = loginService.login(vo);
		System.out.println("LoginAction 파라미터 체크 : " + vo.getUser_id());
		if(login == null) {

			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			System.out.println("LoginAction 세션 생성 : " + login.getUser_id());

			session.setAttribute("user", login);
		}
		
		return "/index";
	}
	
	@RequestMapping(value = "/logout.giv", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "/index";
	}
	
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
	
	@RequestMapping("/idCheck.giv")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		
		UserVO vo = new UserVO();
		vo.setUser_id(userId);
		int result=loginService.idChk(vo);
		return Integer.toString(result);
	}
	
	@RequestMapping(value="/idFind.giv",method=RequestMethod.POST)
	@ResponseBody
	public String idFind(UserVO vo) {
		
		System.out.println("ajax 통신 완료 : " + vo.getUser_name());
		String result;
		UserVO vos = loginService.findId(vo);
		if(vos.getUser_id()==null) {
			result = "err";
		}
		else {
			result = vos.getUser_id();
			System.out.println("찾은 아이디 : " + vos.getUser_id());
		}
		
		return result;
	}
	

	@RequestMapping(value="/pwFind.giv",method=RequestMethod.POST)
	@ResponseBody
	public String pwFind(UserVO vo) {

		System.out.println("ajax 통신 완료 : " + vo.getUser_name()+vo.getUser_id()+vo.getUser_tel()+vo.getUser_jumin());
		String result;
		UserVO vos = loginService.findPw(vo);
		if(vos.getUser_pw()==null) {
			result = "err";
		}
		else {
			result = vos.getUser_pw();
			System.out.println("찾은 패스워드 : " + vos.getUser_pw());
		}
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/findAction.giv")
	public void findAfter() {
		
	}
	
}
