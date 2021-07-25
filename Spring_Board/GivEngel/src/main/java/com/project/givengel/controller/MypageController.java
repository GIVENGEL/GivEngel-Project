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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.MypageServiceImpl;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;

@Controller
public class MypageController {
	
	@Autowired 
	private MypageServiceImpl mypageService;
	   
	/*
	 * @RequestMapping("myPage.giv")
	 * 
	 * @ResponseBody public void myPageView(UserVO vo, Model m, HttpServletRequest
	 * req) {
	 * 
	 * }
	 */ 
	
	@RequestMapping("/myPwdConfirm.giv")
	@ResponseBody
	public int myPwdConfirm(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		System.out.println(sessionvo.getUser_no() + "넘버확인"); 
		System.out.println(vo.getUser_pw()); 
		int pwd = mypageService.myPwdConfirm(vo); 
		System.out.println(pwd + "들어오는지 확인");
		 
		return pwd;
	}
	
	@RequestMapping("/myCashList.giv")
	@ResponseBody
	public Map<String,Object> myCashList(UserVO vo) { 
		System.out.println(vo.getUser_no() + "리스트유저넘버확인");
		Map<String,Object> map = new HashMap<String,Object>();
		List<User_cashlogVO> ulist = new ArrayList<User_cashlogVO>();
		ulist = mypageService.myCashList(vo);
		map.put("CashList", ulist); 
		return map; 
	}
	
	@RequestMapping("/myNickConfirm.giv")
	@ResponseBody
	public int myNickConfirm(UserVO vo, HttpServletRequest req) {
		System.out.println(vo.getUser_name()+ "유저닉네임확인");
		HttpSession session = req.getSession();  
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		int nick = mypageService.myNickConfirm(vo); 
		return nick;  
	} 
	 
	@RequestMapping("/myTelConfirm.giv")
	@ResponseBody
	public int myTelConfirm(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		int tel = mypageService.myTelConfirm(vo);
		return tel;  
	} 
	 
	@RequestMapping("/myAddrConfirm.giv")
	@ResponseBody
	public int myAddrConfirm(UserVO vo, HttpServletRequest req) {
		System.out.println(vo.getUser_addr()+ "주소확인"); 
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		int addr = mypageService.myAddrConfirm(vo);
		return addr;
	}

}
