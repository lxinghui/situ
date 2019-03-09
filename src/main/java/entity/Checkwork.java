package entity;

public class Checkwork {

	public static String[] checkstatus = { "-", "正常", "迟到", "早退", "请假", "未到" };
	public int id;
	public int activity_id;
	public String a_name;
	public int user_id;
	public String u_name;
	public String date;
	public int check1;
	public int check2;
	public int check3;
	public String lastdate;
	public int operator_id;
	public String o_name;
	public String comments;
	private String where;

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getCheck1_Name() {
		return checkstatus[check1];
	}

	public String getCheck2_Name() {
		return checkstatus[check2];
	}

	public String getCheck3_Name() {
		return checkstatus[check3];
	}

	public int getId() {
		return id;
	}

	public int getActivity_id() {
		return activity_id;
	}

	public String getA_name() {
		return a_name;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getU_name() {
		return u_name;
	}

	public String getDate() {
		return date;
	}

	public int getCheck1() {
		return check1;
	}

	public int getCheck2() {
		return check2;
	}

	public int getCheck3() {
		return check3;
	}

	public String getLastdate() {
		return lastdate;
	}

	public int getOperator_id() {
		return operator_id;
	}

	public String getO_name() {
		return o_name;
	}

	public String getComments() {
		return comments;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setCheck1(int check1) {
		this.check1 = check1;
	}

	public void setCheck2(int check2) {
		this.check2 = check2;
	}

	public void setCheck3(int check3) {
		this.check3 = check3;
	}

	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}
