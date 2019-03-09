package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Market;
import utils.SearchInfo;

@Repository("Market_Mapper")
public interface Market_Mapper extends BaicsMapper {
	@Select("select m.*,o.name o_name,a.name a_name from Activity_market m inner join activity_operator o on m.operator_id=o.id inner join activity a on m.activity_id=a.id ${where} ${limit}")
	public List<Market> select(SearchInfo info);

	@Select("select m.*,o.name o_name,a.name a_name from Activity_market m inner join activity_operator o on m.operator_id=o.id inner join activity a on m.activity_id=a.id ${where} ${limit}")
	public Market selectJson(SearchInfo info);

	@Select("select * from Activity_Market where id=#{id}")
	public Market selectById(int id);

	@Insert("insert into Activity_Market(date,operator_id,activity_id,json,comments,info) value(#{date},#{operator_id},#{activity_id},#{json},#{comments},#{info})")
	public void insert(Market a);

	@Update("update Activity_Market set info=#{info},json=#{json},comments=#{comments} where id=#{id}")
	public void update(Market a);

	@Update("update Activity_Market set niki=#{niki},name=#{name},type=#{type},tel=#{tel},power=#{power},status=#{status},comments=#{comments} ${where}")
	public void updateAll(Market a);

	@Delete("delete from Activity_Market where id=#{id}")
	public void delete(int id);

	@Delete("delete from Activity_Market ${where}")
	public void deleteALL(SearchInfo info);

	@Select("select count(*) from Activity_Market ")
	public int getCount();
	@Update("update activity_market set json = #{json} where id = #{id}")
	public void updateJson(Market a);

}
