package com.project.givengel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.givengel.dao.GoodDAOImpl;
import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.Good_comVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;
//*******************************************************************
//김민주
//상품리스트 서비스
@Service("goodListService")
public class GoodListServiceImpl implements GoodListService {
	
	@Autowired
	private GoodDAOImpl goodDAO;
	
//	전체상품(카테고리 별로) 가져옴 // 추후 파라매터 추가 예정(good_price 순 정렬)
	@Override
	public List<GoodVO> getGoodList(String categories, String color, String sorting, String keyword) {
		System.out.println("impl : " +keyword);
		return goodDAO.getGoodList(categories,color,sorting,keyword);
	}
	
//	인기상품(like 순)
	@Override
	public List<GoodVO> getPopularGoodList(String categories, String color) {
		
		return goodDAO.getPopularGoodList(categories,color);
	}
	
//  최신상품(date 순 정렬) 가져옴
	@Override
	public List<GoodVO> getlatestGood1() {
		
		return goodDAO.getlatestGood1();
	}
	@Override
	public List<GoodVO> getlatestGood2() {
		
		return goodDAO.getlatestGood2();
	}
	@Override
	public List<GoodVO> getlatestGood3() {
		
		return goodDAO.getlatestGood3();
	}
	
	
//	상품 상세정보
	@Override
	public GoodVO getGoodView(GoodVO vo) {
		return goodDAO.getGoodView(vo);
	}

//	상품 댓글리스트
	@Override
	public List<Good_comVO> listGoodCom(Good_comVO comVO) {
		return goodDAO.listGoodCom(comVO);
	}

	

//	상품댓글 유효성
	@Override
	public UserVO checkGoodComPW(UserVO uvo) {
		return goodDAO.checkGoodComPW(uvo);
	}

	
	
//	상품 댓글 입력
	@Override
	public void addGoodCom(Good_comVO gvo) {
		goodDAO.addGoodCom(gvo);
	}

//	상품 댓글 삭제
	@Override
	public void deleteGoodCom(Good_comVO gvo) {
		goodDAO.deleteGoodCom(gvo);
	}
	
//	상품 댓글 수정	
	@Override
	public void modifyGoodCom(Good_comVO gvo) {
		goodDAO.modifyGoodCom(gvo);
	}


//	유저 구매로그 저장
	@Override
	public void addUserBuyLog(User_buylogVO vo) {
		goodDAO.addUserBuyLog(vo);
	}
	
//	유저 마일리지 적립
	@Override
	public void addUserM(String user_no, String buy_totalPrice,String good_no) {
		goodDAO.addUserM(user_no,buy_totalPrice,good_no);
	}
	
//	유저 마일리지 로그 업데이트
	@Override
	public void addUserMLog(User_cashlogVO vo) {
		goodDAO.addUserMLog(vo);
	}


//	상품 재고 업데이트
	@Override
	public void countGoodStock(GoodVO gvo) {
		goodDAO.countGoodStock(gvo);
	}
	
//	장바구니 추가
	@Override
	public void addCart(CartVO vo) {
		goodDAO.addCart(vo);
	}

	
	
	




	

}
