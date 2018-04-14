package com.testdunia.oltest.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.testdunia.oltest.model.SectionQuestion;
import com.testdunia.oltest.model.TestSection;
import com.testdunia.oltest.repository.CourseBaseRepository;
import com.testdunia.oltest.repository.ExactTestRepository;
import com.testdunia.oltest.repository.SectionQuestionRespository;
import com.testdunia.oltest.repository.TestSectionRepository;
import com.testdunia.oltest.repository.TestSeriesRepository;

@Controller
public class TestController {

	protected static Logger logger = LoggerFactory.getLogger(TestController.class);

	@Autowired
	TestSeriesRepository tsr;

	@Autowired
	CourseBaseRepository cbr;
	
	@Autowired
	ExactTestRepository etr;

	@Autowired
	TestSectionRepository tsecr;

	@Autowired
	SectionQuestionRespository sqr;
	
	@RequestMapping("/declarationPage/{exactTestId}")
	public String showExactTestData(Model m,@PathVariable("exactTestId") Integer exactTestId) {
		m.addAttribute("test",etr.getOne(exactTestId));
		return "declarationPage";
	}
	
	@RequestMapping("/startTest")
	public String showExactTestData(Model m,@RequestParam Map<String,String> req) {
		int exactTestId=Integer.parseInt(req.get("exactTestId"));
		Collection<TestSection> sectionColl=new ArrayList();
		sectionColl.addAll(tsecr.findByExactTestId(etr.findOne(exactTestId)));
		m.addAttribute("test", etr.findOne(exactTestId));
		m.addAttribute("sectionColl", sectionColl);	
		return "mainTestPage";
	}
	
	@RequestMapping("/getSectionQuestions")
	public String getSectionQuestions(Model m,@RequestParam Map<String,String> req) {
		m.addAttribute("test",etr.findOne(Integer.parseInt(req.get("testId"))));
		m.addAttribute("sectionColl",tsecr.findByExactTestId(etr.findOne(Integer.parseInt(req.get("testId")))));	
		m.addAttribute("secQueColl",sqr.findByExactTestSectionId(tsecr.findOne(Integer.parseInt(req.get("sectionId")))));
		System.out.println(req.get("sectionId")+"|||||||||||||||"+sqr.findByExactTestSectionId(tsecr.findOne(Integer.parseInt(req.get("sectionId")))).size()
				+"|||||||||||||||");
		return "mainTestPage";
	}
	
}
