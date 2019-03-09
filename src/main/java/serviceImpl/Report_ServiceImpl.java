package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Report;
import mapper.Report_Mapper;
import service.Report_Service;
import utils.SearchInfo;

@Service("Report_ServiceImpl")
public class Report_ServiceImpl extends Basic_ServiceImpl<Report> implements Report_Service {

	@Resource(name="Report_Mapper")
	Report_Mapper mapper;

	public int getCount() {
		
		return mapper.getCount();
	}
	public Report selectJson(SearchInfo info) {
		return mapper.selectJson(info);
	}
	public void updateJson(Report a) {
		mapper.updateJson(a);
	}
}
