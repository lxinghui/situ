package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Checkwork;
import utils.SearchInfo;

@Repository("Checkwork_Mapper")
public interface Checkwork_Mapper extends BaicsMapper{

    @Select("SELECT c.*,a.name a_name,u.name u_name,o.name o_name FROM activity_checkwork c\r\n" + 
    		"INNER JOIN activity a ON a.id = c.activity_id\r\n" + 
    		"INNER JOIN activity_user u ON u.id = c.user_id\r\n" + 
    		"INNER JOIN activity_operator o ON o.id = c.operator_id ${where} ${limit}")
	public List<Checkwork> select(SearchInfo info);
    
    @Select("select * from activity_Checkwork where id=#{id}")
	public Checkwork selectById(int id);
    
	@Insert("insert into activity_Checkwork(activity_id,user_id,date,check1,check2,check3,lastdate,operator_id,comments) value(#{activity_id},#{user_id},#{date},#{check1},#{check2},#{check3},#{lastdate},#{operator_id},#{comments})")
	public void insert(Checkwork t);
	
	@Update("update activity_Checkwork set check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},comments=#{comments}  where id=#{id}")
	public void update(Checkwork t);
	
	@Update("update activity_Checkwork set check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},operator_id=#{operator_id},comments=#{comments} ${where}")
	public void updateAll(Checkwork t);
	 
	@Delete("delete from activity_Checkwork where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_Checkwork ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from activity_Checkwork ")
	public int getCount();

	
}
