package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Summary;
import mapper.Summary_Mapper;
import service.Summary_Service;

@Service("Summary_ServiceImpl")
public class Summary_ServiceImpl extends Basic_ServiceImpl<Summary> implements Summary_Service {

	@Resource(name="Summary_Mapper")
	Summary_Mapper mapper;

	public int getCount() {
		
		return mapper.getCount();
	}
}
