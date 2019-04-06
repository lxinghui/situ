package serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import annotation.RedisCache;
import entity.Activity;
import entity.User;
import mapper.Activity_Mapper;
import mapper.User_Mapper;
import service.ActivityService;
import utils.SearchInfo;

@Service("ActivityServiceImpl")
public class ActivityServiceImpl extends Basic_ServiceImpl<Activity> implements ActivityService {
	@Resource(name = "Activity_Mapper")
	Activity_Mapper mapper;
	@Resource(name = "Activity_user_Mapper")
	User_Mapper u_mapper;

	public int getCount(SearchInfo info) {

		return mapper.getCount(info);
	}

	@Transactional
	public void addUsers(Activity a) {
		String ids = a.getIds();
		if (ids != null && ids != "") {
			mapper.insert(a);
			List<User> user_all = u_mapper.select(new SearchInfo(" where u.id in (" + ids + ")", false));
			for (User u : user_all) {
				u.setActivity_id(1);
				u_mapper.updateA_id(u);
			}
		}else {
			mapper.insert(a);
		}

	}

	@Transactional
	public void addOrDelUsers(Activity a) {
		String ids = a.getIds();
		mapper.update(a);
		int id = mapper.getid();
		List<User> user_all = u_mapper.select(new SearchInfo(" where u.id in (" + ids + ")", false));
		for (User u : user_all) {
			u.setActivity_id(0);
			u_mapper.updateA_id(u);
		}
		ArrayList<User> users = (ArrayList<User>) u_mapper
				.select(new SearchInfo(" where u.id in (" + ids + ")", false));
		for (User u : users) {
			u.setActivity_id(id);
			u_mapper.updateA_id(u);
		}
	}

	
	public int getLastid() {

		return mapper.getLastid();
	}
	
	@Override
	@RedisCache(type=Activity.class,expire=5000,fieldKey="#id")
	public Activity selectById(Integer id) {
		return super.selectById(id);
	}
	
}
