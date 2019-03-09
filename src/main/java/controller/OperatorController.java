package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import service.OperatorService;
import utils.SearchInfo;

@Controller
@RequestMapping("operators")
public class OperatorController extends Basic_Controller<Operator>{
@Resource(name="Operator_ServiceImpl")
OperatorService service;

//@Override
//	public String add(ModelMap m, HttpServletRequest req) throws Exception {
//		m.put("sublist", service.select(new SearchInfo()));
//		return super.add(m, req);
//	}
Operator o = new Operator();

@ResponseBody
@RequestMapping("login")
private int login(Operator o,String code,HttpSession session) {
	session.removeAttribute("error");
	if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
		Operator user=service.login(o);
		if(user!=null) {
			if(user.getStatus()==0) {
			session.setAttribute("user",user);
			return 0;
			}else {
				return -3;
			}
		}else {
			return -1;	
		}
	}else {
		return -2;
	}
}	


@RequestMapping("index1")
public String index1(SearchInfo info,String name, ModelMap m,Integer pageno, HttpServletRequest req) throws Exception {
	String where = " ";
	if(pageno!=null) {
		
		info.setPage(pageno);
		
	}
	if (name != null && name.length() > 0) {
		where = " where niki like '%" + name + "%'";
	}
	info.setWhere(where);
	m.put("size",service.getCount());
	info.setSize(service.getCount());
	m.put("list",service.select(info));
	m.put("search", info); // 存上一页和下一页
	return "Operator/index";
}

@RequestMapping("/add1")
public String add(ModelMap map) {
	
	map.put("typestatus", o.typestatus);
	map.put("powerstatus", o.powerstatus);
	map.put("statusstatus", o.statusstatus);
	return "Operator/edit";
}

@RequestMapping("/edit1")
public String edit(int id,ModelMap map) {
	map.put("info", service.selectById(id));
	map.put("typestatus", o.typestatus);
	map.put("powerstatus", o.powerstatus);
	map.put("statusstatus", o.statusstatus);
	return "Operator/edit";
}

}
