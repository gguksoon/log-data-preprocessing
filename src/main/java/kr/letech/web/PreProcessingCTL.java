package kr.letech.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.letech.component.Pagination;
import kr.letech.domain.Lpp;
import kr.letech.service.PreProcessingSVC;

@Controller
public class PreProcessingCTL {

	@Autowired
	private PreProcessingSVC preProcessingSVC;
	
	@Autowired
	private Pagination pagination;
	
	@GetMapping("/")
	public ModelAndView lppListView(ModelAndView mv) {
		mv.setViewName("lppList");

		return mv;
	}
	
	@GetMapping("/dtl")
	public ModelAndView lppDtlView(ModelAndView mv) {
		mv.setViewName("lppDtl");

		return mv;
	}
	
	@PostMapping("/getLppList")
	public ModelAndView getLppList(ModelAndView mv, @RequestBody Map<String, String> paramMap) {
		mv.setViewName("jsonView");
		
		Page<Lpp> lppList = preProcessingSVC.getLppList(paramMap);
		mv.addObject("pagination", pagination.getPagination(lppList));
		mv.addObject("lppList", lppList);
		return mv;
	}
	
	@PostMapping("/getLpp")
	public ModelAndView getLpp(ModelAndView mv, @RequestBody Lpp lpp) {
		mv.setViewName("jsonView");

		mv.addObject("lpp", preProcessingSVC.getLpp(lpp));
		return mv;
	}
	
	@PostMapping("/upsertLpp")
	public ModelAndView upsertLpp(ModelAndView mv, @RequestBody Lpp lpp) {
		mv.setViewName("jsonView");
		
		mv.addObject("lpp", preProcessingSVC.upsertLpp(lpp));
		return mv;
	}
	
}
