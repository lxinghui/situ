package utils;

import com.alibaba.fastjson.JSONArray;

public  class JsonInfo{
	int status;
	String text;
	 JSONArray listJSON;
	
	public JsonInfo(int status, String text) {
		super();
		this.status = status;
		this.text = text;
	}
	public JsonInfo(int status, JSONArray json) {
		this.status = status;
		this.listJSON = json;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public JSONArray getListJSON() {
		return listJSON;
	}
	public void setListJSON(JSONArray listJSON) {
		this.listJSON = listJSON;
	}
}