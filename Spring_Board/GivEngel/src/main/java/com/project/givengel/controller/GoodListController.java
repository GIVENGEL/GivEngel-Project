package com.project.givengel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.GoodListService;
import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.Good_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;

//**********************************************************
// 김민주 
// 상품리스트 컨트롤러
@Controller
public class GoodListController {

	@Autowired
	private GoodListService goodListService;
	
//	전체 상품 리스트 가져오는 메소드(카테고리별 분류)
	@RequestMapping("/buyList.giv")
	public void getGoodList(Model m, String categories, String color, String sorting, String keyword) {
		System.out.println("+"+keyword);
		// 최신상품(date 순 정렬) 가져오고 Model에 저장
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		m.addAttribute("latestGood2", goodListService.getlatestGood2());
		m.addAttribute("latestGood3", goodListService.getlatestGood3());
		// 전체상품(카테고리 별 정렬) 가져오고 Model에 저장
		m.addAttribute("goodList", goodListService.getGoodList(categories,color,sorting,keyword));
		// 인기상품(인기순 고정)
		m.addAttribute("getPopularGoodList", goodListService.getPopularGoodList(categories,color));
		
		
	}
	
//	
//	@RequestMapping("/buyForm.giv")
//	public void getGoodView() {
//		
//	}
	
//	상품 상세정보 + 댓글 가져오기
	@RequestMapping("/buyForm.giv")
	public Model getGoodView(Model m, GoodVO vo, Good_comVO comVO) {

//		상품 상세정보
		vo = goodListService.getGoodView(vo);
//		카테고리 분류 작업
		String[] categories =  vo.getGood_tag().split("#");

		
//		상품 상세정보 m에 키벨류 저장
		m.addAttribute("goodVO", vo);
//		카테고리 분류 키벨류 저장
		m.addAttribute("categories",categories[1]);
//		댓글 리스트 키벨류 저장
		m.addAttribute("comVO", goodListService.listGoodCom(comVO));
		
		int totalGoodCom = goodListService.listGoodCom(comVO).size();
		m.addAttribute("totalGoodCom", totalGoodCom);
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		
		return m;
	}
	
	
	//상품 댓글 유효성검사
	@RequestMapping(value="/checkGoodComPW.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void checkGoodComPW(UserVO uvo) {
		goodListService.checkGoodComPW(uvo);		
	}
	
	//상품 댓글 입력
	@RequestMapping(value="/saveGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
    public void addGoodCom(Good_comVO gvo) {
		goodListService.addGoodCom(gvo);
	}

	//상품 댓글 삭제
	@RequestMapping(value="/deleteGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void deleteGoodCom(Good_comVO gvo) {
		goodListService.deleteGoodCom(gvo);
	}

	//상품 댓글 수정
	@RequestMapping(value="/modifyGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void modifyGoodCom(Good_comVO gvo) {
		goodListService.modifyGoodCom(gvo);
	}
	
	
	

	// 유저 구매로그 입력
	@RequestMapping(value="/addUserBuyLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void addUserBuyLog(User_buylogVO vo) {
		goodListService.addUserBuyLog(vo);
	}
	
	// 유저 마일리지 적립
	@RequestMapping(value="/addUserM.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void addUserM(String user_no,String buy_totalPrice,String good_no) {
		goodListService.addUserM(user_no,buy_totalPrice,good_no);
	}

	// 유저 마일리지 로그 업데이트
	@RequestMapping(value="/addUserMLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void addUserMLog(User_cashlogVO vo) {
		System.out.println(vo.getUser_cashlog_log());
		goodListService.addUserMLog(vo);
	}
	
	
	
	//상품 재고 업데이트
	@RequestMapping(value="/countGoodStock.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void countGoodStock(GoodVO vo) {
		goodListService.countGoodStock(vo);
	}
	
	
	// 구매 후 페이지
	@RequestMapping("/buyAfter.giv")
	public Model buyAfter(GoodVO vo, String user_no,String user_buylog_price,Model m) {
		vo = goodListService.getGoodView(vo);
		m.addAttribute("goodVO", vo);
		m.addAttribute("total_price", user_buylog_price);
		m.addAttribute("user_no", user_no);
		
		System.out.println(user_buylog_price);
		System.out.println(user_no);
		
		return m;
	}
	
	// 장바구니 추가
	@RequestMapping(value="/addCart.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public void addCart(CartVO vo) {
		goodListService.addCart(vo);
	}
	

	
	


	
}
