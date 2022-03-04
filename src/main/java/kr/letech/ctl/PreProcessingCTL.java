package kr.letech.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PreProcessingCTL {

	@RequestMapping("/")
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName("index");
		return mv;
	}
}
