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

import entity.Activity;
import entity.User;
import entity.Usergroup;
import service.ActivityService;
import service.Activity_school_Service;
import service.CollegeService;
import service.UserService;
import service.UsergroupService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("users")
public class UserController extends Basic_Controller<User> {
	@Resource(name = "User_ServiceImpl")
	UserService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	@Resource(name = "College_ServiceImpl")
	CollegeService cservice;
	@Resource(name = "Activity_school_ServiceImpl")
	Activity_school_Service sservice;
	@Resource(name = "UsergroupServiceImpl")
	UsergroupService gservice;
	// @Override
	// public String add(ModelMap m, HttpServletRequest req) throws Exception {
	// m.put("sublist", service.select(new SearchInfo()));
	// return super.add(m, req);
	// }
	User o = new User();

	@RequestMapping("index1")
	public String index1(Integer select, String txt, Integer school_id, Integer college_id, Integer type,
			SearchInfo info, ModelMap m, Integer pageno, HttpServletRequest req) throws Exception {

		if (select == null)
			select = 0;
		String where = "";

		if (school_id != null) {
			where = " where u.school_id =" + school_id + " and u.college_id = " + college_id + " and u.type=" + type
					+ " ";
		}
		if (type != null) {
			switch (select) {
			case 1:
				where = " where u.name  like '%" + txt + "%' and u.type=" + type + " ";
				break;
			case 2:
				where = " where u.tel like '%" + txt + "%' and u.type=" + type + " ";
				break;
			case 3:
				where = " where u.ylevel =" + txt + " and u.type=" + type + " ";
				break;
			case 4:
				where = " where u.glevel =" + txt + " and u.type=" + type + " ";
				break;
			case 5:
				where = " where u.slevel =" + txt + " and u.type=" + type + " ";
				break;
			default:
				where = " where u.school_id =" + school_id + " and u.college_id = " + college_id + " and u.type=" + type
						+ " ";
			}

		} else if (school_id == null) {
			where = " where u.school_id = 1 and u.college_id =1 and u.type=0 ";
		}

		info.setWhere(where);
		info.setSize(service.getCount(new SearchInfo(where, false)));
		m.put("select", select);
		m.put("txt", select == 0 ? "'" + txt + "'" : txt);
		m.put("school_id", school_id);
		m.put("college_id", college_id);
		m.put("type", type);
		m.put("schoollist", sservice.select(new SearchInfo("", false)));
		m.put("collegelist", cservice.select(new SearchInfo("", false)));
		m.put("typestatus", o.typestatus);
		m.put("sexstatus", o.sexstatus);
		m.put("ylevelstatus", o.ylevelstatus);
		m.put("glevelstatus", o.glevelstatus);
		m.put("slevelstatus", o.slevelstatus);
		m.put("statusstatus", o.statusstatus);
		m.put("list", service.select(info));
		m.put("search", info);
		return "User/index";
	}

	@RequestMapping("show")
	public String show(String cmd, String gcmd, String ids, Integer g_id, Integer a_id,String gname,String gpath,String gproject,String gcomments, ModelMap m) {
		m.put("gname", gname);
		m.put("gpath", gpath);
		m.put("gproject", gproject);
		m.put("gcomments", gcomments);
		String where = " where u.type=0 ";
		if (cmd != null && cmd.length() > 0) {
			m.put("cmd", cmd);
		}
		if (gcmd != null && gcmd.length() > 0) {
			m.put("gcmd", gcmd);
		}
		if (a_id != null && ids == null) {
			Activity activity = aservice.selectById(a_id);
			String idss = activity.getIds();
			ArrayList<User> users = (ArrayList<User>) service
					.select(new SearchInfo(" where u.id in (" + idss + ") and u.type=0", false));
			m.put("list", users);
			if (gcmd == null) {
				m.put("ids", idss);
			}
		} else if ((a_id == null && ids == null)) {
			m.put("list", service.select(new SearchInfo(where, false)));
		}
		if (ids != null) {
			m.put("list", service.select(new SearchInfo(where, false)));
			m.put("ids", ids);
		}
		if (g_id != null) {
			Usergroup usergroup = gservice.selectById(g_id);
			m.put("ids", usergroup.getIds());
		}
		return "User/show";
	}

	@RequestMapping("/add1")
	public String add(String a_id, ModelMap map) {
		if (a_id != null) {
			System.out.println("_---" + a_id);
			map.put("a_id", a_id);
		}
		// 学校
		map.put("schoollist", sservice.select(new SearchInfo("", false)));
		// 学院
		map.put("collegelist", cservice.select(new SearchInfo("", false)));
		map.put("typestatus", o.typestatus);
		map.put("sexstatus", o.sexstatus);
		map.put("ylevelstatus", o.ylevelstatus);
		map.put("glevelstatus", o.glevelstatus);
		map.put("slevelstatus", o.slevelstatus);
		map.put("statusstatus", o.statusstatus);
		return "User/edit";
	}

	@RequestMapping("/details")
	public String details(int id, ModelMap map) {
		map.put("info", service.selectById(id));
		return "User/details";
	}

	@RequestMapping("/edit1")
	public String edit(int id, ModelMap map) {
		// 学校
		map.put("schoollist", sservice.select(new SearchInfo("", false)));
		// 学院
		map.put("collegelist", cservice.select(new SearchInfo("", false)));
		map.put("typestatus", o.typestatus);
		map.put("sexstatus", o.sexstatus);
		map.put("ylevelstatus", o.ylevelstatus);
		map.put("glevelstatus", o.glevelstatus);
		map.put("slevelstatus", o.slevelstatus);
		map.put("statusstatus", o.statusstatus);
		map.put("info", service.selectById(id));
		return "User/edit";
	}

	@RequestMapping("/edit2")
	public String edit2(int id, ModelMap map) {
		// 学校
		map.put("schoollist", sservice.select(new SearchInfo("", false)));
		// 学院
		map.put("collegelist", cservice.select(new SearchInfo("", false)));
		map.put("typestatus", o.typestatus);
		map.put("sexstatus", o.sexstatus);
		map.put("ylevelstatus", o.ylevelstatus);
		map.put("glevelstatus", o.glevelstatus);
		map.put("slevelstatus", o.slevelstatus);
		map.put("statusstatus", o.statusstatus);
		map.put("info", service.selectById(id));
		return "User/instructor";
	}

	@RequestMapping("insert_json1")
	public @ResponseBody JsonInfo insert_json1(String a_id, User u, ModelMap m, HttpServletRequest req)
			throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = sdf.format(new Date());
		u.setCreatedate(newDate);
		u.setOperator_id(1);
		List<User> users = service.select(new SearchInfo("", false));
		for (User a : users) {
			if (u.getName().equals(a.getName()) && u.getTel().equals(a.getTel())) {
				service.insert(u);
				System.out.println("1");
			} else if (u.getName().equals(a.getName()) && u.getQq().equals(a.getQq())) {
				service.insert(u);
				System.out.println("2");
			} else if (u.getTel().equals(a.getTel()) && u.getQq().equals(a.getQq())) {
				service.insert(u);
				System.out.println("3");
			} else if (u.getTel().equals(a.getTel()) && u.getName().equals(a.getName())) {
				service.insert(u);
				System.out.println("4");
			} else if (u.getTel().equals(a.getTel()) && u.getName().equals(a.getName())
					&& u.getQq().equals(a.getQq())) {
				service.insert(u);
				System.out.println("5");
			} else {
				if (a_id == null) {
					return new JsonInfo(0,"活动id为空");
				} else if (a_id == "") {//新增活动的时候
					int new_id = service.insertuser(u);
					return new JsonInfo(new_id, "");
				} else if (a_id != null) {//修改活动
					int activity_id = Integer.valueOf(a_id);
					u.setActivity_id(1);//1表示已加入某个活动了
					int new_id = service.insertuser(u);
					Activity act = aservice.selectById(Integer.valueOf(a_id));
					if(act.getIds()!=null&&act.getIds()!="") {
					String ids = act.getIds() + "," + new_id;
					return new JsonInfo(-1, ids);
					}else {
						String ids =  "" + new_id;
						return new JsonInfo(-1, ids);
					}
					
				}
			}
		}
		return new JsonInfo(0, "");
	}

	@RequestMapping("insert_instructor")
	public @ResponseBody JsonInfo insert_instructor(User u, ModelMap m, HttpServletRequest req) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = sdf.format(new Date());
		u.setCreatedate(newDate);
		u.setOperator_id(1);
		service.insertInstructor(u);
		return new JsonInfo(1, "");
	}

	@RequestMapping("update_instructor")
	public @ResponseBody JsonInfo update_instructor(User a, ModelMap m, HttpServletRequest req) throws Exception {
		service.updateInstructor(a);
		return new JsonInfo(1, "");
	}
}
