package entity;

import java.io.Serializable;

public class Activity implements Serializable{
	
	public static String[] statusstatus = { "正常", "取消","已结束"};
	public static String[] typestatus = { "实训", "宣讲","比赛"};
	public static String[] facility = { "投影", "话筒","插排"};
	public int id;
	public String ids;
	public String courseinfo;
	public String  planinfo;
	public String dateinfo;
	public String school;
	public String college;
	public String name;
	public int count;
	public int classcount; 
	public int source_operator_id;
	public String s_name;  
	public String option;
	public String attention;
	public int type;
	public int instructor_user_id;
	public String i_name;
	public String createdate;
	public int  operator_id;
	public String o_name;
	public int charge_operator_id;
	public String c_name;
	public int status;
	public String comments;
	public String[] getDate() {
		return dateinfo.split("-");
	}
	
	public String getRoominfo() {
		return school+college;
	}
	public String[] getOption_status() {
		return option.split("");
	}
	public String getStatus_Name() {
		return statusstatus[status];
	}
	public String getType_Name() {
		return typestatus[type];
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getCourseinfo() {
		return courseinfo;
	}
	public void setCourseinfo(String courseinfo) {
		this.courseinfo = courseinfo;
	}
	public String getPlaninfo() {
		return planinfo;
	}
	public void setPlaninfo(String planinfo) {
		this.planinfo = planinfo;
	}
	public String getDateinfo() {
		return dateinfo;
	}
	public void setDateinfo(String dateinfo) {
		this.dateinfo = dateinfo;
	}

	public String getSchool() {
		return school;
	}
	public String getCollege() {
		return college;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getClasscount() {
		return classcount;
	}
	public void setClasscount(int classcount) {
		this.classcount = classcount;
	}
	public int getSource_operator_id() {
		return source_operator_id;
	}
	public void setSource_operator_id(int source_operator_id) {
		this.source_operator_id = source_operator_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String  getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getAttention() {
		return attention;
	}
	public void setAttention(String attention) {
		this.attention = attention;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getInstructor_user_id() {
		return instructor_user_id;
	}
	public void setInstructor_user_id(int instructor_user_id) {
		this.instructor_user_id = instructor_user_id;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public int getCharge_operator_id() {
		return charge_operator_id;
	}
	public void setCharge_operator_id(int charge_operator_id) {
		this.charge_operator_id = charge_operator_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	/*
	 * 检查是否已结束
	 */
	public boolean check_status() {
		if(this.status !=2) {
			return true;
		}
		return false;
	}
}
