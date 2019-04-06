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

import entity.ActivityTime;
import service.ActivityService;
import service.ActivityTimeService;
import service.OperatorService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("times")
public class ActivityTimeController extends Basic_Controller<ActivityTime> {
	@Resource(name = "ActivityTimeServiceImpl")
	ActivityTimeService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	@Resource(name = "Operator_ServiceImpl")
	OperatorService oservice;
	ActivityTime t = new ActivityTime();

	@RequestMapping("index1")
	public String index1(SearchInfo info, Integer a_id, String txt, ModelMap m, Integer pageno, HttpServletRequest req)
			throws Exception {
		String where = " ";
		
		if (pageno != null) {
			info.setPage(pageno);
		}
		if(txt==null) {
			txt = ""+aservice.getLastid(); //默认最新的
		}
		where = " where t.activity_id = "+txt;
		if(a_id!=null) {
		//	System.out.println("--------"+a_id);
			m.put("a_id", a_id);
			where = " where t.activity_id = "+a_id;
		}
		
		m.put("activitylist", aservice.select(new SearchInfo("",false)));
		info.setWhere(where);
        m.put("txt",txt);
        
		info.setSize(service.getCount());
		info.setWhere(where);
		m.put("size", service.getCount());
		info.setSize(service.getCount());
		m.put("list", service.select(new SearchInfo(where, false)));
		m.put("search", info); // 存上一页和下一页
		return "ActivityTime/index";
	}


	
	@RequestMapping("/add1")
	public String add(Integer a_id,ModelMap map) {
		if(a_id!=null) {
			map.put("activity", aservice.selectById(a_id));
		}
		map.put("activitylist", aservice.select(new SearchInfo("", false)));
		map.put("operatorlist", oservice.select(new SearchInfo("", false)));
		map.put("statusstatus", t.statusstatus);
		return "ActivityTime/edit";
	}

	@RequestMapping("/cal")
	public @ResponseBody String cal(String date) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			
			
		} catch (Exception e) {
		  e.printStackTrace();
		} 
		return "ActivityTime/index1"  ;
	}
	@RequestMapping("/edit1")
	public String edit(int id, ModelMap map) {
		map.put("activitylist", aservice.select(new SearchInfo("", false)));
		map.put("operatorlist", oservice.select(new SearchInfo("", false)));
		map.put("info", service.selectById(id));
		map.put("statusstatus", t.statusstatus);
		return "ActivityTime/edit";
	}

	@RequestMapping("insert_json1")
	public @ResponseBody JsonInfo insert_json(ActivityTime a, ModelMap m, HttpServletRequest req) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = sdf.format(new Date());
		service.insert(a);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("getDate")
	@ResponseBody
	public List<ActivityTime> getDate(Integer id,ModelMap map) {
		List<ActivityTime> list= service.getDate(new SearchInfo(" WHERE activity_id = "+id, false));
		return list;
	}
	

}
