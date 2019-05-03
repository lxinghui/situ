package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity;
import utils.SearchInfo;

@Repository("Activity_Mapper")
public interface Activity_Mapper extends BaicsMapper{

	@Select("select a.*,o.name o_name,os.name s_name,oc.name c_name,u.name i_name from Activity a"
			+ " left join Activity_operator o on o.id = a.operator_id "
			+ " left join Activity_operator os on os.id = a.source_operator_id"
			+ " left join Activity_operator oc on oc.id = a.charge_operator_id"
			+ " left join Activity_user u on u.id = a.instructor_user_id"
			+ " ${where} order by a.id desc ${limit}")
	public List<Activity> select(SearchInfo info);
    
    @Select("select a.*,o.name o_name,os.name s_name,oc.name c_name,u.name i_name from Activity a"
			+ " inner join Activity_operator o on o.id = a.operator_id "
			+ " inner join Activity_operator os on os.id = a.source_operator_id"
			+ " left join Activity_operator oc on oc.id = a.charge_operator_id"
			+ " left join Activity_user u on u.id = a.instructor_user_id"
    		+ " where a.id=#{id}")
	public Activity selectById(int id);
    
	@Insert("insert into Activity(ids,courseinfo,planinfo,dateinfo,school,college,name,count,classcount,source_operator_id,instructor_user_id,activity.`option`,attention,type,createdate,operator_id,charge_operator_id,status,comments)"
			+ " value(#{ids},#{courseinfo},#{planinfo},#{dateinfo},#{school},#{college},#{name},#{count},#{classcount},#{source_operator_id},#{instructor_user_id},#{option},#{attention},#{type},#{createdate},#{operator_id},"
			+ "#{charge_operator_id},#{status},#{comments})")
	public void insert(Activity a);
	
	@Update("update Activity set ids=#{ids},courseinfo=#{courseinfo},planinfo=#{planinfo},dateinfo=#{dateinfo},school=#{school},college=#{college},name=#{name},count=#{count},classcount=#{classcount},source_operator_id=#{source_operator_id},"
			+ "instructor_user_id=#{instructor_user_id},activity.`option`=#{option},attention=#{attention},type=#{type},charge_operator_id=#{charge_operator_id},status=#{status},comments=#{comments} "
			+ " where id=#{id}")
	public void update(Activity a);
	
	@Update("update Activity set name=#{name} ${where}")
	public void updateAll(Activity a);
	
	@Update("update Activity set status=#{status} "
			+ " where id=#{id}")
	public void changeStatus(Activity a);
	
	@Delete("delete from Activity where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity a ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity a"
			+ " inner join Activity_operator o on o.id = a.operator_id"
			+ " inner join Activity_operator os on os.id = a.source_operator_id"
			+ " inner join Activity_operator oc on oc.id = a.charge_operator_id"
			+ " left join Activity_user u on u.id = a.instructor_user_id"
			+ " ${where} ${limit}")
	public int getCount(SearchInfo info);
	

	@Select("select @@identity")
	public int getid();
	
	@Select("select id from Activity order by id desc LIMIT 1;")
	public int getLastid();
}
