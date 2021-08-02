package com.project.givengel.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FleaVO {
	private int flea_no;
	private String flea_title;
	private int flea_price;
	private String flea_date;
	private String flea_writer;
	private boolean flea_isokay;
	private String flea_content;
	private String flea_img;
	
	
	//-----------------------------------------------------------
	
		MultipartFile file;	// write.jsp에 파일첨부시 name="file"과 동일한 변수명
		
		public MultipartFile getFile() {
			return file;
		}
		public void setFile(MultipartFile file) {
			this.file = file;
			
			// 업로드 파일 접근
			if(! file.isEmpty()){
				this.flea_img = file.getOriginalFilename();
				
				//***********************************************
				// 해당 경로로 변경
				File f = new File("C:\\Users\\kosmo_\\Documents\\GitHub\\GivEngel-Project\\Spring_Board\\GivEngel\\src\\main\\webapp\\resources\\img\\flea\\"+ flea_img);
				
				try {
					file.transferTo(f);
					
				} catch (IllegalStateException e) {				
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		}
	
	
	public int getFlea_no() {
		return flea_no;
	}
	public void setFlea_no(int flea_no) {
		this.flea_no = flea_no;
	}
	public String getFlea_title() {
		return flea_title;
	}
	public void setFlea_title(String flea_title) {
		this.flea_title = flea_title;
	}
	public int getFlea_price() {
		return flea_price;
	}
	public void setFlea_price(int flea_price) {
		this.flea_price = flea_price;
	}
	public String getFlea_date() {
		return flea_date;
	}
	public void setFlea_date(String flea_date) {
		this.flea_date = flea_date;
	}
	public String getFlea_writer() {
		return flea_writer;
	}
	public void setFlea_writer(String flea_writer) {
		this.flea_writer = flea_writer;
	}
	public boolean isFlea_isokay() {
		return flea_isokay;
	}
	public void setFlea_isokay(boolean flea_isokay) {
		this.flea_isokay = flea_isokay;
	}
	public String getFlea_content() {
		return flea_content;
	}
	public void setFlea_content(String flea_content) {
		this.flea_content = flea_content;
	}
	public String getFlea_img() {
		return flea_img;
	}
	public void setFlea_img(String flea_img) {
		this.flea_img = flea_img;
	}
	
	
}
