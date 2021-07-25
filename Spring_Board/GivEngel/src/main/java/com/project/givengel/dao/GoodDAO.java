package com.project.givengel.dao;

import java.util.List;

import com.project.givengel.vo.CartVO;
import com.project.givengel.vo.GoodVO;
import com.project.givengel.vo.Good_comVO;
import com.project.givengel.vo.LikeToVO;
import com.project.givengel.vo.UserVO;
import com.project.givengel.vo.User_buylogVO;
import com.project.givengel.vo.User_cashlogVO;

// ********************************************
// 김민주
// GoodDAO
public interface GoodDAO {
	
	// 전체상품(카테고리별) // 키워드 추가
	public List<GoodVO> getGoodList(String categories, String color, String sorting, String keyword);
	// 인기상품
	public List<GoodVO> getPopularGoodList(String categories, String color);
	// 최신상품
	public List<GoodVO> getlatestGood1();
	public List<GoodVO> getlatestGood2();
	public List<GoodVO> getlatestGood3();
	
	
	//상품 디테일
	public GoodVO getGoodView(GoodVO vo);
	
	//상품 판매량순(추천리스트)
	public List<GoodVO> rankingGood();
	
	// 상품 댓글 리스트
	public List<Good_comVO> listGoodCom(Good_comVO comVO);
	
	//상품 댓글 유효성검사
	public UserVO loginCheckCom(UserVO uvo);
	
	//상품 댓글 입력
	public void addGoodCom(Good_comVO gvo);

	//상품 댓글 삭제
	public void deleteGoodCom(Good_comVO gvo);
	
	//상품 댓글 수정
	public void modifyGoodCom(Good_comVO gvo);
	
	
	//상품 구매 로그 저장
	public void addUserBuyLog(User_buylogVO vo);
	
	//유저 마일리지 적립
	public void addUserM(String user_no,String buy_totalPrice,String good_no);
	
	//유저 마일리지 로그 업데이트
	public void addUserMLog(User_cashlogVO vo);
	
	// 상품 재고 업데이트
	public void countGoodStock(GoodVO gvo);
	
	// 장바구니 추가
	public void addCart(CartVO vo);
	
	
}
