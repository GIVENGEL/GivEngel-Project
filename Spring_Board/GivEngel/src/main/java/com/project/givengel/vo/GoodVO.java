package com.project.givengel.vo;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class GoodVO {
	private int good_no;
	private String good_name;
	private int good_price;
	private String good_tag;
	private int good_like;
	private int good_stock;
	private String good_detail;
	private String good_img;
	private long good_img_size;
	private String good_date;
	private int spon_no;
	
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file,String root) {
		
		this.file = file;
		System.out.println(System.getProperty("user.dir"));
		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.good_img = file.getOriginalFilename();
			this.good_img_size = file.getSize();
			
			//***********************************************
			// 해당 경로로 변경
			
			File f2 = new File("C:\\Users\\kosmo_\\Documents\\GitHub\\GivEngel-Project\\Spring_Board\\GivEngel\\src\\main\\webapp\\resources\\img\\good",good_img); 
			/* File f = new File(root+good_img); */
			
			System.out.println(root+good_img);
			System.out.println(good_img_size);
			try {
				 file.transferTo(f2); 
				/* file.transferTo(f); */
				
				System.out.println("위치전환 성공");
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
				System.out.println("에러1");
			} catch (IOException e) {
				
				e.printStackTrace();
				System.out.println("에러2");
			}
		}
		else {
			this.good_img = "null";
			this.good_img_size = 999;
		}
	}
	
	
	public long getGood_img_size() {
		return good_img_size;
	}
	public void setGood_img_size(int good_img_size) {
		this.good_img_size = good_img_size;
	}
	public String getGood_date() {
		return good_date;
	}
	public void setGood_date(String good_date) {
		this.good_date = good_date;
	}
	public int getGood_no() {
		return good_no;
	}
	public void setGood_no(int good_no) {
		this.good_no = good_no;
	}
	public String getGood_name() {
		return good_name;
	}
	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}
	public int getGood_price() {
		return good_price;
	}
	public void setGood_price(int good_price) {
		this.good_price = good_price;
	}
	public String getGood_tag() {
		return good_tag;
	}
	public void setGood_tag(String good_tag) {
		this.good_tag = good_tag;
	}
	public int getGood_like() {
		return good_like;
	}
	public void setGood_like(int good_like) {
		this.good_like = good_like;
	}
	public int getGood_stock() {
		return good_stock;
	}
	public void setGood_stock(int good_stock) {
		this.good_stock = good_stock;
	}
	public String getGood_detail() {
		return good_detail;
	}
	public void setGood_detail(String good_detail) {
		this.good_detail = good_detail;
	}
	public String getGood_img() {
		return good_img;
	}
	public void setGood_img(String good_img) {
		this.good_img = good_img;
	}
	public int getSpon_no() {
		return spon_no;
	}
	public void setSpon_no(int spon_no) {
		this.spon_no = spon_no;
	}
	
	
}
