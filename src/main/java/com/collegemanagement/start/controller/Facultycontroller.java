package com.collegemanagement.start.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.collegemanagement.start.daoImplementation.Facultydao;
import com.collegemanagement.start.daoImplementation.Studentdao;
import com.collegemanagement.start.entity.Complaints;
import com.collegemanagement.start.entity.Faculty;
import com.collegemanagement.start.entity.Student;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@CrossOrigin(origins="http://localhost:8999")
public class Facultycontroller {

	@Autowired
	private Facultydao fd;
	
	@Autowired
	private Studentdao sd;
	
	//Home page 
	
	@GetMapping("/")
	public String index1(Model m) {
		
		return ("Login");
	}
	
	
	// Faculty Login view page 
	@RequestMapping("/FacultyLogin")
	public String facultulogin(Model m) {
		return  ("FacultyLogin");
	}
	
	
	@RequestMapping("/facultyforgotpassword")
	public ModelAndView facultypassword(Model m) {
		return  new ModelAndView("FacultyForgotPassword");
	}
	
	
	@GetMapping("/FacultyRegister")
	public String facultyregister(Model m) {
		return  ("FacultyRegister");
	}
	
	@PostMapping("/facultyregistered")
	public String facultyreg(@ModelAttribute("facultyreg") Faculty f,Model m) {
		fd.finsert(f);
		return  ("FacultyLogin");
	}	

	//Faculty viewing faculties list from Faculty  DashBoard
	
	@RequestMapping("/viewfacultieslist")
	public ModelAndView viewfaculties(Model m) {
		List<Faculty> list=fd.fdisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyviewFaculties");
	}
	
	//Faculty viewing students list from Faculty  DashBoard
	@RequestMapping("/viewstudentslist")
	public ModelAndView viewstudents(Model m) {
		List<Student> list=sd.sdisplay();
		m.addAttribute("list", list);
		
		return  new ModelAndView("FacultyviewStudents");
	}
	
	
	@RequestMapping("/addstudent")
	public ModelAndView addstudent(Model m) {
		return  new ModelAndView("FacultyaddStudent");
	}
	
	
	@RequestMapping("/facultyaddstudent")
	public ModelAndView facultyaddstudent(@ModelAttribute("fstudentreg") Student s,Model m) {
		sd.sinsert(s);
		return  new ModelAndView("Facultyheader");
	}	
	
	@RequestMapping("/addfaculty")
	public ModelAndView addfaculty(Model m) {
		return  new ModelAndView("FacultyaddFaculty");
	}
	
	
	@RequestMapping("/facultyaddfaculty")
	public ModelAndView facultyaddfaculty(@ModelAttribute("ffacultyreg") Faculty f,Model m) {
		fd.finsert(f);
		return  new ModelAndView("Facultyheader");
	}	
	
	
	//Logins controllers
	//================================================================

	@RequestMapping("/facultylogin")
	public ModelAndView facultylogin(@RequestParam("fmail") String mail,@RequestParam("fpassword") String password,Model m,HttpServletRequest request) {
		
		if (fd.login(mail, password)) {
			String username=fd.getusername(mail, password);
			List<Faculty> detail=fd.findid(mail);
		
			HttpSession ses=request.getSession();
			ses.setAttribute("username", username);
			ses.setAttribute("details", detail);
			return  new ModelAndView("Facultyheader");
		}
		else {
			m.addAttribute("error", "Invalid username/password");
		return  new ModelAndView("FacultyloginError");
		}
	}
	
	
	//Forgot password
	
	@RequestMapping("/facultygetpassword")
	public ModelAndView facultygetpassword(@RequestParam("fid") int id,@RequestParam("fmail") String mail,Model m) {
		if (fd.getpassword(id,mail)) {

			return  new ModelAndView("FacultyresetPassword");
		}
		else {
			m.addAttribute("error", "Invalid username/password");
		return  new ModelAndView("FacultyForgotPasswordError");
		}
	}
	
	@RequestMapping("/facultysettingpassword")
	public ModelAndView facultysetpassword(@RequestParam("fid") int id,@RequestParam("fpassword") String password,Model m) {
		
		fd.updatepassword(id,password);
		return  new ModelAndView("FacultyLogin");
		
	}
	
	//Change password
	
	@RequestMapping("/facultychangepassword")
	public ModelAndView studentchangepassword() {
			return  new ModelAndView("FacultyupdatePassword");
		
	}
	
	@RequestMapping("/facultyupdatepassword")
	public ModelAndView updatepassword(@RequestParam("oldpassword") String oldpassword,@RequestParam("newPassword") String password,Model m) {
		
		fd.changepassword(oldpassword,password);
		return  new ModelAndView("Facultyheader");
		
	}
	
	//Update details
	
	@RequestMapping("/facultyupdateprofile")
	public ModelAndView facultyupdate() {
			return  new ModelAndView("Facultyupdateprofile");
		
	}
	
	@RequestMapping("/updatedetails")
	public ModelAndView updateprofile(@ModelAttribute("facultyupdate") Faculty f,Model m) {
		fd.updateprofile(f);
		return  new ModelAndView("Facultyheader");
		
	}
	
	//Faculty Logout
	
	@RequestMapping("/facultylogout")
	public ModelAndView facultylogout() {
		return new ModelAndView("FacultyLogin");
	}
	
}
