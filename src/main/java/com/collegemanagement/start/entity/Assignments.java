package com.collegemanagement.start.entity;

import org.hibernate.type.descriptor.jdbc.VarcharJdbcType;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Assignments {
	
	@Id
	private int aid;
	private String assignment_title;
	private String assignment_subjectname;
	private String assignment_description;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAssignment_title() {
		return assignment_title;
	}
	public void setAssignment_title(String assignment_title) {
		this.assignment_title = assignment_title;
	}
	public String getAssignment_subjectname() {
		return assignment_subjectname;
	}
	public void setAssignment_subjectname(String assignment_subjectname) {
		this.assignment_subjectname = assignment_subjectname;
	}
	public String getAssignment_description() {
		return assignment_description;
	}
	public void setAssignment_description(String assignment_description) {
		this.assignment_description = assignment_description;
	}
	@Override
	public String toString() {
		return "Assignments [aid=" + aid + ", assignment_title=" + assignment_title + ", assignment_subjectname="
				+ assignment_subjectname + ", assignment_description=" + assignment_description + "]";
	}
	
	

	
	
}
