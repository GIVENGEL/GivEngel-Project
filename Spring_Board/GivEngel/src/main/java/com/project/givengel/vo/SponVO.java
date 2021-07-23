package com.project.givengel.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class SponVO {
	private int spon_no;
	private String spon_name;
	private int spon_total;
	private boolean spon_iscampaign;
	private String spon_start;
	private String spon_end;
	private String spon_url;
	private String spon_comment;
	private String spon_img;
	private int spon_img_size;
	private String spon_campaign_img;
	
	
MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file,String root) {
		
		this.file = file;

		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.spon_img = file.getOriginalFilename();
			this.spon_img_size = (int)file.getSize();
			
			//***********************************************
			// 해당 경로로 변경
			
			File f2 = new File("C:\\Users\\kosmo_\\Documents\\GitHub\\GivEngel-Project\\Spring_Board\\GivEngel\\src\\main\\webapp\\resources\\img\\sponsor",spon_img); 
			/* File f = new File(root+good_img); */
			
			System.out.println(root+spon_img);
			System.out.println(spon_img_size);
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
	}
	
	
	public long getSpon_img_size() {
		return spon_img_size;
	}
	public void setSpon_img_size(int spon_img_size) {
		this.spon_img_size = spon_img_size;
	}
	
	public String getSpon_img() {
		return spon_img;
	}
	public void setSpon_img(String spon_img) {
		this.spon_img = spon_img;
	}
	
	public String getSpon_campaign_img() {
		return spon_campaign_img;
	}
	public void setSpon_campaign_img(String spon_campaign_img) {
		this.spon_campaign_img = spon_campaign_img;
	}
	public int getSpon_no() {
		return spon_no;
	}
	public void setSpon_no(int spon_no) {
		this.spon_no = spon_no;
	}
	public String getSpon_name() {
		return spon_name;
	}
	public void setSpon_name(String spon_name) {
		this.spon_name = spon_name;
	}
	public int getSpon_total() {
		return spon_total;
	}
	public void setSpon_total(int spon_total) {
		this.spon_total = spon_total;
	}
	public boolean isSpon_iscampaign() {
		return spon_iscampaign;
	}
	public void setSpon_iscampaign(boolean spon_iscampaign) {
		this.spon_iscampaign = spon_iscampaign;
	}
	public String getSpon_start() {
		return spon_start;
	}
	public void setSpon_start(String spon_start) {
		this.spon_start = spon_start;
	}
	public String getSpon_end() {
		return spon_end;
	}
	public void setSpon_end(String spon_end) {
		this.spon_end = spon_end;
	}
	public String getSpon_url() {
		return spon_url;
	}
	public void setSpon_url(String spon_url) {
		this.spon_url = spon_url;
	}
	public String getSpon_comment() {
		return spon_comment;
	}
	public void setSpon_comment(String spon_comment) {
		this.spon_comment = spon_comment;
	}
	
}
