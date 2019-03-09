package service;

import entity.Activity;
import entity.Usergroup;

public interface UsergroupService extends Basic_Service<Usergroup> {
	public int getCount();

	public void addOrDelUsers(Usergroup a);
	
	public void addGroup(Usergroup a); 
	
	public void updatePoint(Usergroup a);

}
