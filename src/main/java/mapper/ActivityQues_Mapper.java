package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.ActivityQuestion;
import utils.SearchInfo;

@Repository("ActivityQues_Mapper")
public interface ActivityQues_Mapper extends BaicsMapper{

	@Select("select q.*,a.name a_name from Activity_question q "
			+ "inner join Activity a on q.activity_id = a.id "
			+ "${where} ${limit}")
	public List<ActivityQuestion> select(SearchInfo info);
    
    @Select("select q.*,a.name a_name from Activity_question q "
			+ "inner join Activity a on q.activity_id = a.id "
    		+ "where q.id=#{id}")
	public ActivityQuestion selectById(int id);
    
	@Insert("insert into Activity_question(activity_id,ques1,ques2,ques3,ques4,ques5,ques6,ques7,"
			+ "text1,text2,text3,text4,text5,text6,text7,"
			+ "option1,option2,option3,option4,option5,option6,option7)"
			+ " value(#{activity_id},#{ques1},#{ques2},#{ques3},#{ques4},#{ques5},#{ques6},#{ques7},"
			+ "#{text1},#{text2},#{text3},#{text4},#{text5},#{text6},#{text7})")
	public void insert(ActivityQuestion a);
	
	@Update("update Activity_question set activity_id=#{activity_id},ques1=#{ques1},ques2=#{ques2},ques3=#{ques4},ques5=#{ques5},ques6=#{ques6},ques7=#{ques7},"
			+ "text1=#{text1},text2=#{text2},text3=#{text3},text4=#{text4},text5=#{text5},text6=#{text6},text7=#{text7},"
			+ "option1=#{option1},option2=#{option2},option3=#{option3},option4=#{option4},option5=#{option5},option6=#{option6},option7=#{option7} "
			+ " where id=#{id}")
	public void update(ActivityQuestion a);
	
	@Update("update Activity_question set activity_id=#{activity_id},date=#{date},question1=#{question1},question2=#{question2},question3=#{question3},question4=#{question4},question5=#{question5},question6=#{question6},"
			+ "roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments} "
			+ " ${where}")
	public void updateAll(ActivityQuestion a);
	
	@Delete("delete from Activity_question where id=#{id}")
	public void delete(int id); 
	
	@Delete("delete from Activity_question ${where}")
	public void deleteALL(SearchInfo info); 
	
	@Select("select count(*) from Activity_question ")
	public int getCount();
}
