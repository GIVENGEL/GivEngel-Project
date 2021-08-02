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

import com.project.givengel.service.LogService;
import com.project.givengel.service.MypageServiceImpl;
import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;
 
@Controller
public class MypageController {
	
	@Autowired 
	private MypageServiceImpl mypageService;
	
	@Autowired
	private LogService logService;
	   
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


	
	/*****************************************************
	    * 함수명          :   birthDetect
	    * 함수 기능       :  주민등록번호 특정숫자 추출
	    * 사용된 함수 : -
	    * 사용된 서비스       :   birthDetect (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
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
	
	/*****************************************************
	    * 함수명          :   genderDetect
	    * 함수 기능       :  주민등록번호 특정숫자 추출
	    * 사용된 함수 : -
	    * 사용된 서비스       :   genderDetect (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
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
	
	/*****************************************************
	    * 함수명          :   myPwdConfirm
	    * 함수 기능       :  비밀번호 변경
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myPwdConfirm (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
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
		
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[USER_UPDATE_ACCOUNT_PW]#"+sessionvo.getUser_id()+"#"+vo.getUser_pw());
		logService.insertLog(logvo);
		  
		return pwd;
	}
	
	/*****************************************************
	    * 함수명          :   myCashList
	    * 함수 기능       :  마일리지 사용내역 출력
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myCashList (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	@RequestMapping("/myCashList.giv")
	@ResponseBody
	public Map<String,Object> myCashList(UserVO vo) { 
	
		Map<String,Object> map = new HashMap<String,Object>();
		List<User_cashlogVO> ulist = new ArrayList<User_cashlogVO>();
		ulist = mypageService.myCashList(vo);
		map.put("CashList", ulist); 
		return map; 
	}
	 
	/*****************************************************
	    * 함수명          :  myNickConfirm
	    * 함수 기능       : 닉네임 변경
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myNickConfirm (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	@RequestMapping("/myNickConfirm.giv")
	@ResponseBody
	public String myNickConfirm(UserVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();  
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		mypageService.myNickConfirm(vo);
		mypageService.userInfoView(vo).getUser_name();
		
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[USER_UPDATE_ACCOUNT_NAME]#"+sessionvo.getUser_id()+"#"+vo.getUser_name());
		logService.insertLog(logvo);
		return mypageService.userInfoView(vo).getUser_name();  
	} 
	
	/*****************************************************
	    * 함수명          :  myTelConfirm
	    * 함수 기능       : 전화번호 변경
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myTelConfirm (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	@RequestMapping("/myTelConfirm.giv")
	@ResponseBody
	public int myTelConfirm(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		int tel = mypageService.myTelConfirm(vo);
		
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[USER_UPDATE_ACCOUNT_TEL]#"+sessionvo.getUser_id()+"#"+vo.getUser_tel());
		logService.insertLog(logvo);
		return tel;  
	} 
	
	/*****************************************************
	    * 함수명          :  myAddrConfirm
	    * 함수 기능       : 주소 변경
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myAddrConfirm (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	@RequestMapping("/myAddrConfirm.giv")
	@ResponseBody
	public int myAddrConfirm(UserVO vo, HttpServletRequest req) {
		System.out.println(vo.getUser_addr()+ "주소확인"); 
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionvo.getUser_no());
		int addr = mypageService.myAddrConfirm(vo);
		
		LogVO logvo = new LogVO();
		logvo.setLog_detail("[USER_UPDATE_ACCOUNT_ADDR]#"+sessionvo.getUser_id()+"#"+vo.getUser_addr());
		logService.insertLog(logvo);
		
		return addr;
	}

	/*****************************************************
	    * 함수명          :  myBuyList
	    * 함수 기능       : 구매내역
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myBuyList (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
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
	
		/************************************************
	    * 함수명          :  myCartList
	    * 함수 기능       : 장바구니
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myCartList (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping(value="/myCartList.giv")
	 @ResponseBody
	 public List<HashMap<String,Object>> myCartList(UserVO vo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_no(sessionvo.getUser_no());
	     
	     return mypageService.myCartList(vo);
	 }
	 
		/*****************************************************
	    * 함수명          :  mycountGoodStock
	    * 함수 기능       : 재고확인
	    * 사용된 함수 : -
	    * 사용된 서비스       :   mycountGoodStock (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping("mycountGoodStock.giv")
	 @ResponseBody
	 public void mycountGoodStock(GoodVO vo) {
		 
		  mypageService.mycountGoodStock(vo);
	 }

		/*****************************************************
	    * 함수명          :  myfleaMarket
	    * 함수 기능       : 중고 거래내역
	    * 사용된 함수 : -
	    * 사용된 서비스       :   myfleaMarket (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping("myfleaMarket.giv")
	 @ResponseBody
	 public List<HashMap<String,Object>> myfleaMarket(UserVO vo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_id(sessionvo.getUser_id()); 
	     System.out.println(mypageService.myfleaMarket(vo) + "플리마켓");
	     return mypageService.myfleaMarket(vo); 
	 }  
	 
	 /*****************************************************
	    * 함수명          :  userGradeBuy
	    * 함수 기능       :  명예등급
	    * 사용된 함수 : -
	    * 사용된 서비스       :   userGradeBuy (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/  
	 @RequestMapping("userGradeBuy.giv")
	 @ResponseBody
	 public int userGradeBuy(UserVO vo, User_buylogVO logvo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_no(sessionvo.getUser_no());
	    return mypageService.userGradeBuy(vo);	  
	 }
	 
	 /*****************************************************
	    * 함수명          :  minusCart
	    * 함수 기능       :  카트 마이너스시 카트db감소
	    * 사용된 함수 : -
	    * 사용된 서비스       :   minusCart (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping("minusCart.giv")
	 @ResponseBody
	 public void minusCart(CartVO vo) {
		 System.out.println(vo.getCart_count() + "마이너스 카트");
		 mypageService.minusCart(vo);
		
	 } 
	 
	 /*****************************************************
	    * 함수명          :  plusCart
	    * 함수 기능       :  카트 마이너스시 카트db증가
	    * 사용된 함수 : -
	    * 사용된 서비스       :   plusCart (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping("plusCart.giv")
	 @ResponseBody
	 public void plusCart(CartVO vo) {
	System.out.println(vo.getCart_count()+ "플러스 카트");
	System.out.println(vo.getCart_no() + "플러스 카트 넘버");
		 mypageService.plusCart(vo);  
	 }
	 
	 /*****************************************************
	    * 함수명          :  allCartComplete
	    * 함수 기능       :  카트 x시 카트삭제
	    * 사용된 함수 : -
	    * 사용된 서비스       :   allCartComplete (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping("allCartComplete.giv")
	 @ResponseBody
	 public void plusCart(UserVO vo, HttpServletRequest req) {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_no(sessionvo.getUser_no());
	     mypageService.allCartComplete(vo);  
	 }
	 
	 /*****************************************************
	    * 함수명          :  allCartComplete
	    * 함수 기능       :  카트 x시 카트삭제
	    * 사용된 함수 : -
	    * 사용된 서비스       :   allCartComplete (Service, dao)
	    * 마지막 수정      :   2021-07-30
	    *****************************************************/
	 @RequestMapping("mydeleteCart.giv")
	 @ResponseBody
	 public void mydeleteCart(CartVO vo) {
		 mypageService.mydeleteCart(vo); 
	 }
	 
}
