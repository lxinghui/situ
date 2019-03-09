package service;

import entity.Market;
import utils.SearchInfo;

public interface Market_Service extends Basic_Service<Market> {
	public int getCount();

	public Market selectJson(SearchInfo info);

	public void updateJson(Market a);
}
