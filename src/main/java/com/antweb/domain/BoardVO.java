package com.antweb.domain;

import java.util.Date;

public class BoardVO {
	private int bno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private String pwtype;
	private String pw;
	private int bcount;
	private Date regdate;
	private int replycnt;

	public BoardVO() {
		super();
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getPwtype() {
		return pwtype;
	}

	public void setPwtype(String pwtype) {
		this.pwtype = pwtype;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", bwriter=" + bwriter + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", pwtype=" + pwtype + ", pw=" + pw + ", bcount=" + bcount + ", regdate=" + regdate + ", replycnt="
				+ replycnt + "]";
	}

}