package com.collegemanagement.start.daoInterface;

import org.springframework.data.jpa.repository.JpaRepository;

import com.collegemanagement.start.entity.Complaints;

public interface Complaintsdaointerface extends JpaRepository<Complaints, Integer>{

}
