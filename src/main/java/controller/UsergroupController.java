package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity;
import entity.ActivityQuestion;
import entity.User;
import entity.Usergroup;
import service.ActivityQuesService;
import service.ActivityService;
import service.UserService;
import service.UsergroupService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("groups")
public class UsergroupController extends Basic_Controller<Usergroup> {
	@Resource(name = "UsergroupServiceImpl")
	UsergroupService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	@Resource(name = "User_ServiceImpl")
	UserService uservice;
	Usergroup q = new Usergroup();
	
	@RequestMapping("index1")
	public String index1(SearchInfo info,ModelMap m,Integer pageno,String txt,Integer a_id, HttpSession session,HttpServletRequest req)
			throws Exception {
		String where = " ";
		if (pageno != null) {
			info.setPage(pageno);
		}
		if(txt==null) {
			txt = ""+aservice.getLastid(); //默认最新的
			where = " where g.activity_id = "+txt;
		}
		where = " where g.activity_id = "+txt;
		m.put("activitylist", aservice.select(new SearchInfo("",false)));
		info.setWhere(where);
        m.put("txt",txt);
		m.put("size", service.getCount());
		info.setSize(service.getCount());
		List<Usergroup> glist =  service.select(info);
		HashMap<Integer, ArrayList<User>> map =new HashMap<Integer, ArrayList<User>>();
		ArrayList<User> ulist = new ArrayList<User>();
		for(Usergroup g:glist) { 
			ulist = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in ("+g.getIds()+")", false));
			map.put(g.getId(), ulist);
		}
		m.put("ulist", map);
		m.put("list", glist);
		
		m.put("search", info); // 存上一页和下一页
		return "Usergroup/index";
	}

	@RequestMapping("/add1")
	public String add(ModelMap map,String cmd,Integer a_id,String ids,String gname,String gpath,String gproject,String gcomments) {
		map.put("gname", gname);
		map.put("gpath", gpath);
		map.put("gproject", gproject);
		map.put("gcomments", gcomments);
		if (ids != null && ids.length() > 0) {
			ArrayList<User> users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in ("+ids+")", false));
			map.put("users", users);
			map.put("ids", ids);	
		}
		map.put("cmd", cmd);
		//获取活动
		if(a_id!=null) {
			map.put("activity", aservice.selectById(a_id));
		}
		System.out.println("---------"+aservice.selectById(a_id).getC_name());
		return "Usergroup/edit";
	}
    
	@RequestMapping("/edit1")
	public String edit(int id,String ids, ModelMap map,HttpSession session) {
		ArrayList<User> users = new ArrayList<User>();
		map.put("activitylist", aservice.select(new SearchInfo("", false)));
		map.put("info", service.selectById(id));
		q = service.selectById(id);
		Activity a =aservice.selectById(q.getActivity_id());
		if(ids!=null) {
			users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in ("+ids+")", false));
		}else {
		ids = q.getIds();
		 users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in ("+ids+")", false));
		}
		map.put("users", users);
		session.setAttribute("id",id);
		map.put("ids", ids);
		return "Usergroup/edit";
	}
	  
	@RequestMapping("/showusers")
	public String showusers(int id,ModelMap map,HttpSession session) {
		
		q = service.selectById(id);	
		ArrayList<User> users = (ArrayList<User>) uservice.select(new SearchInfo(" where u.id in ("+q.getIds()+")", false));
		map.put("list", users);
		return "Usergroup/showusers";
	}
	  
	
		@RequestMapping("/mark")
		public String mark(int id,ModelMap map) {
			map.put("info", service.selectById(id));
			return "Usergroup/mark";
		}
	@RequestMapping("update_json1")
	public @ResponseBody JsonInfo update_json(Usergroup a, ModelMap m, HttpServletRequest req) throws Exception {
		service.addOrDelUsers(a);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("update_point")
	public @ResponseBody JsonInfo update_point(Usergroup a, ModelMap m, HttpServletRequest req) throws Exception {
		service.updatePoint(a);
		return new JsonInfo(1, "");
	}
	

	@RequestMapping("insert_json1")
	public @ResponseBody JsonInfo insert_json(Usergroup u, ModelMap m, HttpServletRequest req) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = sdf.format(new Date());
		u.setCreatedate(newDate);
		u.setOperator_id(1);
		service.addGroup(u);
		return new JsonInfo(1, "");
	}
}
