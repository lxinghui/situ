package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Operator;
import entity.School;
import mapper.Operator_Mapper;
import mapper.School_Mapper;
import service.Activity_school_Service;
import service.OperatorService;

@Service("Operator_ServiceImpl")
public class OperatorServiceImpl extends Basic_ServiceImpl<Operator> implements OperatorService{
@Resource(name="Activity_operator_Mapper")
Operator_Mapper mapper;

public int getCount() {
  return mapper.getCount();
}

public Operator login(Operator o) {
	
	return mapper.login(o);
}

public int changePass(Operator o) {
	/*
	 * 1 ³É¹¦
	 * -1 Ê§°Ü
	 */
	if(mapper.changePass(o)>0) {
		return 1;
	}
	return -1;
}
}
