package kr.letech.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	private FileAnalysis fileAnalysis;
	
	public void preProccessing(Long lppId) {
		Optional<Lpp> optLpp = lppRepository.findById(lppId);
		Lpp lpp = optLpp.orElse(null);

		fileAnalysis.fileAnalysis(lpp);
	}
}
