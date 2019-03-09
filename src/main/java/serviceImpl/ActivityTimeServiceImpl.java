package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.ActivityTime;
import mapper.ActivityTime_Mapper;
import service.ActivityTimeService;
import utils.SearchInfo;
@Service("ActivityTimeServiceImpl")
public class ActivityTimeServiceImpl extends Basic_ServiceImpl<ActivityTime> implements ActivityTimeService{
@Resource(name="ActivityTime_Mapper")
ActivityTime_Mapper mapper;

public int getCount() {
	return mapper.getCount();
}

public List<ActivityTime> getDate(SearchInfo info) {
	return mapper.getDate(info);
}
}
