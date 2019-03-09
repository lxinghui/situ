package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Usergroup;
import utils.SearchInfo;

@Repository("Usergroup_Mapper")
public interface Usergroup_Mapper extends BaicsMapper{

	@Select("select g.*,a.name a_name,o.name o_name from Activity_usergroup g "
			+ "inner join Activity a on g.activity_id = a.id "
			+ "inner join Activity_operator o on o.id = g.operator_id "
			+ "${where} ${limit}")
	public List<Usergroup> select(SearchInfo info);
    
    @Select("select g.*,a.name a_name from Activity_usergroup g "
            + "inner join Activity a on g.activity_id = a.id "
            + "inner join Activity_operator o on o.id = g.operator_id "
    		+ "where g.id=#{id}")
	public Usergroup selectById(int id);
    
	@Insert("insert into Activity_usergroup(activity_id,name,ids,project,path,createdate,operator_id)"
			+ " value(#{activity_id},#{name},#{ids},#{project},#{path},#{createdate},#{operator_id})")
	public void insert(Usergroup a);
	
	@Update("update Activity_usergroup set name=#{name},project=#{project},ids=#{ids},path=#{path},comments=#{comments}"
			+ " where id=#{id}")
	public void update(Usergroup a);
	
	@Update("update Activity_usergroup set point1=#{point1},point2=#{point2},point3=#{point3},point4=#{point4},point5=#{point5},point6=#{point6},point7=#{point7},point8=#{point8},point9=#{point9},point10=#{point10}"
			+ " where id=#{id}")
	public void updatePoint(Usergroup a);
	@Update("update Activity_question set activity_id=#{activity_id},date=#{date},question1=#{question1},question2=#{question2},question3=#{question3},question4=#{question4},question5=#{question5},question6=#{question6},"
			+ "roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments} "
			+ " ${where}")
	public void updateAll(Usergroup a);
	
	@Delete("delete from Activity_usergroup where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_usergroup ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity_usergroup ")
	public int getCount();
}
