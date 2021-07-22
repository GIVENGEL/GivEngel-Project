package com.project.givengel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.givengel.service.LoginService;
import com.project.givengel.vo.UserVO;

@Controller
public class MainController {

	@Autowired 
	private CampaignServiceImpl campaignService;
	
	@RequestMapping("/index.giv")
	public void index() {
		
	}
	/*****************************************************
	    * 함수명          :    campaignList
	    * 함수 기능       :   1. 캠페인 리스트(스폰넘버만) 받아온 후 배열로 리스트불러옴
	    * 사용된 함수 : -
	    * 사용된 서비스       :   campaignList (Service, dao)
	    * 마지막 수정      :   2021-07-23
	    *****************************************************/
	@RequestMapping("/campaign.giv")
	public Map<String,Object> campaignList(SponVO vo) {
	
		List<SponVO> spon_list = new ArrayList<SponVO>();
		spon_list = campaignService.campaignList();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("spon_list", spon_list); 
		return map;		
		 
	}
	@RequestMapping("/cartForm.giv")
	public void cartForm() {
		
	}
	@RequestMapping("/contact.giv")
	public void contact() {
		
	}
	@RequestMapping("/fleaBoard.giv")
	public void fleaBoard() {
		
	}
	@RequestMapping("/loginForm.giv")
	public void loginForm() {
		
	}

	@RequestMapping("/myPage.giv")
	public void myPage() {
		
	}
	
	@RequestMapping("/adminLogin.giv")
	public void adminLogin() {
		
	}
}
