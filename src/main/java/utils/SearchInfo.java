package utils;

public class SearchInfo {
	private int page = 1;
	public int size;
	public int pageno;
	int max = 10;
	String limit=" limit " + (page - 1) * max + "," + max;
	public SearchInfo(String where,boolean canpage) {
		this.where = where;
		setCanPage(canpage);
	}
	public String getLimit() {
		return limit;
	}
	public SearchInfo() {
		super();
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}

	public void setCanPage(boolean iscan) {
		if(!iscan) limit="";
	}
	public int getPageno() {
		return pageno;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public void setPage(int page) {
	    this.page = page;
	}
	public int getPage() {
	    return page;
	}

   
	String where="";
	String txt="";

	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		
		if(txt==null||txt=="") {
			where=" where status=0 ";
		}else {
			this.txt = txt;
			where=" where fullname like '%"+txt+"%' ";
		}
	}
	
	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public Integer getNext() {
		return page+1;
	}
	
	public Integer getPrev() {
		return page>1?page-1:1;
	}

	public Integer getLast_pageno() {
		if(size%max == 0) {
			return size/max;	
		} else {
			return size/max+1;
		}
		
	}
	
	
}

