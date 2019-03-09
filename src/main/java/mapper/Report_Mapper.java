package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import entity.Report;
import utils.SearchInfo;

@Repository("Report_Mapper")
public interface Report_Mapper extends BaicsMapper {
	@Select("select r.*,o.name o_name,a.name a_name from Activity_report r inner join activity_operator o on r.operator_id=o.id inner join activity a on r.activity_id=a.id ${where} ${limit}")
	public List<Report> select(SearchInfo info);

	@Select("select r.*,o.name o_name,a.name a_name from Activity_report r inner join activity_operator o on r.operator_id=o.id inner join activity a on r.activity_id=a.id ${where} ${limit}")
	public Report selectJson(SearchInfo info);

	@Select("select * from Activity_report where id=#{id}")
	public Report selectById(int id);

	@Insert("insert into Activity_report(date,operator_id,activity_id,tprogress,sprogress,cprogress,json,comments) value(#{date},#{operator_id},#{activity_id},#{tprogress},#{sprogress},#{cprogress},#{json},#{comments})")
	public void insert(Report a);

	@Update("update Activity_report set tprogress=#{tprogress},sprogress=#{sprogress},cprogress=#{cprogress},json=#{json},comments=#{comments} where id=#{id}")
	public void update(Report a);


	@Delete("delete from Activity_report where id=#{id}")
	public void delete(int id);

	@Delete("delete from Activity_report ${where}")
	public void deleteALL(SearchInfo info);

	@Select("select count(*) from Activity_Market ")
	public int getCount();
	@Update("update Activity_report set json = #{json} where id = #{id}")
	public void updateJson(Report a);

}
