package com.collegemanagement.start.daoInterface;

import org.springframework.data.jpa.repository.JpaRepository;

import com.collegemanagement.start.entity.Student;

public interface Studentdaointerface extends JpaRepository<Student, Integer>{

}
