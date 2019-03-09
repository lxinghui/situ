package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.User;
import utils.SearchInfo;

@Repository("Activity_user_Mapper")
public interface User_Mapper extends BaicsMapper {

	@Select("select * from Activity_user where niki=#{niki} and pass=#{pass}")
	public User login(User u);

	@Select("SELECT u.*, s.name school_Name,c.name college_Name,o.name operator_Name FROM activity_user u "
			+ "INNER JOIN activity_school s ON s.id = u.school_id "
			+ "INNER JOIN activity_college c ON c.id = u.college_id "
			+ "INNER JOIN activity_operator o ON o.id = u.operator_id " + "${where} ${limit}")
	public List<User> select(SearchInfo info);

	@Select("SELECT u.*, s.name school_Name,c.name college_Name,o.name operator_Name FROM activity_user u "
			+ "INNER JOIN activity_school s ON s.id = u.school_id "
			+ "INNER JOIN activity_college c ON c.id = u.college_id "
			+ "INNER JOIN activity_operator o ON o.id = u.operator_id " + "where u.id = #{id}")
	public User selectById(int id);

	@Insert("insert into Activity_user(activity_id,niki,name,sex,type,tel,qq,classinfo,ylevel,glevel,slevel,school_id,college_id,status,info,createdate,operator_id,comments) "
			+ "value(#{activity_id},#{niki},#{name},#{sex},#{type},#{tel},#{qq},#{classinfo},#{ylevel},#{glevel},#{slevel},#{school_id},#{college_id},#{status},#{info},#{createdate},#{operator_id},#{comments})")
	public void insert(User a);

	@Insert("insert into Activity_user(niki,name,sex,type,tel,qq,school_id,college_id,status,createdate,operator_id,comments) "
			+ "value(#{niki},#{name},#{sex},#{type},#{tel},#{qq},#{school_id},#{college_id},#{status},#{createdate},#{operator_id},#{comments})")
	public void insertInstructor(User a);

	@Update("update Activity_user set niki=#{niki},name=#{name},sex=#{sex},type=#{type},tel=#{tel},qq=#{qq},"
			+ "classinfo=#{classinfo},ylevel=#{ylevel},glevel=#{glevel},slevel=#{slevel},school_id=#{school_id},college_id=#{college_id},status=#{status},info=#{info},comments=#{comments} where id=#{id}")
	public void update(User a);

	@Update("update Activity_user set niki=#{niki},name=#{name},sex=#{sex},type=#{type},tel=#{tel},qq=#{qq},"
			+ "school_id=#{school_id},college_id=#{college_id},status=#{status},comments=#{comments} where id=#{id}")
	public void updateInstructor(User a);

	@Update("update Activity_user set name=#{name} ${where}")
	public void updateAll(User a);

	@Delete("delete from Activity_user where id=#{id}")
	public void delete(int id);

	@Delete("delete from Activity_user ${where}")
	public void deleteALL(SearchInfo info);

	@Select("select count(*) from Activity_user u " + "INNER JOIN activity_school s ON s.id = u.school_id "
			+ "INNER JOIN activity_college c ON c.id = u.college_id "
			+ "INNER JOIN activity_operator o ON o.id = u.operator_id " + "${where} ${limit}")
	public int getCount(SearchInfo info);

	@Select("update Activity_user set gstatus=#{gstatus} where id = #{id}")
	public void updateGstatus(User u);

	@Select("update Activity_user set activity_id=#{activity_id} where id = #{id}")
	public void updateA_id(User u);

	@Select("select @@identity")
	public int getid();
	
	
	@Update("update Activity_user set pass=#{pass}  where id=#{id}")
	public int changePass(User a);
}
