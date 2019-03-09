package mapper;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Summary;
import utils.SearchInfo;


@Repository("Summary_Mapper")
public interface Summary_Mapper extends BaicsMapper{
	@Select("select s.*,o.name o_name,a.name a_name from Activity_Summary s inner join activity_operator o on s.operator_id=o.id inner join activity a on s.activity_id=a.id ${where} ${limit}")
	public List<Summary> select(SearchInfo info);
    
    @Select("select * from Activity_Summary where id=#{id}")
	public Summary selectById(int id);
    
	@Insert("insert into Activity_Summary (activity_id,operator_id,createdate) value(#{activity_id},#{operator_id},#{createdate})")
	public void insert(Summary a);
	
	@Update("update Activity_Summary set Activity_Summary.`option`=#{option},comments=#{comments},sstatus=#{sstatus},tstatus=#{tstatus},cstatus=#{cstatus},xstatus=#{xstatus},summary=#{summary},proposal=#{proposal} where id=#{id}")
	public void update(Summary a);
	
	@Update("update Activity_Summary set niki=#{niki},name=#{name},type=#{type},tel=#{tel},power=#{power},status=#{status},comments=#{comments} ${where}")
	public void updateAll(Summary a);
	
	@Delete("delete from Activity_Summary where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_Summary ${where}")
	public void deleteALL(SearchInfo info); 
	@Select("select count(*) from Activity_Summary ")
	public int getCount();
	

}
