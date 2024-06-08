package com.collegemanagement.start.daoImplementation;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegemanagement.start.daoInterface.Assignmentsdaointerface;
import com.collegemanagement.start.entity.Assignments;
import com.collegemanagement.start.entity.Notes;

@Service
public class Assignmentsdao {

	@Autowired
	private Assignmentsdaointerface adi;
	
	public void asginsert(Assignments asg) {
		adi.save(asg);
	}
	
	public List<Assignments> asgdisplay(){
		return adi.findAll();
	}
	
	public List<Assignments> asgdelete(int id) {
		adi.deleteById(id);
		
		return asgdisplay();
	}
	
//	public List<Assignments> nupdate(int title,Assignments a) {
//		
//		Optional<Assignments> asig=adi.findById(title);
//		Assignments newnote=asig.get();
//		newnote.setAssignment_description(a.getAssignment_description());
//		adi.save(newnote);
//		
//		return asgdisplay();
//	}
	
	public List<Assignments> assignmentedit(int id) {
		List<Assignments> nl=asgdisplay();
		List<Assignments> l=new ArrayList<Assignments>();
		for (Assignments i:nl) {
			if (i.getAid()==id) {
				l.add(i);
			}
		}
		System.out.println(l);
		return l;
	}
	
	public List<Assignments> aupdate(int id,Assignments unote) {
		
		Optional<Assignments> not=adi.findById(id);
		Assignments newnote=not.get();
		newnote.setAssignment_title(unote.getAssignment_title());
		newnote.setAssignment_subjectname(unote.getAssignment_subjectname());
		newnote.setAssignment_description(unote.getAssignment_description());
		adi.save(newnote);

		return asgdisplay();
	}
	
}
