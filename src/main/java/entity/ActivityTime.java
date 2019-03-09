package entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ActivityTime {

	public String[] statusstatus = { "暂定", "明确" };
	public int id;
	public int activity_id;
	public String a_name;
	public String date;
	public String time1;
	public String time2;
	public String time3;
	public String time4;
	public String time5;
	public String time6;
	public String roominfo;
	public int operator_id;
	public String o_name;
	public int status;
	public String comments;

	public String getTimeinfo() throws ParseException {
		String str = "";
		String str1 = "";
		String str2 = "";
		String str3 = "";
		String str4 = "";
		String str5 = "";
		String str6 = "";
		//SimpleDateFormat sdf = new SimpleDateFormat("hhmm");
		if (time1 != null&&time1!="") {
			//Date date1 = sdf.parse(time1);
			str1 = "上午" + time1 + " ";
		}
		if (time2 != null&&time2!="") {
		//	Date date2 = sdf.parse(time2);
			str2 = "上午" + time2 + " ";
		}
		if (time3 != null&&time3!="") {
		//	Date date3 = sdf.parse(time3);
			str3 = "上午" + time3 + " ";
		}
		if (time4 != null&&time4!="") {
		//	Date date4 = sdf.parse(time4);
			str4 = "下午" + time4 + " ";
		}
		if (time5 != null&&time5!="") {
		//	Date date5 = sdf.parse(time5);
			str5 = "下午" + time5 + " ";
		}
		if (time6 != null&&time6!="") {
		//	Date date6 = sdf.parse(time6);
			str6 = "下午" + time6 + " ";
		}
		str=str1+str2+str3+str4+str5+str6;
		return str;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public String getTime3() {
		return time3;
	}

	public void setTime3(String time3) {
		this.time3 = time3;
	}

	public String getTime4() {
		return time4;
	}

	public void setTime4(String time4) {
		this.time4 = time4;
	}

	public String getTime5() {
		return time5;
	}

	public void setTime5(String time5) {
		this.time5 = time5;
	}

	public String getTime6() {
		return time6;
	}

	public void setTime6(String time6) {
		this.time6 = time6;
	}

	public String getRoominfo() {
		return roominfo;
	}

	public void setRoominfo(String roominfo) {
		this.roominfo = roominfo;
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
