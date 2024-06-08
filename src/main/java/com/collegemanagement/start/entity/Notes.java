package com.collegemanagement.start.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Notes {

	@Id
	private int nid ;
	private String nsubjectname;
	private String ntitle;
	private String notesdescription;
	
	
	
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNsubjectname() {
		return nsubjectname;
	}
	public void setNsubjectname(String nsubjectname) {
		this.nsubjectname = nsubjectname;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNotesdescription() {
		return notesdescription;
	}
	public void setNotesdescription(String notesdescription) {
		this.notesdescription = notesdescription;
	}
	@Override
	public String toString() {
		return "Notes [nid=" + nid + ", nsubjectname=" + nsubjectname + ", ntitle=" + ntitle + ", notesdescription="
				+ notesdescription + "]";
	}
	
	
	

	
}
