package com.collegemanagement.start.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Complaints {

	@Id
	private int fid;
	private String fname;
	private String category;
	private String complaints;
	
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	

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

	public String getComplaints() {
		return complaints;
	}

	public void setComplaints(String complaints) {
		this.complaints = complaints;
	}

	@Override
	public String toString() {
		return "Complaints [fid=" + fid + ", fname=" + fname + ", category=" + category + ", complaints=" + complaints
				+ "]";
	}


	
	
}
