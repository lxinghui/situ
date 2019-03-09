package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Checkwork;
import mapper.Checkwork_Mapper;
import service.CheckworkService;


@Service("CheckworkServiceImpl")
public class CheckworkServiceImpl extends Basic_ServiceImpl<Checkwork> implements CheckworkService{
@Resource(name="Checkwork_Mapper")
Checkwork_Mapper mapper;

public int getCount() {
  return mapper.getCount();
}
}
