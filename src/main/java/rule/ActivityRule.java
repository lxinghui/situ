package rule;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.ui.ModelMap;

import service.ActivityService;
import utils.SearchInfo;
import utils.SpringTool;

public class ActivityRule {


	public SearchInfo beforeQueryRule(Integer select, String txt, String name, Integer pageno) {
		
		String where="";
		if (select == null) {
			select = 0; txt="0";
			where = " where a.type=" + 0;
			//where = " where a.type=" + 0 + " and  DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= a.createdate  ";
		}
		if (txt != null && txt.length() > 0) {
			switch (select) {
			case 0:
				where = " where a.type=" + 0;
				break;
			case 1:
				where = "where  a.source_operator_id =" + txt + " ";
				break;
			case 2:
				where = " where  a.charge_operator_id =" + txt + " ";
				break;
			case 3:
				where = " where  s.name like '%" + txt + "%' ";
				break;
			}
		}
		if (name != null && name.length() > 0) {
			where = " where name like '%" + name + "%'";
		}
		ActivityService aservice = (ActivityService) SpringTool.getBean("ActivityServiceImpl");
		int size= aservice.getCount(new SearchInfo(where, false));
		SearchInfo info = new SearchInfo();
		info.setSize(size);
		info.setWhere(where);	
		if (pageno != null) {
			info.setPage(pageno);
		}
		return info;
	}
}
