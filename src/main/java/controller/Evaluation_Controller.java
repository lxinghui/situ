package controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity;
import entity.Evaluation;
import entity.User;
import service.ActivityService;
import service.Evaluation_Service;
import service.UserService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("evaluations")
public class Evaluation_Controller extends Basic_Controller<Evaluation> {

	@Resource(name = "Evaluation_ServiceImpl")
	Evaluation_Service service;

	@Resource(name = "User_ServiceImpl")
	UserService uservice;

	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;

	@RequestMapping("index1")
	public String index1(Integer select, Integer activity_id, Integer pageno, SearchInfo info, String txt, ModelMap m,
			HttpServletRequest req) throws Exception {
		String where = "";
		if (pageno != null) {
			info.setPage(pageno);
		}
		if (activity_id == null) {
			activity_id = aservice.getLastid(); // 默认最新的
		}
		info.setWhere(where);
		info.setSize(service.getCount());
		m.put("status", Evaluation.evestatus);
		m.put("search", info);
		ArrayList<Activity> list = (ArrayList<Activity>) aservice
				.select(new SearchInfo(" where a.id=" + activity_id, false));
		String ids = list.get(0).getIds();
		ArrayList<User> ulist = (ArrayList<User>) uservice
				.select(new SearchInfo(" where u.id in (" + ids + ") ", false));// 活动所有用户
		ArrayList<Evaluation> elist = (ArrayList<Evaluation>) service
				.select(new SearchInfo("where e.activity_id=" + activity_id, false));// 活动的测评表
		ArrayList<Integer> a = new ArrayList<Integer>();
		ArrayList<Integer> b = new ArrayList<Integer>();
		ArrayList<Integer> diff = new ArrayList<Integer>();
		Evaluation e = new Evaluation();
		if (elist.size() != ulist.size()) {
			for (Evaluation ee : elist) {
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
			// System.out.println("新的: " + str);
			ArrayList<User> diffusers = (ArrayList<User>) uservice
					.select(new SearchInfo(" where u.id in (" + str + ") ", false));// 活动所有用户
			// 用户表的 id 和 测评表的 id
			for (User u : diffusers) {
				e.setUser_id(u.getId());
				e.setActivity_id(activity_id);
				service.insert(e);
				m.put("elist", service.select(new SearchInfo("where e.activity_id=" + activity_id, false)));
			}
		} else {
			m.put("elist", service.select(new SearchInfo("where e.activity_id=" + activity_id, false)));

		}
		m.put("activity_id", activity_id);
		m.put("activitylist", aservice.select(new SearchInfo("", false)));
		return "Evaluation/index";

	}

	@RequestMapping("add1")
	public String add1(SearchInfo info, ModelMap m, int id) throws Exception {

		m.put("info", service.selectById(id));
		m.put("status", Evaluation.evestatus);
		return "Evaluation/edit";

	}

	@RequestMapping("b_add")
	public String b_add(String ids, ModelMap m, int a_id) throws Exception {
		m.put("ids", ids);
		m.put("activity_id", a_id);
		m.put("status", Evaluation.evestatus);
		return "Evaluation/b_edit";

	}

	@RequestMapping("b_update")
	public @ResponseBody JsonInfo b_update(Evaluation o, String ids, ModelMap m, HttpServletRequest req)
			throws Exception {
		o.setWhere(" where id in (" + ids + ")");
		service.updateAll(o);
		return new JsonInfo(1, "");
	}

	@Override
	public JsonInfo update_json(Evaluation o, ModelMap m, HttpServletRequest req) throws Exception {
		m.put("alist", aservice.select(new SearchInfo("", false)));
		return super.update_json(o, m, req);
	}
}
