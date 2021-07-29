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
import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
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
	 * 
	 * 
	 */ 


	
	
	@RequestMapping("birthDetect.giv")
	@ResponseBody
	public Map<String,Object> birthDetect(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		Map<String,Object> map = new HashMap<String,Object>();
		String birth = mypageService.birthDetect(vo); 
		map.put("birthDetect", birth); 
		System.out.println(birth + "숫자확인");
		return map;	      
	}  
 
	@RequestMapping("genderDetect.giv")
	@ResponseBody
	public Map<String,Object> genderDetect(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		Map<String,Object> map = new HashMap<String,Object>();
		String gender = mypageService.genderDetect(vo); 
		map.put("genderDetect", gender); 
		System.out.println(gender + "숫자확인");
		return map;	     
	} 
	
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

	 
	 @RequestMapping(value="/myBuyList.giv")
	 @ResponseBody 
	 public List<HashMap<String,Object>> myBuyList(UserVO vo, HttpServletRequest req)
	 {
	 HttpSession session = req.getSession();
	 UserVO sessionvo = (UserVO)session.getAttribute("user");
     vo.setUser_no(sessionvo.getUser_no());	  
    //System.out.println(mypageService.myBuyList(vo) + "해쉬맵 확인");
     
	 return mypageService.myBuyList(vo);    
	 }  
	 
	 @RequestMapping(value="/myCartList.giv")
	 @ResponseBody
	 public List<HashMap<String,Object>> myCartList(UserVO vo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_no(sessionvo.getUser_no());
	     
	     return mypageService.myCartList(vo);
	 }
	 
	 @RequestMapping("mycountGoodStock.giv")
	 @ResponseBody
	 public void mycountGoodStock(GoodVO vo) {
		 
		  mypageService.mycountGoodStock(vo);
	 }
	 
	 @RequestMapping("myfleaMarket.giv")
	 @ResponseBody
	 public List<HashMap<String,Object>> myfleaMarket(UserVO vo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_id(sessionvo.getUser_id()); 
	     System.out.println(mypageService.myfleaMarket(vo) + "플리마켓");
	     return mypageService.myfleaMarket(vo); 
	 }  
	   
	 @RequestMapping("userGradeBuy.giv")
	 @ResponseBody
	 public int userGradeBuy(UserVO vo, User_buylogVO logvo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_id(sessionvo.getUser_id());
	    logvo.setUser_buylog_price(mypageService.userGradeBuy(vo));
	    System.out.println(logvo.getUser_buylog_price());
	    return logvo.getUser_buylog_price();	 
	 }
	 
	 @RequestMapping("minusCart.giv")
	 @ResponseBody
	 public void minusCart(CartVO vo) {
		 
		 mypageService.minusCart(vo);
		
	 } 
	 
	 @RequestMapping("plusCart.giv")
	 @ResponseBody
	 public void plusCart(CartVO vo) {
		 mypageService.plusCart(vo);  
	 }
}
