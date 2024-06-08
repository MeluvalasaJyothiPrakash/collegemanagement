package com.collegemanagement.start.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Faculty {

	@Id
	private int fid;
	private String fname;
	private String fmail;
	private String fpassword;
	private long fphoneno;
	private String fdepartment;
	private String fgender;
	private String faddress;

	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFmail() {
		return fmail;
	}
	public void setFmail(String fmail) {
		this.fmail = fmail;
	}
	public String getFpassword() {
		return fpassword;
	}
	public void setFpassword(String fpassword) {
		this.fpassword = fpassword;
	}
	public long getFphoneno() {
		return fphoneno;
	}
	public void setFphoneno(long fphoneno) {
		this.fphoneno = fphoneno;
	}
	public String getFdepartment() {
		return fdepartment;
	}
	public void setFdepartment(String fdepartment) {
		this.fdepartment = fdepartment;
	}
	public String getFgender() {
		return fgender;
	}
	public void setFgender(String fgender) {
		this.fgender = fgender;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	@Override
	public String toString() {
		return "Faculty [fid=" + fid + ", fname=" + fname + ", fmail=" + fmail + ", fpassword=" + fpassword
				+ ", fphoneno=" + fphoneno + ", fdepartment=" + fdepartment + ", fgender=" + fgender + ", faddress="
				+ faddress + "]";
	}
	
	
	
}
