package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import entity.Activity;
import entity.ActivityTime;
import entity.Market;
import service.ActivityService;
import service.ActivityTimeService;
import service.Market_Service;
import service.OperatorService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("market")
public class Market_Controller extends Basic_Controller<Market>{
	
@Resource(name="Market_ServiceImpl")
Market_Service service;

@Resource(name="Operator_ServiceImpl")
OperatorService oservice;

@Resource(name="ActivityServiceImpl")
ActivityService aservice;

@Resource(name = "ActivityTimeServiceImpl")
ActivityTimeService tservice;

@RequestMapping("index1")
public String index1(SearchInfo info, Integer activity_id, String date, ModelMap m, Integer pageno,
		HttpServletRequest req) throws Exception {
	String where = " ";
	if (pageno != null) {
		info.setPage(pageno);
	}
	List<Activity> alist=aservice.select(new SearchInfo("", false));
	m.put("activitylist", alist);
	if(activity_id==null) {
		activity_id=alist.get(0).getId();
	}
	List<ActivityTime> dlist=tservice.select(new SearchInfo("where t.activity_id = "+activity_id, false));
	m.put("datelist", dlist);
	if(date==null) {
		if(dlist.size()>0) {
		date=dlist.get(0).getDate();
		}else {
			date="空";
		}
	}
	
	if (activity_id != null && date.length() > 0) {
		where = " where m.activity_id  = " + activity_id + "  and m.date='" + date + " '";
	}
	Market t = new Market();
	info.setWhere(where);
	if(service.select(info).size()==0) {
	      t.setActivity_id(activity_id);
		  t.setDate(date);
		  t.setOperator_id(1);
		  service.insert(t);
	}
	m.put("activity_id", activity_id);
	m.put("date", date);
	m.put("search", info);
	ObjectMapper mapper = new ObjectMapper();
	try {
		m.put("list", mapper.writeValueAsString(service.selectJson(info)));
		
	} catch (Exception e) {
	  e.printStackTrace();
	} 
	
	m.addAttribute("levelstatus", Market.levelstatus);
	System.out.println("-------"+Market.levelstatus);
	return "Market/index";
}



@RequestMapping("add1")
	public String add(Integer activity_id,String date,SearchInfo info, ModelMap m, HttpServletRequest req)  {
	String where = " where m.activity_id  = " + activity_id + "  and m.date='" + date + " '";
	info.setWhere(where);
	info.setCanPage(false);
	Market a = service.select(info).get(0);
	ObjectMapper mapper = new ObjectMapper();
	try {
		m.put("list", mapper.writeValueAsString(service.selectJson(info)));
		System.out.println(mapper.writeValueAsString(service.selectJson(info)));
		
	} catch (Exception e) {
	e.printStackTrace();
	} 
	m.put("id", a.getId());
	m.put("activity_id", activity_id);
	m.put("date", date);
	m.put("levelstatus", Market.levelstatus);
	return "Market/edit";
		
	}

@Override
	public JsonInfo insert_json(Market o, ModelMap m, HttpServletRequest req) throws Exception {
		
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String newDate = sdf.format(new Date());
	o.setDate(newDate);
	o.setOperator_id(1);
		return super.insert_json(o, m, req);
	}


@RequestMapping("updateStus")
public @ResponseBody JsonInfo updateStus(Market m, String json, HttpServletRequest req) {
	System.out.println("---"+m.getJson());
	service.updateJson(m);
	return new JsonInfo(1, "");
}

}
