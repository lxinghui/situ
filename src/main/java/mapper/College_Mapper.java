package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.College;
import utils.SearchInfo;

@Repository("Activity_college_Mapper")
public interface College_Mapper extends BaicsMapper{

	@Select("select c.*,s.name school_name from activity_college c inner join activity_school s on c.school_id=s.id ${where} ${limit}")
	public List<College> select(SearchInfo info);
    
    @Select("select * from Activity_college where id=#{id}")
	public College selectById(int id);
    
	@Insert("insert into Activity_college(name,school_id) value(#{name},#{school_id})")
	public void insert(College a);
	
	@Update("update Activity_college set name=#{name},school_id=#{school_id} where id=#{id}")
	public void update(College a);
	
	@Update("update Activity_college set name=#{name} ${where}")
	public void updateAll(College a);
	
	@Delete("delete from Activity_college where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_college ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity_college ")
	public int getCount();

}
