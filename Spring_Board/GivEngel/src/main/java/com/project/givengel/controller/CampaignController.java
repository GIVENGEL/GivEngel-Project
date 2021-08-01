package com.project.givengel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.CampaignServiceImpl;
import com.project.givengel.service.MypageServiceImpl;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_cashlogVO;
 
@Controller
public class CampaignController {
	
	@Autowired 
	private CampaignServiceImpl campaignService;
	
	@Autowired
	private MypageServiceImpl mypageService;

	
	
	/*****************************************************
	    * 함수명          :    campaignView
	    * 함수 기능       :    캠페인 뷰로 넘김, 유저정보 넘김, 리뷰수 넘김
	    * 사용된 함수 : -
	    * 사용된 서비스       :sponView 화면넘김
	    * 			 	countReview 댓글수
	    * 				userInfoView 유저정보넘김
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/campaignView.giv")
	public String campaignView(Spon_comVO comvo, SponVO vo, HttpServletRequest req, Model m) {
			
		try { 
			SponVO sponvo = campaignService.sponView(vo);
			m.addAttribute("Campaign", sponvo);
			String countreview = Integer.toString(campaignService.countReview(comvo));
			m.addAttribute("countReview",countreview);
			HttpSession session = req.getSession();
			UserVO id = (UserVO)session.getAttribute("user");
			if(id!=null) {
			UserVO uvo = mypageService.userInfoView(id);
			m.addAttribute("uvo", uvo); }
		} catch(NullPointerException e){ 
			System.out.println(e);
		}  
		 
		return "/campaignView";
	} 
	
	/*****************************************************
	    * 함수명          :    reviewList
	    * 함수 기능       :   리뷰 리스트를 불러옴 ( 스폰 번호에 맞게 ), 리뷰갯수 포함
	    * 사용된 함수 : -
	    * 사용된 서비스       :   reviewList (Service, dao) , countReview(댓글 갯수)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/reviewList.giv", produces="application/json")
	@ResponseBody  
	public Map<String,Object> reviewList(Spon_comVO vo) {
		System.out.println("스폰번호확인" + vo.getSpon_no());
		Map <String,Object> map = new HashMap<String,Object>();
		List<Spon_comVO> list = new ArrayList<Spon_comVO>();
		
		list = campaignService.reviewList(vo); 
		System.out.println(list); 
		map.put("listReview",list);
		return map; 	 
	} 
	  
	/*****************************************************
	    * 함수명          :    reviewInsert
	    * 함수 기능       :   댓글 입력하기
	    * 				댓글 아이디 강제지정
	    * 사용된 함수 : -
	    * 사용된 서비스       :   reviewInsert (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/reviewInsert.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void reviewInsert(Spon_comVO vo, HttpServletRequest req, UserVO v, Model model) {
	  try {
		campaignService.reviewInsert(vo);
		HttpSession session = req.getSession();
		UserVO id = (UserVO)session.getAttribute("user");
		String user_id = id.getUser_id();
		System.out.println("세션확인" + user_id); 
		model.addAttribute("review", campaignService.reviewList(vo));
	  } catch(Exception e) {
		  System.out.println(e); 
	  }
	} 
	
	/*****************************************************
	    * 함수명          :   deleteReview
	    * 함수 기능       :   댓글 삭제함 ( 제약조건 걸어야함 )
	    * 사용된 함수 : -
	    * 사용된 서비스       :   deleteReview (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/deleteReview.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void deleteReview(Spon_comVO vo) {
		try {
		campaignService.deleteReview(vo);
		} catch(Exception e) {
			System.out.println(e);
		}
	
	}
	 
	/*****************************************************
	    * 함수명          :   updateReview
	    * 함수 기능       :   댓글을 수정함 ( 제약조건 걸어야함 )
	    * 사용된 함수 : -
	    * 사용된 서비스       :   updateReview (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/updateReview.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void updateReview(Spon_comVO vo) {
		try {
		campaignService.updateReview(vo);
		} catch(Exception e) {
			System.out.println(e);
		}
	} 
	
	/*****************************************************
	    * 함수명          :   campaignLog
	    * 함수 기능       :   후원로그 입력 
	    * 사용된 함수 : -
	    * 사용된 서비스       :   deleteReview (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/campaignLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void campaignLog(User_cashlogVO cashvo, HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			UserVO sessionvo = (UserVO)session.getAttribute("user");
			cashvo.setUser_no(sessionvo.getUser_no());
		campaignService.campaignLog(cashvo); 
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	/*****************************************************
	    * 함수명          :   camUserCash
	    * 함수 기능       :   유저 캐시 차감하는거, 마이너스 이거 생각해봐야함
	    * 사용된 함수 : -
	    * 사용된 서비스       :   camUserCash (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/camUserCash.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void camUserCash(UserVO vo,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVO sessionUservo = (UserVO)session.getAttribute("user");
		vo.setUser_no(sessionUservo.getUser_no());
		try {  
		campaignService.camUserCash(vo);
		}catch(NullPointerException e) {
			System.out.println(e);
		}
	} 
	/*****************************************************
	    * 함수명          :   camSponCash
	    * 함수 기능       :  후원금액 증가
	    * 사용된 함수 : -
	    * 사용된 서비스       :   camSponCash (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping(value="/camSponCash.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void camSponCash(SponVO vo) {
		try {
		campaignService.camSponCash(vo);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	 
 
}
 