package com.collegemanagement.start.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.collegemanagement.start.daoImplementation.Complaintsdao;
import com.collegemanagement.start.entity.Complaints;

@Controller
@CrossOrigin(origins="http://localhost:8999")
public class Complaintscontroller {

	@Autowired
	private Complaintsdao cd;
	
	//Faculty DashBoard
	//=====================================================================================
	
	@RequestMapping("/facultyrisecomplaint")
	public ModelAndView raise(Model m) {
		return  new ModelAndView("FacultyraisecomplaintF");
	}
	
	@RequestMapping("/facultycomplaint")
	public ModelAndView raiseF(@ModelAttribute("complaintF") Complaints c,Model m) {
		cd.cinsert(c);
		return  new ModelAndView("Facultyheader");
	}
	
	@RequestMapping("/viewcomplaintonF")
	public ModelAndView viewf(Model m) {
		
		List<Complaints> list=cd.cdisplay();
		List<Complaints> complaintf=new ArrayList<Complaints>();
		for (Complaints i:list) {
			if (i.getCategory().equals("Faculty")) {
				complaintf.add(i);
			}
		}
		m.addAttribute("list", complaintf);
		return  new ModelAndView("FacultyviewcomplaintF");
	}
	
	@RequestMapping("/deletecomplaint")
	public ModelAndView viewfcomplaints(@RequestParam int id,Model m) {
		cd.cdelete(id);
//		List<Complaints> list=cd.cdisplay();
//		m.addAttribute("list", list);
		return  new ModelAndView("Facultyheader");
	}
	
	@RequestMapping("/viewcomplaintonS")
	public ModelAndView views(Model m) {
		List<Complaints> list=cd.cdisplay();
		List<Complaints> complaintf=new ArrayList<Complaints>();
		for (Complaints i:list) {
			if (i.getCategory().equals("Student")) {
				complaintf.add(i);
			}
		}
		m.addAttribute("list", complaintf);
		return  new ModelAndView("FacultyviewcomplaintS");
	}
	
	//Student DashBoard
	//=====================================================================================
	
	
	@RequestMapping("/studentraisecomplaint")
	public ModelAndView studentraisecomplaint(Model m) {
		return  new ModelAndView("StudentRaiseComplaint");
	}
	
	@RequestMapping("/studentcomplaint")
	public ModelAndView studentcomplaint(@ModelAttribute("stdcomplaint") Complaints c,Model m) {
		cd.cinsert(c);
		return  new ModelAndView("Studentheader");
	}
	
	@RequestMapping("/viewcomplaintF")
	public ModelAndView stdviewfaculty(Model m) {
		List<Complaints> list=cd.cdisplay();
		List<Complaints> complaintf=new ArrayList<Complaints>();
		for (Complaints i:list) {
			if (i.getCategory().equals("Faculty")) {
				complaintf.add(i);
			}
		}
		m.addAttribute("list", complaintf);
		return  new ModelAndView("StudentviewcomplaintF");
	}
	
	@RequestMapping("/viewcomplaintS")
	public ModelAndView stdviewstudent(Model m) {
		List<Complaints> list=cd.cdisplay();
		List<Complaints> complaintf=new ArrayList<Complaints>();
		for (Complaints i:list) {
			if (i.getCategory().equals("Student")) {
				complaintf.add(i);
			}
		}
		m.addAttribute("list", complaintf);
		return  new ModelAndView("StudentviewcomplaintS");
	}
	
}
