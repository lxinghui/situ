package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import entity.Activity;
import entity.ActivityTime;
import entity.Report;
import service.ActivityService;
import service.ActivityTimeService;
import service.Market_Service;
import service.OperatorService;
import service.Report_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("report")
public class Report_Controller extends Basic_Controller<Report>{
	
@Resource(name="Report_ServiceImpl")
Report_Service service;

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
			date="绌�";
		}
	}
	
	
	
	if (activity_id != null && date.length() > 0) {
		where = " where r.activity_id  = " + activity_id + "  and r.date='" + date + " '";
		
	}
	Report t = new Report();
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
	

	
	return "Report/index";
}



@RequestMapping("add1")
	public String add(Integer activity_id,String date,SearchInfo info, ModelMap m, HttpServletRequest req)  {
	String where = " where r.activity_id  = " + activity_id + "  and r.date='" + date + " '";
	info.setWhere(where);
	info.setCanPage(false);
	Report a = service.select(info).get(0);
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
	return "Report/edit";
		
	}

@Override
	public JsonInfo insert_json(Report o, ModelMap m, HttpServletRequest req) throws Exception {
		
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String newDate = sdf.format(new Date());
	o.setDate(newDate);
	o.setOperator_id(1);
		return super.insert_json(o, m, req);
	}


@RequestMapping("updateStus")
public @ResponseBody JsonInfo updateStus(Report m, String json, HttpServletRequest req) {
	System.out.println("---"+m.getJson());
	System.out.println("-----"+json);
	service.updateJson(m);
	return new JsonInfo(1, "");
}

}
