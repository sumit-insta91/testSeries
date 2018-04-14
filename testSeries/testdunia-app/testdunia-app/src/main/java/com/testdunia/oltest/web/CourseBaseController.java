package com.testdunia.oltest.web;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.testdunia.oltest.model.CourseBase;
import com.testdunia.oltest.model.ExactTest;
import com.testdunia.oltest.model.TestSeries;
import com.testdunia.oltest.repository.CourseBaseRepository;
import com.testdunia.oltest.repository.ExactTestRepository;
import com.testdunia.oltest.repository.SectionQuestionRespository;
import com.testdunia.oltest.repository.TestSectionRepository;
import com.testdunia.oltest.repository.TestSeriesRepository;

@Controller
public class CourseBaseController {
	protected static Logger logger = LoggerFactory.getLogger(CourseBaseController.class);

	@Autowired
	TestSeriesRepository tsr;

	@Autowired
	CourseBaseRepository cbr;
	
	@Autowired
	ExactTestRepository etr;
	
	@Autowired
	TestSectionRepository tser;

	@Autowired
	SectionQuestionRespository sqr;
	
	@RequestMapping("/testhome")
	public String showCourseBaseData(Model m) {
		logger.info("courseBaseController : inside test home  : START");
		/*TestSeries ts = new TestSeries();
		ts.setTestName("Unlimited");
		ts.setCourseBaseId(cbr.findOne(1));
		tsr.save(ts);*/
		
	/*	CourseBase cb=new CourseBase(); cb.setCourseName("IBPS-CLERK"); cbr.save(cb);
		 m.addAttribute("courseBase", cb);*/ 
		/*
		ExactTest et=new ExactTest();
		et.setExactTestName(cbr.getOne(1).getCourseName()+":"+tsr.getOne(1).getTestName() + " - Test 10");
		et.setTestSeriesId(tsr.findOne(1));
		etr.save(et);*/
		
		/*TestSection tse=new TestSection();
		tse.setExactTestId(etr.findOne(1));
		tse.setSectionName("General Knowledge");
		tser.save(tse);*/
		
		/*SectionQuestion sq=new SectionQuestion();
		sq.setExactTestSectionId(tser.findOne(1));
		sq.setQueNo(1);
		sq.setQuestion("3/5th of a number is more than 40% of the same number by 35. What is 80% of that number ?");
		sq.setOpt1("175");
		sq.setOpt2("155");
		sq.setOpt3("130");
		sq.setOpt4("140");
		sq.setCorrectAns("d");
		sqr.save(sq);*/
		
		ArrayList<CourseBase>cbList=new ArrayList<>();
		cbList.addAll(cbr.findAll());
		m.addAttribute("courseBaseList",cbList);
		logger.info("courseBaseController : inside test home  : END");

		return "testHome";
	}
	
	@RequestMapping("/enterCourseBase/{courseBaseId}")
	public String showTestSeriesData(Model m,@PathVariable("courseBaseId") Integer courseBaseId) {
		List<TestSeries> tsList=new ArrayList<>();
		tsList.addAll(tsr.findByCourseBaseId(cbr.findOne(courseBaseId)));
		m.addAttribute("testSeriesList",tsList);

		return "testSeriesHome";
	}
	
	
	@RequestMapping("/enterTestSeries/{testSeriesId}")
	public String showExactTestData(Model m,@PathVariable("testSeriesId") Integer testSeriesId) {
		ArrayList<ExactTest> etList=new ArrayList<>();
		etList.addAll(etr.findByTestSeriesId(tsr.findOne(testSeriesId)));
		m.addAttribute("exactTestList",etList);

		return "exactTestHome";
	}
}
