package entity;

public class Report {

	public int id;
	public int activity_id;
	public String a_name;
	public int operator_id;
	public String o_name;
	public String date;
	public String tprogress;
	public String sprogress;
	public String cprogress;
	public String json="";
	public String comments;
	
	public String getA_name() {
		return a_name;
	}
	public String getO_name() {
		return o_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public int getId() {
		return id;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public String getDate() {
		return date;
	}
	public String getTprogress() {
		return tprogress;
	}
	public String getSprogress() {
		return sprogress;
	}
	public String getCprogress() {
		return cprogress;
	}
	public String getJson() {
		return json;
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
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setTprogress(String tprogress) {
		this.tprogress = tprogress;
	}
	public void setSprogress(String sprogress) {
		this.sprogress = sprogress;
	}
	public void setCprogress(String cprogress) {
		this.cprogress = cprogress;
	}
	public void setJson(String json) {
		this.json = json;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
