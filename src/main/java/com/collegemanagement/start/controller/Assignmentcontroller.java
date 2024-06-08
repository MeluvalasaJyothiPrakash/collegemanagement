package com.collegemanagement.start.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.collegemanagement.start.daoImplementation.Assignmentsdao;
import com.collegemanagement.start.entity.Assignments;
import com.collegemanagement.start.entity.Notes;

@Controller
@CrossOrigin(origins="http://localhost:8999")
public class Assignmentcontroller {

	@Autowired
	private Assignmentsdao ad;
	
	
	// Faculty viewing assignments from Faculty dashboard
	
	@RequestMapping("/facultyassignments")
	public ModelAndView viewassignment(Model m) {
		List<Assignments> list=ad.asgdisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyAssignments");
	}
	
	//Faculty clicking on add assignment button
	
	@RequestMapping("/addassignment")
	public ModelAndView addassignment(Model m) {
		return  new ModelAndView("AddAssignment");
	}
	
	//Faculty adding  new assignment to database
	
	@RequestMapping("/newassignment")
	public ModelAndView addingassignment(@ModelAttribute("assignment") Assignments a,  Model m) {
		ad.asginsert(a);
		List<Assignments> list=ad.asgdisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyAssignments");
	}
	
	//Faculty deleting Assignmnet
	
	@RequestMapping("/deleteassignment")
	public ModelAndView deleteassignment(@RequestParam int id, Model m) {
		ad.asgdelete(id);
		List<Assignments> list=ad.asgdisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyAssignments");
	}
	
	
	//Students viewing assignments from student dashboard
	
	@RequestMapping("/studentassignments")
	public ModelAndView studentviewassignment(Model m) {
		List<Assignments> list=ad.asgdisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("StudentviewAssignments");
	}
	
	//Faculty after clicking edit assignment button
	
	@RequestMapping("/editassignment")
	public ModelAndView editassig(@RequestParam int aid,Model m) {
		List<Assignments> list=ad.assignmentedit(aid);
		m.addAttribute("assig", list);
		return  new ModelAndView("EditAssignment");
	}
	
	
	//Faculty updating assignmet 
	
	@RequestMapping("/updateassignment")
	public ModelAndView updateassig(@ModelAttribute("uassignment") Assignments un,Model m) {
		List<Assignments> list=ad.aupdate(un.getAid(),un);
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyAssignments");
	}
	
}
