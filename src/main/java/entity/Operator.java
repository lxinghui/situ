package entity;

public class Operator {

	public static String[] typestatus = { "讲师", "其他"};
	public static String[] powerstatus = { "操作员", "管理员"};
	public static String[] statusstatus = { "在职", "离职"};
	public int id;
	public String niki;
	public String pass;
	public String name;
	public int power;
	public int type;
	public String tel;
	public int status;
	public String comments;
	public String getType_Name() {
		return typestatus[type];
	}
	public String getPower_Name() {
		return powerstatus[power];
	}
	public String getStatus_Name() {
		return statusstatus[status];
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNiki() {
		return niki;
	}
	public void setNiki(String niki) {
		this.niki = niki;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
}
