package com.collegemanagement.start.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Student {

	@Id
	private int sid;
	private String sname;
	private String smail;
	private String spassword;
	private long sphoneno;
	private String sdob;
	private String sgender;
	private String sfathername;
	private String smothername;
	private String saddress;

	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSmail() {
		return smail;
	}
	public void setSmail(String smail) {
		this.smail = smail;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public long getSphoneno() {
		return sphoneno;
	}
	public void setSphoneno(long sphoneno) {
		this.sphoneno = sphoneno;
	}
	public String getSdob() {
		return sdob;
	}
	public void setSdob(String sdob) {
		this.sdob = sdob;
	}
	public String getSgender() {
		return sgender;
	}
	public void setSgender(String sgender) {
		this.sgender = sgender;
	}
	public String getSfathername() {
		return sfathername;
	}
	public void setSfathername(String sfathername) {
		this.sfathername = sfathername;
	}
	public String getSmothername() {
		return smothername;
	}
	public void setSmothername(String smothername) {
		this.smothername = smothername;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", smail=" + smail + ", spassword=" + spassword
				+ ", sphoneno=" + sphoneno + ", sdob=" + sdob + ", sgender=" + sgender + ", sfathername=" + sfathername
				+ ", smothername=" + smothername + ", saddress=" + saddress + "]";
	}

	
	
}
