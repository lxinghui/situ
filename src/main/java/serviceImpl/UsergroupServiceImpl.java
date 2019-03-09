package serviceImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Activity;
import entity.User;
import entity.Usergroup;
import mapper.User_Mapper;
import mapper.Usergroup_Mapper;
import service.UsergroupService;
import utils.SearchInfo;

@Service("UsergroupServiceImpl")
public class UsergroupServiceImpl extends Basic_ServiceImpl<Usergroup> implements UsergroupService {
	@Resource(name = "Usergroup_Mapper")
	Usergroup_Mapper mapper;
	@Resource(name = "Activity_user_Mapper")
	User_Mapper u_mapper;

	public int getCount() {

		return mapper.getCount();
	}

	@Transactional
	public void addOrDelUsers(Usergroup a) {
		String ids = a.getIds();
		/*
		 * 修改 新增 变为1 删除 部分变为0
		 */
		String[] list = ids.split(",");
		Usergroup u = mapper.selectById(a.getId());
		List<User> user_all = u_mapper.select(new SearchInfo(" where u.id  in(" + u.getIds() + ")", false));
		for (User user : user_all) {
			user.setGstatus(0);
			u_mapper.updateGstatus(user);
		}
		List<User> users = u_mapper.select(new SearchInfo(" where u.id in (" + ids + ")", false));
		for (User user : users) {
			user.setGstatus(1);
			u_mapper.updateGstatus(user);
		}
		mapper.update(a);
	}

	@Transactional
	public void addGroup(Usergroup a) {
		String ids = a.getIds();
		List<User> users = u_mapper.select(new SearchInfo(" where u.id in (" + ids + ")", false));
		for (User user : users) {
			user.setGstatus(1);
			u_mapper.updateGstatus(user);
		}
		mapper.insert(a);
	}

	public void updatePoint(Usergroup a) {
		mapper.updatePoint(a);
	}
	
	
}
