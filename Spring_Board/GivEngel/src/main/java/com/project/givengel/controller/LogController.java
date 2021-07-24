package com.project.givengel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.givengel.service.AdminService;
import com.project.givengel.service.LogService;
import com.project.givengel.service.LoginService;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.UserVO;

@Controller
public class LogController {
	
	@Autowired
	private LogService logService;
	
	@Autowired
	private AdminService adminService;

	
	/*****************************************************
	 * 함수명 			: 	countSale
	 * 
	 * 함수 기능 		:	1. 로그 기록을 통해 총 판매액을 문자열로 반환
	 * 
	 * 사용된 함수 		:	-
	 * 사용된 서비스 	:	logService
	 * 마지막 수정		:	2021-07-21
	 *****************************************************/
	@RequestMapping("/countSale.giv")
	@ResponseBody
	public String countSale() {
		int result = adminService.priceCount();
		return Integer.toString(result);
	}
	
	@RequestMapping("/countCash.giv")
	@ResponseBody
	public String countCash() {
		int result = adminService.cashCount();
		return Integer.toString(result);
	}
	
	
	
	@RequestMapping("/selectToDoLog.giv")
	@ResponseBody
	public Map<String,Object> selectToDoLog(String admin_id) {
		List<LogVO> list = logService.selectLog();
		List<LogVO> temp = new ArrayList<LogVO>();
		List<String> id = new ArrayList<String>();
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getLog_detail().contains("[TODO]#"))
			{
				System.out.println("[select문장] :" + admin_id);
				String[] tp = list.get(i).getLog_detail().split("#");
				if(tp[1].equals(admin_id)) {
					id.add(tp[1]);
					list.get(i).setLog_detail(tp[2]);
					temp.add(list.get(i));
				}
				
			}
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("todoid", id);
		map.put("todolog", temp);
		return map;
	
	}
	
	
	
	

	
	
	/*****************************************************
	 * 함수명 			: 	selectDevLog
	 * 
	 * 함수 기능 		:	1. 개발자와 관련된 로그 리스트를 맵에 담아 반환
	 * 				
	 * 사용된 함수 		:	-
	 * 사용된 서비스 		:	logService, adminService
	 * 마지막 수정		:	2021-07-22
	 *****************************************************/
	@RequestMapping(value="/selectDevLog.giv",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectDevLog() {
		List<LogVO> list = logService.selectLog();
		List<LogVO> temp = new ArrayList<LogVO>();
		List<String> ids = new ArrayList<String>();
		List<Integer> levels = new ArrayList<Integer>();
		for(int i=0;i<list.size();i++ ) {
			if(list.get(i).getLog_detail().contains("[ADMIN"))
			{
				String[] id =  list.get(i).getLog_detail().split("#");
				
				AdminVO adminvo = new AdminVO();
				
				adminvo = adminService.selectAdmin(id[1]);
				if(adminvo !=null) {
				levels.add(adminvo.getAdmin_level());
				}
				else {
					levels.add(5);
				}
				ids.add(id[1]);
				temp.add(list.get(i));
			}
		}
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("level", levels);
		 map.put("devLog", temp);
		 map.put("id",ids);
		return map;
	}
	
	
	
}
