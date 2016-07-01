package com.Master.VTAS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrajectoryReconstructionController {
	
	
	@RequestMapping("/trajectoryReconstruction")
	public ModelAndView trajectoryReconstruction(){
		ModelAndView mv = new ModelAndView("trajectoryReconstruction/index");
		return mv;
	}

}
