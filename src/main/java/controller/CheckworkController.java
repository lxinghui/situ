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
import entity.ActivityTime;
import entity.Checkwork;
import entity.Evaluation;
import entity.User;
import service.ActivityService;
import service.ActivityTimeService;
import service.CheckworkService;
import service.OperatorService;
import service.UserService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("checkwork")
public class CheckworkController extends Basic_Controller<Checkwork> {
	@Resource(name = "CheckworkServiceImpl")
	CheckworkService service;
	@Resource(name = "User_ServiceImpl")
	UserService uservice;
	@Resource(name = "Operator_ServiceImpl")
	OperatorService oservice;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	@Resource(name = "ActivityTimeServiceImpl")
	ActivityTimeService tservice;

	Checkwork o = new Checkwork();

	@RequestMapping("index1")
	public String index1(Integer user_id,SearchInfo info, Integer activity_id, String date, ModelMap m, Integer pageno,
			HttpServletRequest req) throws Exception {
		String where = " ";
		if (pageno != null) {
			info.setPage(pageno);
		}
	
		List<Activity> alist = aservice.select(new SearchInfo("", false));
		m.put("activitylist", alist);
		if (activity_id == null) {
			activity_id = alist.get(0).getId();
		}
		List<ActivityTime> dlist = tservice.select(new SearchInfo("where t.activity_id = " + activity_id, false));
		m.put("datelist", dlist);
		if (date == null) {
			if (dlist.size() > 0) {
				date = dlist.get(0).getDate();
			} else {
				date = "空";
			}
		}
		// 活动没创建时间的话。。。
		// 如果有考勤 则显示
		if (activity_id != null && date.length() > 0) {
			
			where = " where c.activity_id  = " + activity_id + "  and c.date='" + date + " '";
			if(user_id!=null) {
				where = " where c.activity_id  = " + activity_id + "and c.user_id="+user_id+"  and c.date='" + date + " '";
			}
		}

		List<Activity> ac_list = aservice.select(new SearchInfo(" where a.id=" + activity_id, false));
		String ids = ac_list.get(0).getIds();
		System.out.println(ids);
		if (ids != null && ids != "") {
			ArrayList<User> ulist = (ArrayList<User>) uservice
					.select(new SearchInfo(" where u.id in (" + ids + ") ", false));// 活动所有用户
			List<Checkwork> wlist = service.select(new SearchInfo(" where c.activity_id  = " + activity_id
					+ "  and c.date='" + date + " ' " + " and  c.user_id in (" + ids + ")", false));
			if (wlist.size() == 0) {
				for (User u : ulist) {
					o.setActivity_id(activity_id);
					o.setDate(date);
					o.setUser_id(u.getId());
					o.setOperator_id(1);
					o.setCheck1(0);
					o.setCheck2(0);
					o.setCheck3(0);
					service.insert(o);
				}
			} else {
				if (wlist.size() != ulist.size()) {
					ArrayList<Integer> a = new ArrayList<Integer>();
					ArrayList<Integer> b = new ArrayList<Integer>();
					ArrayList<Integer> diff = new ArrayList<Integer>();
					Checkwork c = new Checkwork();
					for (Checkwork ee : wlist) {
						a.add(ee.getUser_id());
					}
					for (User uu : ulist) {
						b.add(uu.getId());
					}
					for (Integer j : b) {
						if (!a.contains(j)) {

							diff.add(j);
						}
					}
					String str = null;
					for (int i = 0; i < diff.size(); i++) {
						if (i == 0)
							str = "" + diff.get(i);
						else
							str = str + "," + diff.get(i);
					}
					System.out.println("新的: " + str);
					ArrayList<User> diffusers = (ArrayList<User>) uservice
							.select(new SearchInfo(" where u.id in (" + str + ") ", false));
					for (User u : diffusers) {
						o.setUser_id(u.getId());
						o.setActivity_id(activity_id);
						o.setOperator_id(1);
						o.setDate(date);
						o.setCheck1(0);
						o.setCheck2(0);
						o.setCheck3(0);
						service.insert(o);
					}
				}
			}
		}else {
			System.out.println("没有用户");
		}
		info.setWhere(where);
		m.put("size", service.getCount());
		info.setSize(service.getCount());
		Date d = new Date();
		String today = new SimpleDateFormat("yyyy-MM-dd").format(d);
		m.put("today", today);
		m.put("activity_id", activity_id);
		m.put("date", date);
		m.put("list", service.select(
				new SearchInfo("where c.activity_id  = " + activity_id + "  and c.date='" + date + " '", true)));
		m.put("search", info);

		return "Checkwork/index";
	}

	@RequestMapping("b_add")
	public String b_add(String ids, ModelMap m, Integer activity_id, String date) throws Exception {
		m.put("ids", ids);
		m.put("activity_id", activity_id);
		m.put("date", date);
		m.put("checkstatus", o.checkstatus);
		return "Checkwork/b_edit";
	}

	@RequestMapping("b_update")
	public @ResponseBody JsonInfo b_update(Checkwork o, String ids, ModelMap m, HttpServletRequest req)
			throws Exception {
		o.setWhere(" where id in (" + ids + ")");
		Date d = new Date();
		String date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(d);
		o.setLastdate(date);
		o.setOperator_id(1);
		service.updateAll(o);
		return new JsonInfo(1, "");
	}

	@RequestMapping("/add1")
	public String add(ModelMap map) {

		map.put("userlist", uservice.select(new SearchInfo("", false)));

		map.put("operatorlist", oservice.select(new SearchInfo("", false)));

		map.put("activitylist", aservice.select(new SearchInfo("", false)));

		map.put("checkstatus", o.checkstatus);

		return "Checkwork/edit";
	}

	@RequestMapping("/edit1")
	public String edit(int id, Integer activity_id, String date, ModelMap map) {

		map.put("userlist", uservice.select(new SearchInfo("", false)));

		map.put("operatorlist", oservice.select(new SearchInfo("", false)));

		map.put("activitylist", aservice.select(new SearchInfo("", false)));
		map.put("checkstatus", o.checkstatus);
		map.put("info", service.selectById(id));
		map.put("activity_id", activity_id);
		map.put("date", date);
		return "Checkwork/edit";
	}

	@Override
	public @ResponseBody JsonInfo update_json(Checkwork c, ModelMap m, HttpServletRequest req) throws Exception {

		Date d = new Date();
		String date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(d);
		c.setLastdate(date);

		return super.update_json(c, m, req);
	}
	
	
	/*
	 * 学生查看自己的考勤信息
	 * 班级 课程 讲师 学术名称 电话 
     * 班级 学生名称 时间
     * 日期 早/午/晚 备注
	 */
	

	@RequestMapping("/studentindex")
	public String studentindex(ModelMap map, Integer user_id,String date) {
        User user = uservice.selectById(user_id);
        int activity_id=user.getActivity_id();
		List<Checkwork> clist = service.select(new SearchInfo(" where c.activity_id  = " + activity_id
				+  " and  c.user_id = " + user_id , false));
		List<ActivityTime> dlist = tservice.select(new SearchInfo("where t.activity_id = " + activity_id, false));
		map.put("clist", clist);
        map.put("activity", aservice.selectById(activity_id));
		map.put("user",user);
		return "Checkwork/studentindex";
	}

     
}
