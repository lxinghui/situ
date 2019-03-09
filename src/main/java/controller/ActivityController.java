package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity;
import entity.User;
import service.ActivityService;
import service.ActivityTimeService;
import service.Activity_school_Service;
import service.CheckworkService;
import service.CollegeService;
import service.OperatorService;
import service.UserService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("activities")
public class ActivityController extends Basic_Controller<Activity> {
	@Resource(name = "ActivityServiceImpl")
	ActivityService service;
	@Resource(name = "College_ServiceImpl")
	CollegeService cservice;
	@Resource(name = "Activity_school_ServiceImpl")
	Activity_school_Service sservice;
	@Resource(name = "User_ServiceImpl")
	UserService uservice;
	@Resource(name = "Operator_ServiceImpl")
	OperatorService oservice;
	@Resource(name = "CheckworkServiceImpl")
	CheckworkService wservice;
	@Resource(name = "ActivityTimeServiceImpl")
	ActivityTimeService tservice;
	Activity a = new Activity();
	// @Override
	// public String add(ModelMap m, HttpServletRequest req) throws Exception {
	// m.put("sublist", service.select(new SearchInfo()));
	// return super.add(m, req);
	// }

	@RequestMapping("index1")
	public String index1(SearchInfo info, Integer select, String txt, String name, ModelMap m, Integer pageno,
			HttpServletRequest req) throws Exception {
		String where = " ";
		if (select == null) {
			select = 0; txt="0";
			where = " where a.type=" + 0 + " and  DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= a.createdate  ";
		}
			
		if (txt != null && txt.length() > 0) {
			switch (select) {
			case 0:
				where = " where a.type=" + txt + "  and  DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= a.createdate ";
				break;
			case 1:
				where = "where  a.source_operator_id =" + txt + " ";
				break;
			case 2:
				where = " where  a.charge_operator_id =" + txt + " ";
				break;
			case 3:
				where = " where  s.name like '%" + txt + "%' ";
				break;
			}
		}
		if (pageno != null) {

			info.setPage(pageno);

		}
		if (name != null && name.length() > 0) {
			where = " where name like '%" + name + "%'";
		}
		m.put("sourcelist", oservice.select(new SearchInfo(" ",false)));
		m.put("chargelist", oservice.select(new SearchInfo(" ",false)));
		m.addAttribute("select", select);
		m.addAttribute("txt", select == 0 ? "" + txt + "" : txt);
		info.setWhere(where);
		info.setSize(service.getCount(new SearchInfo(where, false)));
		m.put("list", service.select(info));
		m.put("typestatus", a.typestatus);
		m.put("search", info); // 存上一页和下一页
		return "Activity/index";
	}

	@RequestMapping("/add1")
	public String add(ModelMap map, String ids) {
	
		if (ids != null && ids.length() > 0) {
			ArrayList<User> users = (ArrayList<User>) uservice
					.select(new SearchInfo(" where u.id in (" + ids + ")", false));
			map.put("users", users);
			map.put("ids", ids);
		}
		// 学校
		map.put("schoollist", sservice.select(new SearchInfo("", false)));
		// 学院
		map.put("collegelist", cservice.select(new SearchInfo("", false)));
		map.put("userlist", uservice.select(new SearchInfo(" where type=1", false)));
		map.put("operatorlist", oservice.select(new SearchInfo(" where type=0", false)));
		map.put("statusstatus", a.statusstatus);
		map.put("typestatus", a.typestatus);
		return "Activity/edit1";
	}

	@RequestMapping("/showusers")
	public String showusers(int id,ModelMap map,HttpSession session) {
		ArrayList<User> users = new ArrayList<User>();
		a = service.selectById(id);	
		if(a.getIds()!=null&&a.getIds()!="") {
		users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in ("+a.getIds()+")", false));
		map.put("list", users);
		}
		else {
			map.put("list", "空空如也");
		}
		return "Activity/users";
	}
	
	@RequestMapping("/details")
	public String details(int id, ModelMap map) {
		map.put("ainfo", service.selectById(id));
		map.put("userlist", uservice.select(new SearchInfo(" where u.activity_id ="+id, true)));
		map.put("timelist", tservice.select(new SearchInfo(" where t.activity_id = "+id, false)));
		return "Activity/details";
	}

	@RequestMapping("/edit1")
	public String edit(int id, String ids, ModelMap map, HttpSession session) {
		// 学校
		ArrayList<User> users = new ArrayList<User>();
		map.put("schoollist", sservice.select(new SearchInfo("", false)));
		// 学院
		map.put("collegelist", cservice.select(new SearchInfo("", false)));
		map.put("userlist", uservice.select(new SearchInfo(" where u.type=1", false)));
		map.put("operatorlist", oservice.select(new SearchInfo("", false)));
		map.put("info", service.selectById(id));
		a = service.selectById(id);
		if (ids != null) {
			users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in (" + ids + ")", false));
			map.put("ids", ids);
		} else {
			users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in (" + a.getIds() + ")", false));
			map.put("ids", a.getIds());
		}
		map.put("users", users);
		session.setAttribute("id", id);
		map.put("statusstatus", a.statusstatus);
		map.put("typestatus", a.typestatus);
		return "Activity/edit1";
	}


	@RequestMapping("/facility")
	public String facility(int id, ModelMap map, HttpSession session) {
		
		a = service.selectById(id);
	    map.put("info", a);
	    map.put("facility", a.facility);
		return "Activity/facility";
	}
	
	@RequestMapping("update_json1")
	public @ResponseBody JsonInfo update_json(Activity a, ModelMap m, HttpServletRequest req) throws Exception {
		service.addOrDelUsers(a);
		return new JsonInfo(1, "");
	}

	@RequestMapping("insert_json1")
	public @ResponseBody JsonInfo insert_json(Activity a, ModelMap m, HttpServletRequest req) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = sdf.format(new Date());
		a.setCreatedate(newDate);
		a.setOperator_id(1);
		service.addUsers(a);
		return new JsonInfo(1, "");
	}
}
