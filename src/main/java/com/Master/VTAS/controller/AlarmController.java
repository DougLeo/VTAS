package com.Master.VTAS.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlarmController {
	
	@RequestMapping("/alarm")
	public ModelAndView alarmHome(){
		ModelAndView mv = new ModelAndView("alarm/index");
		return mv;
	}
	
	@RequestMapping("/instantAlarm")
	@ResponseBody
	public int instantAlarm(){
		Random random = new Random();
		
		return random.nextInt(10);
	}
}
