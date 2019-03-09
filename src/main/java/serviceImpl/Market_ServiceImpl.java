package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Market;
import mapper.Market_Mapper;
import service.Market_Service;
import utils.SearchInfo;

@Service("Market_ServiceImpl")
public class Market_ServiceImpl extends Basic_ServiceImpl<Market> implements Market_Service {

	@Resource(name="Market_Mapper")
	Market_Mapper mapper;

	public int getCount() {
		
		return mapper.getCount();
	}
	public Market selectJson(SearchInfo info) {
		return mapper.selectJson(info);
	}
	public void updateJson(Market a) {
		mapper.updateJson(a);
	}
}
