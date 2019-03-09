package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Evaluation;
import mapper.Evaluation_Mapper;
import service.Evaluation_Service;

@Service("Evaluation_ServiceImpl")
public class Evaluation_ServiceImpl extends Basic_ServiceImpl<Evaluation> implements Evaluation_Service {

	@Resource(name="Evaluation_Mapper")
	Evaluation_Mapper mapper;

	public int getCount() {
		
		return mapper.getCount();
	}
}
