package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.ActivityTime;
import utils.SearchInfo;

@Repository("ActivityTime_Mapper")
public interface ActivityTime_Mapper extends BaicsMapper{

	@Select("select t.*,o.name o_name,a.name a_name from activity_time t "
			+ "inner join Activity_operator o on t.operator_id = o.id "
			+ "inner join activity a on a.id = t.activity_id "
			+ "${where} ${limit}")
	public List<ActivityTime> select(SearchInfo info);
    
    @Select("select t.*,o.name o_name,a.name a_name from Activity_time t "
    		+ "inner join Activity_operator o on t.operator_id = o.id "
    		+ "inner join activity a on a.id = t.activity_id "
    		+ "where t.id=#{id}")
	public ActivityTime selectById(int id);
    
    @Select("select * from activity_time ${where} ${limit}")
    public List<ActivityTime> getDate(SearchInfo info);
    
	@Insert("insert into Activity_time(activity_id,date,time1,time2,time3,time4,time5,time6,roominfo,operator_id,status,comments)"
			+ " value(#{activity_id},#{date},#{time1},#{time2},#{time3},#{time4},#{time5},#{time6},#{roominfo},#{operator_id},#{status},#{comments})")
	public void insert(ActivityTime a);
	
	@Update("update Activity_time set activity_id=#{activity_id},date=#{date},time1=#{time1},time2=#{time2},time3=#{time3},time4=#{time4},time5=#{time5},time6=#{time6},"
			+ "roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments} "
			+ " where id=#{id}")
	public void update(ActivityTime a);
	
	@Update("update Activity_time set activity_id=#{activity_id},date=#{date},time1=#{time1},time2=#{time2},time3=#{time3},time4=#{time4},time5=#{time5},time6=#{time6},"
			+ "roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments} "
			+ " ${where}")
	public void updateAll(ActivityTime a);
	
	@Delete("delete from Activity_time where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_time ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity_time ")
	public int getCount();
}
