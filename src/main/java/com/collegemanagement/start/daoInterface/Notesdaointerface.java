package com.collegemanagement.start.daoInterface;

import org.springframework.data.jpa.repository.JpaRepository;

import com.collegemanagement.start.entity.Notes;

public interface Notesdaointerface extends JpaRepository<Notes, Integer>{

}
