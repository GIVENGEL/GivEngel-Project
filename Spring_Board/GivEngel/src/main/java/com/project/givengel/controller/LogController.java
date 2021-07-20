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

import com.project.givengel.service.LogService;
import com.project.givengel.service.LoginService;
import com.project.givengel.vo.AdminVO;
import com.project.givengel.vo.LogVO;
import com.project.givengel.vo.UserVO;

@Controller
public class LogController {
	
	@Autowired
	private LogService logService;

	@RequestMapping("/countSale.giv")
	@ResponseBody
	public String countSale() {

		List<LogVO> list = logService.selectLog();
		int result = 0;
		for(int i=0;i<list.size();i++ ) {
			if(list.get(i).getLog_detail().contains("SALE"))
			{
				System.out.println("[LogController] SALE 발견 : " + list.get(i).getLog_detail() );
				String[] temp = list.get(i).getLog_detail().split("#");
				result += Integer.parseInt(temp[3]);
				System.out.println("[LogController] price :" + temp[3]);
			}
		}
		return Integer.toString(result);
	}
	
	@RequestMapping("/countOrder.giv")
	@ResponseBody
	public String countOrder() {

		List<LogVO> list = logService.selectLog();
		int result = 0;
		for(int i=0;i<list.size();i++ ) {
			if(list.get(i).getLog_detail().contains("SALE"))
			{
				System.out.println("[LogController] SALE 발견 : " + list.get(i).getLog_detail() );
				result++;
			}
		}
		return Integer.toString(result);
	}

	@RequestMapping(value="/selectDevLog.giv",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectDevLog() {

		List<LogVO> list = logService.selectLog();
		List<LogVO> temp = new ArrayList<LogVO>();
		List<String> ids = new ArrayList<String>();
		for(int i=0;i<list.size();i++ ) {
			if(list.get(i).getLog_detail().contains("[ADMIN"))
			{
				String[] id =  list.get(i).getLog_detail().split("#");
				
				ids.add(id[1]);
				temp.add(list.get(i));
				
			}
		}
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("devLog", temp);
		 map.put("id",ids);
		return map;
	}
	
	
	
}
