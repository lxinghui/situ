package entity;

public class Usergroup {

	public int id;
	public int activity_id;
	public String a_name;
	public String name;
	public String ids;
	public String project;
	public String path;
	public Integer point1;
	public Integer point2;
	public Integer point3;
	public Integer point4;
	public Integer point5;
	public Integer point6;
	public Integer point7;
	public Integer point8;
	public Integer point9;
	public Integer point10;
	public String createdate;
	public int operator_id;
	public String o_name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String comments;

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public int getId() {
		return id;
	}

	public int getActivity_id() {
		return activity_id;
	}

	public String getIds() {
		return ids;
	}

	public String getProject() {
		return project;
	}

	public String getPath() {
		return path;
	}

	public int getPoint1() {
		if(point1==null) {
			return 0;
		}
		return point1;
	}

	public int getPoint2() {
		if(point2==null) {
			return 0;
		}
		return point2;
	}

	public int getPoint3() {
		if(point3==null) {
			return 0;
		}
		return point3;
	}

	public int getPoint4() {
		if(point4==null) {
			return 0;
		}
		return point4;
	}

	public int getPoint5() {
		if(point5==null) {
			return 0;
		}
		return point5;
	}

	public int getPoint6() {
		if(point6==null) {
			return 0;
		}
		return point6;
	}

	public int getPoint7() {
		if(point7==null) {
			return 0;
		}
		return point7;
	}

	public int getPoint8() {
		if(point8==null) {
			return 0;
		}
		return point8;
	}

	public int getPoint9() {
		if(point9==null) {
			return 0;
		}
		return point9;
	}

	public int getPoint10() {
		if(point10==null) {
			return 0;
		}
		return point10;
	}

	public String getCreatedate() {
		return createdate;
	}

	public int getOperator_id() {
		return operator_id;
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

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setPoint1(Integer point1) {
		
		this.point1 = point1;
	}

	public void setPoint2(Integer point2) {
		this.point2 = point2;
	}

	public void setPoint3(Integer point3) {
		this.point3 = point3;
	}

	public void setPoint4(Integer point4) {
		this.point4 = point4;
	}

	public void setPoint5(Integer point5) {
		this.point5 = point5;
	}

	public void setPoint6(Integer point6) {
		this.point6 = point6;
	}

	public void setPoint7(int point7) {
		this.point7 = point7;
	}

	public void setPoint8(int point8) {
		this.point8 = point8;
	}

	public void setPoint9(int point9) {
		this.point9 = point9;
	}

	public void setPoint10(int point10) {
		this.point10 = point10;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}
