package kr.letech.web;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.letech.service.PreProcessingSVC;

@Controller
public class PreProcessingCTL {

	@Autowired
	private PreProcessingSVC preProcessingSVC;
	
	@RequestMapping("/")
	public ModelAndView index(ModelAndView mv) {
		preProcessingSVC.preProccessing(1L);
		
		mv.setViewName("index");
		return mv;
	}
}
