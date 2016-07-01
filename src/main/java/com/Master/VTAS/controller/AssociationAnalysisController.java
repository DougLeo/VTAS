package com.Master.VTAS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AssociationAnalysisController {
	
	@RequestMapping("/associationAnalysis")
	public ModelAndView associationAnalysis(){
		ModelAndView mv = new ModelAndView("associationAnalysis/index");
		return mv;
	}

}
