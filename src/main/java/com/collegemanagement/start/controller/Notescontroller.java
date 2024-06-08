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

import com.collegemanagement.start.daoImplementation.Notesdao;
import com.collegemanagement.start.entity.Notes;


@Controller
@CrossOrigin(origins="http://localhost:8999")
public class Notescontroller {

	@Autowired
	private Notesdao nd;
	
	//Faculty to view notes from the Faculty dashboard
	
	@RequestMapping("/facultynotes")
	public ModelAndView viewnotes(Model m) {
		List<Notes> list=nd.ndisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyNotes");
	}
	
	//Faculty clicking new assignment tab from notes page
	
	@RequestMapping("/addnotes")
	public ModelAndView addnotes(Model m) {
		return new ModelAndView("AddNotes");
	}
	
	//Faculty adding new notes to database
	
	@RequestMapping("/newnotes")
	public ModelAndView addingnotes(@ModelAttribute("note") Notes n,Model m) {
		nd.ninsert(n);
		List<Notes> list=nd.ndisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyNotes");
	}
	
	//Faculty deleting notes from database 
	
	@RequestMapping("/deletenotes")
	public ModelAndView deletenotes(@RequestParam int id,Model m) {
		nd.ndelete(id);
		List<Notes> list=nd.ndisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyNotes");
	}
	
	// Students to view notes from the student dashboard
	
	@RequestMapping("/studentnotes")
	public ModelAndView studentviewnotes(Model m) {
		List<Notes> list=nd.ndisplay();
		m.addAttribute("list", list);
		return  new ModelAndView("StudentviewNotes");
	}
	
	
	//Faculty after clicking edit notes button
	
	@RequestMapping("/editnotes")
	public ModelAndView editnotes(@RequestParam("") int eid,Model m) {
		List<Notes> list=nd.notesedit(eid);
		m.addAttribute("note", list);
		return  new ModelAndView("EditNotes");
	}
	
	//Faculty updating notes to database
	
	@RequestMapping("/updatenotes")
	public ModelAndView updatenote(@ModelAttribute("note") Notes un,Model m) {
		List<Notes> list=nd.nupdate(un.getNid(),un);
		m.addAttribute("list", list);
		return  new ModelAndView("FacultyNotes");
	}
	
	
}
