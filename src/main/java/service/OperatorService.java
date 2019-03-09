package service;

import entity.Operator;
import entity.User;


public interface OperatorService extends Basic_Service<Operator>{

	public int getCount();
	
	public Operator login(Operator o);
	
	public int changePass(Operator o);
}
