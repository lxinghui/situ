package entity;

public class User {

	public static String[] sexstatus = { "男", "女" }; 
	public static String[] typestatus = { "学生", "辅导员","临时" };
	public static String[] ylevelstatus = { "/","升本", "公务" }; 
	public static String[] glevelstatus = {"/","A", "B", "C", "D", "N", "Y" };
	public static String[] slevelstatus = {"/","未联系", "已联系","预报名","已报名","终结" };
	public static String[] statusstatus = { "正常", "禁止","过期" };
	public int id;
	public int activity_id;
	public String a_name;
	public String niki;
	public String pass;
	public String name;
	public int sex;
	public int type;
	public String tel;
	public String qq;
	public String classinfo;
	public int ylevel;
	public int glevel;
	public int slevel;
	public int school_id;
	public int college_id;
	public int status;
	public String info;
	public String createdate;
	public int operator_id;
	public String comments;
	public String operator_Name;
	public String school_Name;
	public String college_Name;
    public int gstatus;
 
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getGstatus() {
		return gstatus;
	}
	public void setGstatus(int gstatus) {
		this.gstatus = gstatus;
	}
	public String getOperator_Name() {
		return operator_Name;
	}
	public void setOperator_Name(String operator_Name) {
		this.operator_Name = operator_Name;
	}
	public String getSchool_Name() {
		return school_Name;
	}
	public void setSchool_Name(String school_Name) {
		this.school_Name = school_Name;
	}
	public String getCollege_Name() {
		return college_Name;
	}
	public void setCollege_Name(String college_Name) {
		this.college_Name = college_Name;
	}
	public String getSex_Name() {
		return sexstatus[sex];
	}
	public String getType_Name() {
		return typestatus[type];
	}
	public String getYlevel_Name() {
		return ylevelstatus[ylevel];
	}
	public String getGlevel_Name() {
		return glevelstatus[glevel];
	}
	public String getSlevel_Name() {
		return slevelstatus[slevel];
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
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
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getClassinfo() {
		return classinfo;
	}
	public void setClassinfo(String classinfo) {
		this.classinfo = classinfo;
	}
	public int getYlevel() {
		return ylevel;
	}
	public void setYlevel(int ylevel) {
		this.ylevel = ylevel;
	}
	public int getGlevel() {
		return glevel;
	}
	public void setGlevel(int glevel) {
		this.glevel = glevel;
	}
	public int getSlevel() {
		return slevel;
	}
	public void setSlevel(int slevel) {
		this.slevel = slevel;
	}
	public int getSchool_id() {
		return school_id;
	}
	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}
	public int getCollege_id() {
		return college_id;
	}
	public void setCollege_id(int college_id) {
		this.college_id = college_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", niki=" + niki + ", pass=" + pass + ", name=" + name + ", sex=" + sex + ", type="
				+ type + ", tel=" + tel + ", qq=" + qq + ", classinfo=" + classinfo + ", ylevel=" + ylevel + ", glevel="
				+ glevel + ", slevel=" + slevel + ", school_id=" + school_id + ", college_id=" + college_id
				+ ", status=" + status + ", info=" + info + ", createdate=" + createdate + ", operator_id="
				+ operator_id + ", comments=" + comments + ", operator_Name=" + operator_Name + ", school_Name="
				+ school_Name + ", college_Name=" + college_Name + "]";
	}
	
}
