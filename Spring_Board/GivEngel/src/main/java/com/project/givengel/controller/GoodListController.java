package com.project.givengel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public void getGoodList(Model m, String categories, String color, String sorting, String keyword, HttpServletRequest request) {
	
		HttpSession ses = request.getSession();
		UserVO userVo = (UserVO)ses.getAttribute("admin");
		
		// 최신상품(date 순 정렬) 가져오고 Model에 저장
		m.addAttribute("latestGood1", goodListService.getlatestGood1());
		m.addAttribute("latestGood2", goodListService.getlatestGood2());
		m.addAttribute("latestGood3", goodListService.getlatestGood3());
		// 전체상품(카테고리 별 정렬) 가져오고 Model에 저장
		m.addAttribute("goodList", goodListService.getGoodList(categories,color,sorting,keyword));
		// 인기상품(인기순 고정)
		m.addAttribute("getPopularGoodList", goodListService.getPopularGoodList(categories,color));
		
	}
	
	
	
	
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
		
//		추천상품 리스트
		m.addAttribute("rankingGood", goodListService.rankingGood());
		
		return m;
	}
	
	
	
	
	
	
	// 로그인 여부 확인
	@RequestMapping(value="/loginCheckCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String loginCheckCom(HttpServletRequest request, String user_pw) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		System.out.println(uvo.getUser_no());
		int result = -1;
		UserVO resultvo = goodListService.loginCheckCom(uvo);
		
		if(resultvo.getUser_pw().equals(user_pw)) {
			result = 1;
		}
		
		System.out.println(result);
		return Integer.toString(result);
		
	}
	
	//상품 댓글 입력
	@RequestMapping(value="/saveGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
    public String addGoodCom(Good_comVO gvo,String loginresult) {
		String result = "-1";
		if(loginresult.equals("1")) {
			goodListService.addGoodCom(gvo);
			result =	"1";
		}
		return result;
	}

	//상품 댓글 삭제
	@RequestMapping(value="/deleteGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String deleteGoodCom(Good_comVO gvo, HttpServletRequest requset) {
		HttpSession session = requset.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(vo != null) {
			gvo.setGood_com_writer(vo.getUser_id());
			goodListService.deleteGoodCom(gvo);
			result = "1";
		}
		return result;
	}
	
	
	//상품 댓글 수정
	@RequestMapping(value="/modifyGoodCom.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String modifyGoodCom(Good_comVO gvo, HttpServletRequest requset) {
		HttpSession session = requset.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(vo != null) {
			gvo.setGood_com_writer(vo.getUser_id());
			goodListService.modifyGoodCom(gvo);
			result = "1";
		}
		return result;
	}
	
	
	

	// 유저 구매로그 입력
	@RequestMapping(value="/addUserBuyLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addUserBuyLog(User_buylogVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			vo.setUser_no(uvo.getUser_no());
			goodListService.addUserBuyLog(vo);
			result = "1";
		}
		return result;
	}
	
	// 유저 마일리지 적립
	@RequestMapping(value="/addUserM.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addUserM(HttpServletRequest request,String buy_totalPrice,String good_no) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			String user_no = Integer.toString(uvo.getUser_no());
		    goodListService.addUserM(user_no,buy_totalPrice,good_no);
			result = "1";
		}
		if(result=="1") {
		int cash =  (uvo.getUser_cash() + (Integer.parseInt(buy_totalPrice) / 10));
		uvo.setUser_cash(cash);
		session.setAttribute("user", uvo);
		}
		
		return result;
	}

	// 유저 마일리지 로그 업데이트
	@RequestMapping(value="/addUserMLog.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String addUserMLog(User_cashlogVO vo ,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		System.out.println(uvo.getUser_no());
		if(uvo!=null) {
			int user_no = uvo.getUser_no();
			vo.setUser_no(user_no);
			goodListService.addUserMLog(vo);
			result = "1";
		}
		return result;
	}
	
	
	
	//상품 재고 업데이트
	@RequestMapping(value="/countGoodStock.giv", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String countGoodStock(GoodVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		
		String result = "-1"; 
		if(uvo != null) {
		goodListService.countGoodStock(vo);
			result = "1";
		}
		
		return result;
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
	public String addCart(CartVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("user");
		String result = "-1";
		if(uvo!=null) {
			vo.setUser_no(uvo.getUser_no());
			goodListService.addCart(vo);
			result="1";
		}
		return result;
	}
	




	
}
