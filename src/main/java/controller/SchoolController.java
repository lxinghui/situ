package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.School;
import service.Activity_school_Service;
import utils.SearchInfo;

@Controller
@RequestMapping("schools")
public class SchoolController extends Basic_Controller<School>{
@Resource(name="Activity_school_ServiceImpl")
Activity_school_Service service;

//@Override
//	public String add(ModelMap m, HttpServletRequest req) throws Exception {
//		m.put("sublist", service.select(new SearchInfo()));
//		return super.add(m, req);
//	}

@RequestMapping("index1")
public String index1(SearchInfo info,String name, ModelMap m,Integer pageno, HttpServletRequest req) throws Exception {
	String where = " ";
	if(pageno!=null) {
		
		info.setPage(pageno);
		
	}
	if (name != null && name.length() > 0) {
		where = " where name like '%" + name + "%'";
	}
	info.setWhere(where);
	info.setCanPage(false);
	m.put("size",service.getCount());
	info.setSize(service.getCount());
	System.out.println(info.getLimit());
	m.put("list",service.select(info));
	m.put("search", info); // 存上一页和下一页
	return "School/index";
}

@RequestMapping("/add1")
public String add(ModelMap map) {
	
	return "School/edit";
}

@RequestMapping("/edit1")
public String edit(int id,ModelMap map) {
	map.put("info", service.selectById(id));
	System.out.println("-----------"+service.selectById(id).getId());
	return "School/edit";
}

}
