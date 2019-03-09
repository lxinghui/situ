package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity;
import entity.Feedback;
import entity.Operator;
import service.ActivityService;
import service.FeedbackService;

import service.UserService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("fFeedback")
public class FeedbackController extends Basic_Controller<Feedback> {
	@Resource(name = "Feedback_ServiceImpl")
	FeedbackService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;

	
	Feedback o = new Feedback();
	@RequestMapping("index1")
	public String index1(SearchInfo info, Integer activity_id, ModelMap m, Integer pageno, HttpServletRequest req)throws Exception {
		String where = " ";
		if (pageno != null) {

			info.setPage(pageno);

		}
		List<Activity> alist=aservice.select(new SearchInfo("", false));
		m.put("activitylist", alist);
		if(activity_id==null) {
			activity_id=alist.get(0).getId();
		}
		if (activity_id != null ) {
			where = " where f.activity_id  = " + activity_id ;
		}

		info.setWhere(where);
		m.put("size", service.getCount());
		info.setSize(service.getCount());
		m.put("list", service.select(info));
		m.put("activity_id", activity_id);
		m.put("search", info); 
		return "Feedback/index";
	}

	@RequestMapping("updateStatus")
	@ResponseBody
	public String update1(Feedback f) {
		
		service.updateStatus(f);
		return "success";
	}



}
