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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import entity.Activity;
import entity.ActivityTime;
import net.sf.json.JSONObject;
import service.ActivityService;
import service.ActivityTimeService;
import service.OperatorService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller

public class CalendarController {

	@Resource(name = "ActivityTimeServiceImpl")
	ActivityTimeService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	@Resource(name = "Operator_ServiceImpl")
	OperatorService oservice;
	ActivityTime t = new ActivityTime();

	@RequestMapping("toCalendar")
	public String toCalendar() {
		return "fullcalendar-3.10.0/background-events";
	}

	@RequestMapping("getEvent")
	public @ResponseBody JsonInfo getEvent(ModelMap m, HttpServletRequest req) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String start = sdf.format(new Date());
		String end = sdf.format(new Date());
		ArrayList json = new ArrayList<JSONObject>();
		//JSONObject jo = new JSONObject();
		/*
		 * id name dateinfo(start end)
		 */
		List<Activity> list = aservice.select(new SearchInfo("", false));
		List<ActivityTime> tlist = service.select(new SearchInfo("", false));

     
		for (Activity a : list) {
			JSONObject jo = new JSONObject();
			String[] dateinfo = a.getDate();
			start = dateinfo[0] + "-" + dateinfo[1] + "-" + dateinfo[2];
			end = dateinfo[3] + "-" + dateinfo[4] + "-" + dateinfo[5];
			jo.put("id", a.getId());
			jo.put("title", a.getName());
			jo.put("start", start);
			jo.put("content", a.getPlaninfo());
			jo.put("end", end);
			json.add(jo);

		}
		
		for (ActivityTime t : tlist) {
			JSONObject jo = new JSONObject();
			if (t.getTime1() != ""&&t.getTime1() != null) {
				String[] time1 = t.getcal_time1();
				start = t.getDate() + "T" + time1[0]+":00";
				end = t.getDate() + "T" + time1[1]+":00";
				jo.put("title", t.getA_name());
				jo.put("start", start);
				jo.put("end", end);
				json.add(jo);
			}
		}
		for (ActivityTime t : tlist) {
			JSONObject jo = new JSONObject();
			if (t.getTime2() != ""&&t.getTime2() != null) {
				String[] time2 = t.getcal_time2();
				start = t.getDate() + "T" + time2[0];
				end = t.getDate() + "T" + time2[1];
				jo.put("title", t.getA_name());
				jo.put("start", start);
				jo.put("end", end);
				json.add(jo);
			}
		}
		for (ActivityTime t : tlist) {
			JSONObject jo = new JSONObject();
			if (t.getTime3() != ""&&t.getTime3() != null) {
				String[] time3 = t.getcal_time3();
				start = t.getDate() + "T" + time3[0];
				end = t.getDate() + "T" + time3[1];
				jo.put("title", t.getA_name());
				jo.put("start", start);
				jo.put("end", end);
				json.add(jo);
			}
		}
		for (ActivityTime t : tlist) {
			JSONObject jo = new JSONObject();
			if (t.getTime4() != ""&&t.getTime4()!=null) {
				String[] time4 = t.getcal_time4();
				start = t.getDate() + "T" + time4[0];
				end = t.getDate() + "T" + time4[1];
				jo.put("title", t.getA_name());
				jo.put("start", start);
				jo.put("end", end);
				json.add(jo);
			}
		}
		for (ActivityTime t : tlist) {JSONObject jo = new JSONObject();
			if (t.getTime5() != ""&&t.getTime5() != null) {
				String[] time5 = t.getcal_time5();
				start = t.getDate() + "T" + time5[0];
				end = t.getDate() + "T" + time5[1];
				jo.put("title", t.getA_name());
				jo.put("start", start);
				jo.put("end", end);
				json.add(jo);
			}
		}
		for (ActivityTime t : tlist) {
			JSONObject jo = new JSONObject();
			if (t.getTime6() != ""&&t.getTime6() != null) {
				String[] time6 = t.getcal_time6();
				start = t.getDate() + "T" + time6[0];
				end = t.getDate() + "T" + time6[1];
				jo.put("title", t.getA_name());
				jo.put("start", start);
				jo.put("end", end);
				json.add(jo);
			}
		}
		return new JsonInfo(1, (com.alibaba.fastjson.JSONArray) JSON.toJSON(json));
	}
}
