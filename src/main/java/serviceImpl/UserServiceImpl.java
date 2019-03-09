package serviceImpl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.School;
import entity.User;
import mapper.Operator_Mapper;
import mapper.School_Mapper;
import mapper.User_Mapper;
import service.Activity_school_Service;
import service.OperatorService;
import service.UserService;
import utils.SearchInfo;

@Service("User_ServiceImpl")
public class UserServiceImpl extends Basic_ServiceImpl<User> implements UserService {
	@Resource(name = "Activity_user_Mapper")
	User_Mapper mapper;

	public User login(User u) {
		return mapper.login(u);
	}
	
	public int getCount(SearchInfo info) {
		return mapper.getCount(info);
	}

	public void updateGstatus(User u) {
		mapper.updateGstatus(u);
	}

	@Transactional
	public void updateGstatus_all(String ids) {
		ArrayList<User> users = (ArrayList<User>) mapper.select(new SearchInfo(" where u.id in (" + ids + ")", false));
		for (User u : users) {
			mapper.updateGstatus(u);
		}
	}
public int insertuser(User a) {
	mapper.insert(a);
	return mapper.getid();
}
	public void insertInstructor(User a) {
		mapper.insertInstructor(a);
	}

	public void updateInstructor(User a) {
	   mapper.updateInstructor(a);
	}

	public int changePass(User u) {
		/*
		 * 1 ³É¹¦
		 * -1 Ê§°Ü
		 */
		if(mapper.changePass(u)>0) {
			return 1;
		}
		return -1;
	}
}
