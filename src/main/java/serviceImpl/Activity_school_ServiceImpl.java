package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.School;
import mapper.School_Mapper;
import service.Activity_school_Service;

@Service("Activity_school_ServiceImpl")
public class Activity_school_ServiceImpl extends Basic_ServiceImpl<School> implements Activity_school_Service{
@Resource(name="Activity_school_Mapper")
School_Mapper mapper;

public int getCount() {
	
	return mapper.getCount();
}

}
