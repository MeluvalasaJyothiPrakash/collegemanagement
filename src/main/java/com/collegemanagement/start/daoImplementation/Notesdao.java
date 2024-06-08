package com.collegemanagement.start.daoImplementation;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegemanagement.start.daoInterface.Notesdaointerface;
import com.collegemanagement.start.entity.Notes;

@Service
public class Notesdao {

	@Autowired
	private Notesdaointerface ndi;
	
	public void ninsert(Notes n) {
		ndi.save(n);
	}
	
	public List<Notes> ndisplay(){
		return ndi.findAll();
	}
	
	public List<Notes> ndelete(int id) {
		ndi.deleteById(id);
		return ndisplay();
	}
	

	public List<Notes> notesedit(int id) {
		List<Notes> nl=ndisplay();
		List<Notes> l=new ArrayList<Notes>();
		for (Notes i:nl) {
			if (i.getNid()==id) {
				l.add(i);
			}
		}
		return l;
	}
	
	public List<Notes> nupdate(int id,Notes unote) {
		
		Optional<Notes> not=ndi.findById(id);
		Notes newnote=not.get();
		newnote.setNtitle(unote.getNtitle());
		newnote.setNsubjectname(unote.getNsubjectname());
		newnote.setNotesdescription(unote.getNotesdescription());
		ndi.save(newnote);

		return ndisplay();
	}
	
	
}
