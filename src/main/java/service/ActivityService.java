package service;

import entity.Activity;
import utils.SearchInfo;

public interface ActivityService extends Basic_Service<Activity>{
	public int getCount(SearchInfo info);

	public void addUsers(Activity a);
	
	public void addOrDelUsers(Activity a);
	
	public int getLastid();
	
	public void changeStatus(Activity a);
}
