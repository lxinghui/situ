package service;

import java.util.List;

import entity.ActivityTime;
import utils.SearchInfo;

public interface ActivityTimeService extends Basic_Service<ActivityTime>{
	public int getCount();
	public List<ActivityTime> getDate(SearchInfo info);
}
