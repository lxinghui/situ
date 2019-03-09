package service;

import entity.User;
import utils.SearchInfo;

public interface UserService extends Basic_Service<User> {

	public int getCount(SearchInfo info);

	public void updateGstatus(User u);

	public void updateGstatus_all(String ids);

	public void insertInstructor(User a);
	
	public void updateInstructor(User a);
	
	public int insertuser(User a);
	
	public User login(User u);
	
	public int changePass(User u);
}
