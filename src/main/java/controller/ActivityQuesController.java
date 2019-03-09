package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.ActivityQuestion;
import service.ActivityService;
import service.ActivityQuesService;
import service.OperatorService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("ques")
public class ActivityQuesController extends Basic_Controller<ActivityQuestion> {
	@Resource(name = "ActivityQuesServiceImpl")
	ActivityQuesService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	ActivityQuestion q = new ActivityQuestion();
	
	@RequestMapping("index1")
	public String index1(SearchInfo info, String name, ModelMap m, Integer pageno, HttpServletRequest req)
			throws Exception {
		String where = " ";
		if (pageno != null) {

			info.setPage(pageno);

		}
		if (name != null && name.length() > 0) {
			where = " where name like '%" + name + "%'";
		}
		info.setWhere(where);
		m.put("size", service.getCount());
		info.setSize(service.getCount());
		m.put("list", service.select(info));
		m.put("search", info); // 存上一页和下一页
		return "ActivityQues/index";
	}

	@RequestMapping("/add1")
	public String add(ModelMap map) {
		map.put("optA", q.optA);
		map.put("optB", q.optB);
		map.put("optC", q.optC);
		map.put("activitylist", aservice.select(new SearchInfo("", false)));
		return "ActivityQues/edit";
	}

	@RequestMapping("/edit1")
	public String edit(int id, ModelMap map) {
		map.put("optA", q.optA);
		map.put("optB", q.optB);
		map.put("optC", q.optC);
		map.put("activitylist", aservice.select(new SearchInfo("", false)));
		map.put("info", service.selectById(id));
		return "ActivityQues/edit";
	}

	@RequestMapping("insert_json1")
	public @ResponseBody JsonInfo insert_json(ActivityQuestion a, ModelMap m, HttpServletRequest req) throws Exception {	
		service.insert(a);
		return new JsonInfo(1, "");
	}
}
