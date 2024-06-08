package com.collegemanagement.start.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.collegemanagement.start.daoImplementation.Facultydao;
import com.collegemanagement.start.daoImplementation.Studentdao;
import com.collegemanagement.start.daoInterface.Studentdaointerface;
import com.collegemanagement.start.entity.Faculty;
import com.collegemanagement.start.entity.Student;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Studentcontroller {

	@Autowired
	private Studentdao sd;
	
	@Autowired
	private Facultydao fd;
	
	//Student after clicking StudentLogin button from Login page
	
	@RequestMapping("/StudentLogin")
	public ModelAndView add(Model m) {
		return  new ModelAndView("StudentLogin");
	}
	
	//Student Forgot Password page
	
	@RequestMapping("/studentforgotpassword")
	public ModelAndView studentpassword(Model m) {
		return  new ModelAndView("StudentForgotPassword");
	}
	
	//Redirecting to Student Registration page 
	
	@RequestMapping("/StudentRegister")
	public ModelAndView studentregister(Model m) {
		return  new ModelAndView("StudentRegister");
	}
	
	//Student Registering to database
	
	@RequestMapping("/studentregistered")
	public ModelAndView facultyreg(@ModelAttribute("studentreg") Student s,Model m) {
		sd.sinsert(s);
		return  new ModelAndView("StudentLogin");
	}
	
	
	//Student viewing faculties list from Student DashBoard
	
	@RequestMapping("/displayfacultieslist")
	public ModelAndView viewfaculties(Model m) {
		List<Faculty> list=fd.fdisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("StudentviewFaculties");
	}
	
	//Student viewing Students list from Student DashBoard
	
	@RequestMapping("/displaystudentslist")
	public ModelAndView viewstudents(Model m) {
		List<Student> list=sd.sdisplay();
		m.addAttribute("list", list);
		
		return  new ModelAndView("StudentviewStudents");
	}
	
	
	//Login 
	//=================================================================================
	
	@RequestMapping("/studentlogin")
	public ModelAndView studentlogin(@RequestParam("smail") String mail,@RequestParam("spassword") String password,Model m,HttpServletRequest request) {
		
		if (sd.login(mail, password)) {
			String username=sd.getusername(mail, password);
			
			HttpSession ses=request.getSession();
			List<Student> detail=sd.findsid(mail);
			ses.setAttribute("details", detail);
			ses.setAttribute("username", username);
			return  new ModelAndView("Studentheader");
		}
		else {
			m.addAttribute("error", "Invalid username/password");
		return  new ModelAndView("StudentloginError");
		}
	}
	
	//Forgot Password
	
	@RequestMapping("/studentgetpassword")
	public ModelAndView studentgetpassword(@RequestParam("sid") int id,@RequestParam("smail") String mail,@RequestParam("sdob") String dob,Model m) {
		
		if (sd.getpassword(id,mail, dob)) {

			return  new ModelAndView("StudentresetPassword");
		}
		else {
			m.addAttribute("error", "Invalid username/password");
		return  new ModelAndView("StudentForgotPasswordError");
		}
	}
	
	@RequestMapping("/studentsettingpassword")
	public ModelAndView studentsetpassword(@RequestParam("sid") int id,@RequestParam("spassword") String password,Model m) {
		
		sd.updatepassword(id,password);
		return  new ModelAndView("StudentLogin");
		
	}
	
	//Change Password
	
	@RequestMapping("/studentchangepassword")
	public ModelAndView studentchangepassword() {
			return  new ModelAndView("StudentupdatePassword");
		
	}
	
	@RequestMapping("/studentupdatepassword")
	public ModelAndView updatepassword(@RequestParam("oldpassword") String oldpassword,@RequestParam("newPassword") String password,Model m) {
		
		sd.changepassword(oldpassword,password);
		return  new ModelAndView("Studentheader");
		
	}
	
	//Update Profile
	
	@RequestMapping("/studentupdateprofile")
	public ModelAndView facultyupdate() {
			return  new ModelAndView("StudentupdateProfile");
		
	}
	
	@RequestMapping("/updatedstudentetails")
	public ModelAndView updatestudentprofile(@ModelAttribute("studentupdate") Student s,Model m) {
		sd.updatestudentprofile(s);
		return  new ModelAndView("Studentheader");
		
	}
	
	
	
}
