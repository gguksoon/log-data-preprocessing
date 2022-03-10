package kr.letech.service;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import kr.letech.component.FileAnalysis;
import kr.letech.domain.Lpp;
import kr.letech.domain.LppRepository;

@Service
public class PreProcessingSVC {

	@Autowired
	private LppRepository lppRepository;
	
	@Autowired
	private FileAnalysis fileAnalysis;
	
	public void preProccessing(Long lppId) {
		Optional<Lpp> optLpp = lppRepository.findById(lppId);
		Lpp lpp = optLpp.orElse(null);

		fileAnalysis.fileAnalysis(lpp);
	}

	public Page<Lpp> getLppList(Map<String, String> paramMap) {
		int page = Integer.parseInt(paramMap.get("page"));
		page = page == 0 ? 0 : page - 1;
		int size = Integer.parseInt(paramMap.get("size"));
		
		return lppRepository.findAll(PageRequest.of(page, size, Sort.by("regDate").descending()));
	}
}
