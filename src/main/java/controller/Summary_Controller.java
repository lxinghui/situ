package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Activity;
import entity.Summary;
import service.ActivityService;
import service.OperatorService;
import service.Summary_Service;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
@RequestMapping("summarys")
public class Summary_Controller extends Basic_Controller<Summary>{
	
@Resource(name="Summary_ServiceImpl")
Summary_Service service;
@Resource(name = "ActivityServiceImpl")
ActivityService aservice;
@Resource(name = "Operator_ServiceImpl")
OperatorService oservice;


@RequestMapping("index1")
public String index(Integer select,Integer pageno, SearchInfo info, String txt, ModelMap m, HttpServletRequest req)throws Exception {
	if(select==null)select=0;
	String where="";
	 if(pageno!=null) {
			info.setPage(pageno);
		}
	if(txt!=null){
		switch (select) { 
		case 1:
			where=" where s.operator_id="+txt+" ";
			break;
		case 0:
			where=" where s.activity_id='"+txt+"' ";
			
		}
		info.setCanPage(false);
		info.setWhere(where);
		m.put("list", service.select(info));
		System.out.println(service.select(info));
	}
	if(txt==null)
	{ 
		txt=" ";
		m.put("list", service.select(new SearchInfo(" order by s.createdate DESC ", false)));
	}
	info.setSize(service.getCount());
	
	m.put("select",select);
	m.put("txt",select==0?"'"+txt+"'":txt);
	
	
	m.put("olist", oservice.select(new SearchInfo("where Activity_operator.type=0 ", false)));
	m.put("alist", aservice.select(new SearchInfo(" ", false)));
	m.put("search", info);

	m.put("sstatus", Summary.sstatues);
	m.put("cstatus", Summary.cstatues);
	m.put("tstatus", Summary.tstatues);
	m.put("xstatus", Summary.xstatues);
	return "Summary/index";
	}




@RequestMapping("edit1")
	public String edit1(Integer activity_id,ModelMap m, HttpServletRequest req) throws Exception {
	
	ArrayList<Summary> slist=(ArrayList<Summary>) service.select(new SearchInfo("where s.activity_id="+activity_id, false));
	
	Activity a=aservice.selectById(activity_id);
	int operator_id=a.getCharge_operator_id();
	
	Summary s=new Summary();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String createdate = sdf.format(new Date());
	
	m.put("size", slist.size());
	if(slist.size()!=0) {
		m.put("info", service.select(new SearchInfo(" where s.activity_id="+activity_id, false)).get(0));
		
	}
	if(slist.size()==0) {
		s.setCreatedate(createdate);
		s.setOperator_id(operator_id);
		s.setActivity_id(activity_id);
		service.insert(s);
		
		m.put("info", service.select(new SearchInfo(" where s.activity_id="+activity_id, false)).get(0));
	}
	
	m.put("sstatus", Summary.sstatues);
	m.put("cstatus", Summary.cstatues);
	m.put("tstatus", Summary.tstatues);
	m.put("xstatus", Summary.xstatues);
		return "Summary/edit2";
	}
    
@RequestMapping("info")
public String info(Integer activity_id,ModelMap m, HttpServletRequest req) throws Exception {

ArrayList<Summary> slist=(ArrayList<Summary>) service.select(new SearchInfo("where s.activity_id="+activity_id, false));

Activity a=aservice.selectById(activity_id);
int operator_id=a.getCharge_operator_id();

Summary s=new Summary();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String createdate = sdf.format(new Date());

m.put("size", slist.size());
if(slist.size()!=0) {
	m.put("info", service.select(new SearchInfo(" where s.activity_id="+activity_id, false)).get(0));
	
}
if(slist.size()==0) {
	s.setCreatedate(createdate);
	s.setOperator_id(operator_id);
	s.setActivity_id(activity_id);
	service.insert(s);
	
	m.put("info", service.select(new SearchInfo(" where s.activity_id="+activity_id, false)).get(0));
}

m.put("sstatus", Summary.sstatues);
m.put("cstatus", Summary.cstatues);
m.put("tstatus", Summary.tstatues);
m.put("xstatus", Summary.xstatues);
	return "Summary/index1";
}


@Override
	public JsonInfo update_json(Summary o, ModelMap m, HttpServletRequest req) throws Exception {
		int one = o.getSstatus();
		int four = o.getCstatus();
		int two = o.getTstatus();
		int three = o.getXstatus();
		String str = ""+one+""+""+two+""+three+""+four;
		o.setOption(str);
		return super.update_json(o, m, req);
	}


}
