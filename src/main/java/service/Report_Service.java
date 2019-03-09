package service;


import entity.Report;
import utils.SearchInfo;

public interface Report_Service extends Basic_Service<Report> {
	public int getCount();

	public Report selectJson(SearchInfo info);

	public void updateJson(Report a);
}
