package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.ActivityQuestion;
import mapper.ActivityQues_Mapper;
import service.ActivityQuesService;
@Service("ActivityQuesServiceImpl")
public class ActivityQuesServiceImpl extends Basic_ServiceImpl<ActivityQuestion> implements ActivityQuesService{
@Resource(name="ActivityQues_Mapper")
ActivityQues_Mapper mapper;

public int getCount() {
	
	return mapper.getCount();
}

}
