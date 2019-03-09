package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.College;
import entity.School;
import entity.User;
import mapper.College_Mapper;
import mapper.Operator_Mapper;
import mapper.School_Mapper;
import mapper.User_Mapper;
import service.Activity_school_Service;
import service.CollegeService;
import service.OperatorService;
import service.UserService;

@Service("College_ServiceImpl")
public class CollegeServiceImpl extends Basic_ServiceImpl<College> implements CollegeService{
@Resource(name="Activity_college_Mapper")
College_Mapper mapper;

public int getCount() {
  return mapper.getCount();
}

}
