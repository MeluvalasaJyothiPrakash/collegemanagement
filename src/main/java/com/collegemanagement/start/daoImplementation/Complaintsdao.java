package com.collegemanagement.start.daoImplementation;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegemanagement.start.daoInterface.Complaintsdaointerface;
import com.collegemanagement.start.entity.Complaints;

@Service
public class Complaintsdao {

	@Autowired
	private Complaintsdaointerface cdi;
	
	public void cinsert(Complaints c) {
		cdi.save(c);
	}
	
	public List<Complaints> cdisplay(){
		
		return cdi.findAll();
	}
	
	public List<Complaints> cdelete(int id) {
		cdi.deleteById(id);
		
		return cdisplay();
	}
	
	public List<Complaints> cupdate(int id,Complaints complaint) {
		
		Optional<Complaints> not=cdi.findById(id);
		Complaints newnote=not.get();
		newnote.setComplaints(complaint.getComplaints());
		cdi.save(newnote);
		
		return cdisplay();
	}
	
}
