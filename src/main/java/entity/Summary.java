package entity;

import java.io.Serializable;


public class Summary implements Serializable{
		
	private int id;
	private int operator_id;
	private int activity_id;
	private String comments;
	private String o_name;
	private String a_name;
	private String createdate;
	private String option;
	private int sstatus;//学生状况
	private int tstatus;//课程状况
	private int cstatus;//市场状况
	private int xstatus;//学校状况
	private String summary;
	private String proposal;//建议
	public static String [] sstatues= {"-","A","B","C"};
	public static String [] tstatues= {"-","A","B","C"};
	public static String [] cstatues= {"-","A","B","C"};
	public static String [] xstatues= {"-","A","B","C"};

	public String[] getOption_status() {
		return option.split("");
	}	
	public String getSstatus_name() {
		return sstatues[sstatus];
	}
	public String getTstatus_name() {
		return tstatues[tstatus];
	}
	public String getCstatus_name() {
		return cstatues[cstatus];
	}
	public String getXstatus_name() {
		return xstatues[xstatus];
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getSstatus() {
		return sstatus;
	}
	public void setSstatus(int sstatus) {
		this.sstatus = sstatus;
	}
	public int getTstatus() {
		return tstatus;
	}
	public void setTstatus(int tstatus) {
		this.tstatus = tstatus;
	}
	public int getCstatus() {
		return cstatus;
	}
	public void setCstatus(int cstatus) {
		this.cstatus = cstatus;
	}
	public int getXstatus() {
		return xstatus;
	}
	public void setXstatus(int xstatus) {
		this.xstatus = xstatus;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getProposal() {
		return proposal;
	}
	public void setProposal(String proposal) {
		this.proposal = proposal;
	}
	
	
	
	

}
