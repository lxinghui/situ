package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Feedback;
import mapper.Feedback_Mapper;
import service.FeedbackService;


@Service("Feedback_ServiceImpl")
public class FeedbackServiceImpl extends Basic_ServiceImpl<Feedback> implements FeedbackService{
@Resource(name="Feedback_Mapper")
Feedback_Mapper mapper;

public int getCount() {
  return mapper.getCount();
}
public void updateStatus(Feedback t) {
	 mapper.updateStatus(t);
}

public void updateresult(Feedback t) {
	 mapper.updateresult(t);
}
}
