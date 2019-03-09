package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import utils.SearchInfo;

@Repository("Activity_operator_Mapper")
public interface Operator_Mapper extends BaicsMapper {

	@Select("select * from Activity_operator where niki=#{niki} and pass=#{pass}")
	public Operator login(Operator o);
	
	@Select("select * from Activity_operator  ${where} ${limit}")
	public List<Operator> select(SearchInfo info);
    
    @Select("select * from Activity_operator where id=#{id}")
	public Operator selectById(int id);
    
	@Insert("insert into Activity_operator(niki,name,type,tel,power,status,comments) values(#{niki},#{name},#{type},#{tel},#{power},#{status},#{comments})")
	public void insert(Operator a);
	
	@Update("update Activity_operator set niki=#{niki},name=#{name},type=#{type},tel=#{tel},power=#{power},status=#{status},comments=#{comments} where id=#{id}")
	public void update(Operator a);
	
	@Update("update Activity_operator set niki=#{niki},pass=#{pass},name=#{name},type=#{type},tel=#{tel},power=#{power},status=#{status},comments=#{comments} ${where}")
	public void updateAll(Operator a);
	
	@Delete("delete from Activity_operator where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_operator ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity_operator ")
	public int getCount();
	
	
	@Update("update Activity_operator set pass=#{pass}  where id=#{id}")
	public int changePass(Operator a);
	
}
