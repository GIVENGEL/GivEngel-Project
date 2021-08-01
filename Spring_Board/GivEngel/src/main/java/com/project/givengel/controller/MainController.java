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

import com.project.givengel.service.CampaignServiceImpl;
import com.project.givengel.service.FleaService;
import com.project.givengel.service.GoodListService;
import com.project.givengel.service.MypageServiceImpl;
import com.project.givengel.service.SponServiceImpl;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.SponVO;
import com.project.givengel.vo.Spon_comVO;
import com.project.givengel.vo.UserVO;

@Controller
public class MainController {

	@Autowired 
	private CampaignServiceImpl campaignService;
	@Autowired
	private GoodListService goodListService;
	@Autowired
	private FleaService fleaService;
	@Autowired
	private MypageServiceImpl mypageService; 
	@Autowired
	private SponServiceImpl sponService;

	 
	/*******************************************************
	 * 김민주 
	 * 함수명 : index
	 * 
	 * 함수 기능 :  상품리스트 페이지 전체 상품 리스트(카테고리별 분류)
	 * 마지막 수정 : 2021-07-26
	*/	
	// 카테고리별 인기상품 출력?
	@RequestMapping("/index.giv")
	public void index(Model m,String categories, String color) {		
		
		List<GoodVO> list = goodListService.rankingGood();
		List<GoodVO> listTOP = new ArrayList<GoodVO>();
		List<GoodVO> listBOTTOM = new ArrayList<GoodVO>();
		List<GoodVO> listBAG = new ArrayList<GoodVO>();
		List<GoodVO> listACC = new ArrayList<GoodVO>();
		
		
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getGood_tag().contains("TOP")) {
				String[] tp = list.get(i).getGood_tag().split("#");
				list.get(i).setGood_tag(tp[0]);
				listTOP.add(list.get(i));
			}else if(list.get(i).getGood_tag().contains("BOTTOM")) {
				String[] tp = list.get(i).getGood_tag().split("#");
				list.get(i).setGood_tag(tp[0]);
				listBOTTOM.add(list.get(i));
			}else if(list.get(i).getGood_tag().contains("BAG")) {
				String[] tp = list.get(i).getGood_tag().split("#");
				list.get(i).setGood_tag(tp[0]);
				listBAG.add(list.get(i));
			}else if(list.get(i).getGood_tag().contains("ACC")) {
				String[] tp = list.get(i).getGood_tag().split("#");
				list.get(i).setGood_tag(tp[0]);
				listACC.add(list.get(i));
			}
		}
		m.addAttribute("listTOP", listTOP);
		m.addAttribute("listBOTTOM",listBOTTOM);
		m.addAttribute("listBAG", listBAG);
		m.addAttribute("listACC", listACC);
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		m.addAttribute("rankingGood", goodListService.rankingGood());
		m.addAttribute("goodComRanking", goodListService.goodComRanking());
	}
	
	
	/*****************************************************
	    * 함수명          :    campaignList
	    * 함수 기능       :   1. 캠페인 리스트(스폰넘버만) 받아온 후 배열로 리스트불러옴  2.현재시간 불러와서 비교하고 안보이게
	    * 사용된 함수 : -
	    * 사용된 서비스       :   campaignList (Service, dao)
	    * 마지막 수정      :   2021-08-01
	    *****************************************************/
	@RequestMapping("/campaign.giv")
	   public Map<String,Object> campaignList(SponVO vo, Model m, Spon_comVO comvo) {
		/*
		 * List<Integer> listString = new ArrayList<Integer>(); for(int
		 * i=0;i<sponService.getSponList(vo).size();i++) { int temp_sponNum =
		 * sponService.getSponList(vo).get(i).getSpon_no(); Spon_comVO com = new
		 * Spon_comVO(); com.setSpon_no(temp_sponNum);
		 */
		/*
		 * int result = sponService.countSponCom(com); listString.add(result);]
		 */
		
		 
	   
	      List<SponVO> spon_list = new ArrayList<SponVO>();
	      spon_list = campaignService.campaignList();
	      List<Integer> com_list = new ArrayList<Integer>();
	      
	      for(int i=0;i<spon_list.size();i++) {
	    	  Spon_comVO comvos = new Spon_comVO();
	    	  comvos.setSpon_no(spon_list.get(i).getSpon_no());
	    	  com_list.add(campaignService.countReview(comvos));
	    	  
	      }
	      
	      Map<String,Object> map = new HashMap<String,Object>();
	       
	      List<SponVO> spon_list2 = new ArrayList<SponVO>();
	      spon_list2   = campaignService.campaignSpon(); 
	      String nowSysdate = campaignService.nowSysdate();
	      map.put("CountReview", com_list);
	      map.put("nowSysdate", nowSysdate);
	      map.put("spon_list", spon_list);
	      map.put("non_campaign", spon_list2);  
	      return map;      
	        
	   }
	@RequestMapping("/cartForm.giv")
	public void cartForm() {
		
	}
	@RequestMapping("/contact.giv")
	public void contact() {
		
	}
	@RequestMapping("/loginForm.giv")
	public void loginForm() {
		
	}

	@RequestMapping("/myPage.giv")
	public String myPage(UserVO vo, HttpServletRequest req, Model m) {
		
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		if(sessionvo==null) {
			return "/index";
		}  
		else {
		vo.setUser_no(sessionvo.getUser_no());
		UserVO myvo = mypageService.userInfoView(vo);
		m.addAttribute("myvo", myvo); 
		   return "/myPage"; 
		}
	} 
	
	@RequestMapping("/adminLogin.giv")
	public void adminLogin() {
		
	}
}
