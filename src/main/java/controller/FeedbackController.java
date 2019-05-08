package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import entity.Activity;
import entity.ActivityTime;
import entity.Feedback;
import entity.Summary;
import entity.User;
import service.ActivityService;
import service.ActivityTimeService;
import service.FeedbackService;
import service.UserService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("feedbacks")
public class FeedbackController extends Basic_Controller<Feedback> {
	@Resource(name = "Feedback_ServiceImpl")
	FeedbackService service;
	@Resource(name = "ActivityServiceImpl")
	ActivityService aservice;
	@Resource(name = "User_ServiceImpl")
	UserService uservice;
	@Resource(name = "ActivityTimeServiceImpl")
	ActivityTimeService tservice;

	Feedback o = new Feedback();

	@RequestMapping("index1")
	public String index1(SearchInfo info,String date, Integer activity_id, ModelMap m, Integer pageno, HttpServletRequest req)
			throws Exception {
		List<ActivityTime> dlist;
		String where = " ";
		if (pageno != null) {

			info.setPage(pageno);

		}
		List<Activity> alist = aservice.select(new SearchInfo("", false));
		m.put("activitylist", alist);
		if (activity_id == null) {
			activity_id = alist.get(0).getId();
			dlist = tservice.select(new SearchInfo("where t.activity_id = " + activity_id, false));
			m.put("datelist", dlist);
		}
		if (activity_id != null&&date !=null) {
			dlist = tservice.select(new SearchInfo("where t.activity_id = " + activity_id, false));
			where = " where f.activity_id  = " + activity_id + " and f.date = '"+date+"'";
			m.put("datelist", dlist);
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

	@RequestMapping("/studentindex")
	public String studentindex(ModelMap map, Integer user_id,String date, HttpServletRequest req) {
		HttpSession session = req.getSession();
		user_id = (Integer) session.getAttribute("id");
		User user = uservice.selectById(user_id);
		int activity_id = user.getActivity_id();
		List<Feedback> flist = service.select(
				new SearchInfo(" where f.activity_id  = " + activity_id + " and  f.user_id = " + user_id, false));
		List<ActivityTime> dlist = tservice.select(new SearchInfo("where t.activity_id = " + activity_id, false));	
		map.put("datelist", dlist);
		if (flist.size() == 0) {
			for (ActivityTime t : dlist) {
				o.setActivity_id(activity_id);
				o.setUser_id(user_id);
				o.setDate(t.getDate());
				service.insert(o);
			}
			flist = service.select(
					new SearchInfo(" where f.activity_id  = " + activity_id + " and  f.user_id = " + user_id, false));
		}else if(date !=null) {
			
			flist = service.select(
					new SearchInfo(" where f.activity_id  = " + activity_id + " and  f.user_id = " + user_id +" and f.date = '"+date+"'", false));
		}
		map.put("flist", flist);

		map.put("activity", aservice.selectById(activity_id));
		return "Feedback/studentindex";
	}

	@RequestMapping("edit1")
	public String edit1(Integer id, String date,ModelMap m, HttpServletRequest req) throws Exception {
        if(id!=null) {
        	List<Feedback> flist = service.select(new SearchInfo(" where f.id  = " + id, false));
    		if (flist.size() != 0) {
    			o = flist.get(0);
    			m.put("info", o);
    		}
        }
	
		if(date!=null) {
			 HttpSession session = req.getSession();
			 int user_id = (Integer) session.getAttribute("id");
			List<Feedback> flist = service.select(new SearchInfo(" where f.user_id = "+user_id+" and f.date  = '" + date+"'", false));
    		if (flist.size() != 0) {
    			o = flist.get(0);
    			m.put("info", o);
    		}
    		else {
    			System.out.println("’“≤ªµΩ");
    		}
		}

		Activity a = aservice.selectById(o.getActivity_id());
		int operator_id = a.getCharge_operator_id();

		Summary s = new Summary();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String createdate = sdf.format(new Date());
		return "Feedback/edit";
	}

	@Override
	public JsonInfo update_json(Feedback o, ModelMap m, HttpServletRequest req) throws Exception {

		return super.update_json(o, m, req);
	}
}
