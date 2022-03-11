package kr.letech.service;

import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import kr.letech.component.FileAnalysis;
import kr.letech.domain.Lpp;
import kr.letech.domain.LppRepository;
import kr.letech.domain.Regex;
import kr.letech.domain.RegexRepository;

@Service
public class PreProcessingSVC {

	@Autowired
	private LppRepository lppRepository;
	
	@Autowired
	private RegexRepository regexRepository;
	
	@Autowired
	private FileAnalysis fileAnalysis;
	
	public Page<Lpp> getLppList(Map<String, String> paramMap) {
		int page = Integer.parseInt(paramMap.get("page"));
		page = page == 0 ? 0 : page - 1;
		int size = Integer.parseInt(paramMap.get("size"));
		
		return lppRepository.findAll(PageRequest.of(page, size, Sort.by("regDate").descending()));
	}

	public Lpp getLpp(Lpp lpp) {
		Optional<Lpp> optLpp = lppRepository.findById(lpp.getLppId());
		
		return optLpp.orElse(null);
	}
	
	@Transactional
	public Lpp upsertLpp(Lpp lpp) {
		if(lpp.getLppId() == null) { // insert
			lppRepository.save(lpp);
//			regexRepository.saveAll(lpp.getRegex());
		} else { // update
			System.out.println(lpp.toString());
			for(Regex regex : lpp.getRegex()) {
				regex.setRegexId(null);
			}
			lppRepository.save(lpp);
			System.out.println(lpp.toString());
			regexRepository.deleteByLppId(lpp.getLppId());
			for(Regex regex : lpp.getRegex()) {
				regex.setLppId(lpp.getLppId());
			}
			regexRepository.saveAll(lpp.getRegex());
			System.out.println(lpp.toString());
		}
		return null;
	}
}
