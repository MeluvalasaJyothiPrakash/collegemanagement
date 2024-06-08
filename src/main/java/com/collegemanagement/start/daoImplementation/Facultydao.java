package com.collegemanagement.start.daoImplementation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegemanagement.start.daoInterface.Facultydaointerface;
import com.collegemanagement.start.entity.Faculty;
import com.collegemanagement.start.entity.Student;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

@Service
public class Facultydao {
	
	@Autowired
	private Facultydaointerface fdi;
	
	@PersistenceContext
	private EntityManager em;
	
	public void finsert(Faculty p) {
		
		 fdi.save(p);
	}
	
	public List<Faculty> fdisplay() {
		return fdi.findAll();
	}
	
	
	public boolean login(String mail,String password) {
		List<Faculty> l=fdi.findAll();
		boolean bool=false;
		for(Faculty i:l) {
			if (i.getFmail().equals((String)mail)) {
				if (i.getFpassword().equals(password)) {
					bool=true;
				}	
			}
		}
		return bool;
	}
	
	
	public String getusername(String mail,String password) {
		TypedQuery<String> u=em.createQuery("select f.fname From Faculty f where f.fmail=:mail AND f.fpassword=:password",String.class);
		u.setParameter("mail", mail);
		u.setParameter("password", password);
		
		List<String> res=u.getResultList();
		if(!res.isEmpty()) {
			return res.get(0);
		}
		return null;	
	}
	
	public List<Faculty> findid(String mail) {
		List<Faculty> list=fdisplay();
		List<Faculty> att=new ArrayList<Faculty>();
		for(Faculty f:list) {
			if (f.getFmail().equals((String)mail)) {
				att.add(f);
			}
		}
		return att;
		}
	
	
	//Forgot password
	
	public boolean getpassword(int id,String mail) {
		List<Faculty> l=fdi.findAll();
		boolean bool=false;
		for(Faculty i:l) {
			if(i.getFid()==id) {
				if (i.getFmail().equals((String)mail)) {
						bool=true;
				}
			}
		}
		return bool;
	}
	
	public void updatepassword(int id,String password) {
		Faculty fac=fdi.findById(id).orElse(null);
		
		if(fac!=null) {
			fac.setFpassword(password);
			fdi.save(fac);
		}
	}
	
	//change password
	
	public void changepassword(String o,String password) {
		List<Faculty> l=fdi.findAll();
		for(Faculty i:l) {
			if(i.getFpassword().equals(o)) {
				Faculty fac=fdi.findById(i.getFid()).orElse(null);
				if(fac!=null) {
					fac.setFpassword(password);
					fdi.save(fac);
				}
			}
		}
	}
	
	//update profile 
	
	public void updateprofile(Faculty f) {
		Faculty fac=fdi.findById(f.getFid()).orElse(null);
		if(fac!=null) {
			fac.setFname(f.getFname());
			fac.setFmail(f.getFmail());
			fac.setFphoneno(f.getFphoneno());
			fac.setFdepartment(f.getFdepartment());
			fac.setFaddress(f.getFaddress());
			fdi.save(fac);
		}
	}
	
	
	
}
