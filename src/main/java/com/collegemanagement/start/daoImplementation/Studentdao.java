package com.collegemanagement.start.daoImplementation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegemanagement.start.daoInterface.Studentdaointerface;
import com.collegemanagement.start.entity.Faculty;
import com.collegemanagement.start.entity.Student;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

@Service
public class Studentdao {

	@Autowired
	private Studentdaointerface sdi;
	
	@PersistenceContext
	private EntityManager em;
	
	public void sinsert(Student s) {
		sdi.save(s);
	}
	
	public List<Student> sdisplay(){
		return sdi.findAll();
	}
	
	// Login
	
	public boolean login(String mail,String password) {
		List<Student> l=sdi.findAll();
		boolean bool=false;
		for(Student i:l) {
			if (i.getSmail().equals(mail)) {
				if (i.getSpassword().equals(password)) {
					bool=true;
				}	
			}
		}
		return bool;
	}
	
	
	public String getusername(String mail,String password) {
		TypedQuery<String> u=em.createQuery("select s.sname From Student s where s.smail=:mail AND s.spassword=:password",String.class);
		u.setParameter("mail", mail);
		u.setParameter("password", password);
		
		List<String> res=u.getResultList();
		if(!res.isEmpty()) {
			return res.get(0);
		}
		return null;
		
	}
	
	//Forgot Password
	
	public boolean getpassword(int id,String mail,String password) {
		List<Student> l=sdi.findAll();
		boolean bool=false;
		for(Student i:l) {
			if(i.getSid()==id) {
				if (i.getSmail().equals(mail)) {
					if (i.getSdob().equals(password)) {
						bool=true;
					}	
				}
			}
		}
		return bool;
	}
	
	public void updatepassword(int id,String password) {
		Student std=sdi.findById(id).orElse(null);
		
		if(std!=null) {
			std.setSpassword(password);
			sdi.save(std);
		}
	}
	
	
	//user change password
	
	public void changepassword(String o,String password) {
		List<Student> l=sdi.findAll();
		for(Student i:l) {
			if(i.getSpassword().equals(o)) {
				Student std=sdi.findById(i.getSid()).orElse(null);
				if(std!=null) {
					std.setSpassword(password);
					sdi.save(std);
				}
			}
		}
	}
	
	//update

	
	public List<Student> findsid(String mail) {
		List<Student> list=sdisplay();
		List<Student> att=new ArrayList<Student>();
		for(Student s:list) {
			if (s.getSmail().equals((String)mail)) {
				att.add(s);
			}
		}
		return att;
		}
	
	public void updatestudentprofile(Student s) {
		Student fac=sdi.findById(s.getSid()).orElse(null);
		if(fac!=null) {
			fac.setSname(s.getSname());
			fac.setSmail(s.getSmail());
			fac.setSphoneno(s.getSphoneno());
			fac.setSdob(s.getSdob());
			fac.setSfathername(s.getSfathername());
			fac.setSmothername(s.getSmothername());
			fac.setSaddress(s.getSaddress());
			sdi.save(fac);
		}
	}
	
}
