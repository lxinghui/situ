package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.School;
import utils.SearchInfo;

@Repository("Activity_school_Mapper")
public interface School_Mapper extends BaicsMapper{

	@Select("select * from Activity_school  ${where} ${limit}")
	public List<School> select(SearchInfo info);
    
    @Select("select * from Activity_school where id=#{id}")
	public School selectById(int id);
    
	@Insert("insert into Activity_school(name) value(#{name})")
	public void insert(School a);
	
	@Update("update Activity_school set name=#{name} where id=#{id}")
	public void update(School a);
	
	@Update("update Activity_school set name=#{name} ${where}")
	public void updateAll(School a);
	
	@Delete("delete from Activity_school where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_school ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity_school ")
	public int getCount();
}
