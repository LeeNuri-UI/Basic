package com.Basic.Domain;

import java.util.Date;

public class BoCommentVO {
	private int conum;
	private int bnum;
	private String uname;
	private String cocontent;
	private Date codate; 
	private String delyn;
	
	public int getConum() {
		return conum;
	}
	public void setConum(int conum) {
		this.conum = conum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getCocontent() {
		return cocontent;
	}
	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}
	public Date getCodate() {
		return codate;
	}
	public void setCodate(Date codate) {
		this.codate = codate;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
