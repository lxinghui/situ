package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.College;
import entity.School;
import service.Activity_school_Service;
import service.CollegeService;
import utils.SearchInfo;

@Controller
@RequestMapping("colleges")
public class CollegeController extends Basic_Controller<College>{
@Resource(name="College_ServiceImpl")
CollegeService service;
@Resource(name = "Activity_school_ServiceImpl")
Activity_school_Service sservice;




@RequestMapping("index1")
	public String index(SearchInfo info,Integer txt, ModelMap m, HttpServletRequest req) throws Exception {
	String where=" ";

	if(txt!=null) {
           where=" where s.id ="+txt+" ";
           
	      }
	if(txt==null){
	    	  txt=1;
	    	  where=" where s.id ="+txt+" ";  
	      }
	info.setWhere(where);
	
	m.put("slist", sservice.select(new SearchInfo(" ",false)));
	
	m.put("list", service.select(info));
	
	m.put("txt", txt);
	
	return "College/index";
	}

@RequestMapping("/add1")
public String add(ModelMap map,int school_id) {
	
	map.put("school_id",school_id);
	return "College/edit";
}

@RequestMapping("/edit1")
public String edit(int id,ModelMap map) {
	map.put("schoollist", sservice.select(new SearchInfo("", false)));
	map.put("info", service.selectById(id));
	return "College/edit";
}

@RequestMapping("/getBySchool_id")
public @ResponseBody List<College> getBySchool_id(int schoolid,ModelMap map) {
	List<College> list = service.select(new SearchInfo(" where c.school_id="+schoolid, false));
	return list;
}
}
