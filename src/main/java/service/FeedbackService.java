package service;

import entity.Feedback;

public interface FeedbackService extends Basic_Service<Feedback>{

	public int getCount();
	public void updateStatus(Feedback t);
	public void updateresult(Feedback t);
}
