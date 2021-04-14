package com.Basic.Domain;

import java.util.Date;

public class BoardVO {
	private int bnum;
	private int unum;
	private String uname;
	private String sub;
	private String content;
	private String cate01;
	private String cate02;
	private int viewcount;
	private Date writedate;
	private String file;
	private String delyn;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCate01() {
		return cate01;
	}
	public void setCate01(String cate01) {
		this.cate01 = cate01;
	}
	public String getCate02() {
		return cate02;
	}
	public void setCate02(String cate02) {
		this.cate02 = cate02;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
