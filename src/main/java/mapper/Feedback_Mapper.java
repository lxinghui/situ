package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Feedback;
import utils.SearchInfo;

@Repository("Feedback_Mapper")
public interface Feedback_Mapper extends BaicsMapper{

    @Select("select f .*,a.name a_name,u.name u_name FROM activity_feedback f \r\n" + 
    		"INNER JOIN activity a on a.id = f.activity_id \r\n" + 
    		"INNER JOIN activity_user u ON u.id = f.user_id ${where} ${limit}")
	public List<Feedback> select(SearchInfo info);
    
    @Select("select * from activity_feedback where id=#{id}")
	public Feedback selectById(int id);
    
	@Insert("insert into activity_feedback(activity_id,user_id,date,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,result,status) value(#{activity_id},#{user_id},#{opt1},#{opt2},#{opt3},#{opt4},#{opt5},#{opt6},#{opt7},#{opt8},#{opt9},#{opt10},#{text1},#{text2},#{text3},#{text4},#{text5},#{text6},#{text7},#{text8},#{text9},#{text10},#{result},#{status})")
	public void insert(Feedback t);
	
	@Insert("insert into activity_feedback(activity_id,user_id,date) value(#{activity_id},#{user_id},#{date})")
	public void first_insert(Feedback t);
	
	
	@Update("update activity_feedback set opt1=#{opt1},opt2=#{opt2},opt3=#{opt3},opt4=#{opt4},opt5=#{opt5},opt6=#{opt6},opt7=#{opt7},opt8=#{opt8},opt9=#{opt9},opt10=#{opt10},text1=#{text1},text2=#{text2} where id=#{id}")
	public void update(Feedback t);
	
	@Update("update activity_feedback set activity_id=#{activity_id},user_id=#{user_id},date=#{date},opt1=#{opt1},opt2=#{opt2},opt3=#{opt3},opt4=#{opt4},opt5=#{opt5},opt6=#{opt6},opt7=#{opt7},opt8=#{opt8},opt9=#{opt9},opt10=#{opt10},text1=#{text1},text2=#{text2},text3=#{text3},text4=#{text4},text5=#{text5},text6=#{text6},text7=#{text7},text8=#{text8,opt9=#{opt9},opt10=#{opt10},result=#{result},status=#{status}  ${where}")
	public void updateAll(Feedback t);
	
	@Delete("delete from activity_feedback where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from activity_feedback ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from activity_feedback ")
	public int getCount();
	
	@Update("update activity_feedback set status=#{status} where id=#{id}")
	public void updateStatus(Feedback t);

	@Update("update activity_feedback set result=#{result} where id=#{id}")
	public void updateresult(Feedback t);

}
