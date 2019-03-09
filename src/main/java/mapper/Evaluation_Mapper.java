package mapper;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Evaluation;
import utils.SearchInfo;


@Repository("Evaluation_Mapper")
public interface Evaluation_Mapper extends BaicsMapper{
	@Select("select e.*,u.name u_name,a.name a_name from Activity_Evaluation e "
			+ "inner join activity_user u on e.user_id=u.id"
			+ " inner join activity a on e.activity_id=a.id ${where} ${limit}")
	public List<Evaluation> select(SearchInfo info);
    
    @Select("select * from Activity_Evaluation where id=#{id}")
	public Evaluation selectById(int id);
    
	@Insert("insert into Activity_Evaluation(user_id,activity_id) value(#{user_id},#{activity_id})")
	public void insert(Evaluation a);
	
	@Update("update Activity_Evaluation set point=#{point},status=#{status},comments=#{comments} where id=#{id}")
	public void update(Evaluation a);
	
	@Update("update Activity_Evaluation set point=#{point},status=#{status},comments=#{comments} ${where}")
	public void updateAll(Evaluation a);
	
	@Delete("delete from Activity_Evaluation where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_Evaluation ${where}")
	public void deleteALL(SearchInfo info); 
	@Select("select count(*) from Activity_Evaluation ")
	public int getCount();
	

}
