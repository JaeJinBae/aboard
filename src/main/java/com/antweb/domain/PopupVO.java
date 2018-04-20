package com.antweb.domain;

import java.util.Date;

public class PopupVO {
	private int pno;
	private String title;
	private String content;
	private String width;
	private String height;
	private String positiontop;
	private String positionleft;
	private Date startdate;
	private Date enddate;

	public PopupVO() {
		super();
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getPositiontop() {
		return positiontop;
	}

	public void setPositiontop(String positiontop) {
		this.positiontop = positiontop;
	}

	public String getPositionleft() {
		return positionleft;
	}

	public void setPositionleft(String positionleft) {
		this.positionleft = positionleft;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	@Override
	public String toString() {
		return "PopupVO [pno=" + pno + ", title=" + title + ", content=" + content + ", width=" + width + ", height="
				+ height + ", positiontop=" + positiontop + ", positionleft=" + positionleft + ", startdate="
				+ startdate + ", enddate=" + enddate + "]";
	}

}
