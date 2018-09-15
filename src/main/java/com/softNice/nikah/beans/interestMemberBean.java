package com.softNice.nikah.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

public class interestMemberBean {
	
	private int id;
	private int fromMemberId;
	private int toMemberId;
	private Date requestDate;
	private int acceptFlag;   // 0 = request 1 = accept 2 = reject
	private boolean status;
	
	private memberBean member;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFromMemberId() {
		return fromMemberId;
	}
	public void setFromMemberId(int fromMemberId) {
		this.fromMemberId = fromMemberId;
	}
	public int getToMemberId() {
		return toMemberId;
	}
	public void setToMemberId(int toMemberId) {
		this.toMemberId = toMemberId;
	}
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public int getAcceptFlag() {
		return acceptFlag;
	}
	public void setAcceptFlag(int acceptFlag) {
		this.acceptFlag = acceptFlag;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public memberBean getMember() {
		return member;
	}
	public void setMember(memberBean member) {
		this.member = member;
	}
	
	
	
	
	
	

}
