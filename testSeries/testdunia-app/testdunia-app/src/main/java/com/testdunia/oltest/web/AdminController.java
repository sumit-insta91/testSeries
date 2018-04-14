package com.testdunia.oltest.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.testdunia.oltest.model.CourseBase;
import com.testdunia.oltest.model.ExactTest;
import com.testdunia.oltest.model.SectionQuestion;
import com.testdunia.oltest.model.TestSection;
import com.testdunia.oltest.model.TestSeries;
import com.testdunia.oltest.repository.CourseBaseRepository;
import com.testdunia.oltest.repository.ExactTestRepository;
import com.testdunia.oltest.repository.SectionQuestionRespository;
import com.testdunia.oltest.repository.TestSectionRepository;
import com.testdunia.oltest.repository.TestSeriesRepository;
import com.testdunia.oltest.util.TestDuniaConstants;

@Controller
public class AdminController extends TestDuniaConstants {
/*
	protected static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/admin/admin-dashboard")
	@ResponseBody
	public String userDashboard() {

		return "Welcome to admin dashboard !";
	}
*/
	
	@Autowired
	CourseBaseRepository cbr;
	
	@Autowired
	TestSeriesRepository tsr;
	
	@Autowired
	ExactTestRepository etr;

	@Autowired
	TestSectionRepository tSecRep;
	
	@Autowired
    SectionQuestionRespository sqr;
	
	@RequestMapping("/contentWriterHome")
	public String contentDashboard() {		
		return "contentHome";
	}
	
	/**
	 * Course Base
	 */
	
	@RequestMapping("/feedCourseBase")
	public String feedCourseBaseDashboard(Model m) {		
		m.addAttribute("cbColl",cbr.findAll());
		return "feedCourseBase";
	}
	
	@RequestMapping("/submitCourseBase")
	public String submitCourseBaseDashboard(Model m,@RequestParam Map<String,String> req) {		
		String courseBaseName=req.get("courseBaseName");
		CourseBase cb=new CourseBase();
		cb.setCourseName(courseBaseName);
		cbr.save(cb);		
		ArrayList<CourseBase>cbList=new ArrayList<>();
		cbList.addAll(cbr.findAll());
		m.addAttribute("cbColl",cbList);
		return "feedCourseBase";
	}
	
	/**
	 * Test Series
	 */
	
	@RequestMapping("/feedTestSeries")
	public String feedTestSeriesDashboard(Model m) {
		m.addAttribute("cbColl", cbr.findAll());
		return "feedTestSeries";
	}
	
	@RequestMapping("/submitTestSeries")
	public String submitTestSeriesDashboard(Model m,@RequestParam Map<String,String> req) {		
		m.addAttribute("cbColl", cbr.findAll());
		String testSeriesName=req.get("testSeriesName");
		int courseBaseId=Integer.parseInt(req.get("courseBase"));
		TestSeries ts=new TestSeries();
		ts.setTestName(testSeriesName);
		ts.setCourseBaseId(cbr.findOne(courseBaseId));
		tsr.save(ts);
		m.addAttribute("success", "Test Series Created Successfully !!!");
		return "feedTestSeries";
	}

	/**
	 *  Exact Test
	 */
	
	@RequestMapping("/feedExactTest")
	public String feedExactTestDashboard(Model m) {
		m.addAttribute("cbColl", cbr.findAll());
		return "feedExactTest";
	}
	
	@RequestMapping("/getTSWithCB")
	public String feedCourseBaseWithExactTestSeriesDashboard(Model m,@RequestParam Map<String,String> req) {
		System.out.println("ts");
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		return "feedExactTest";
	}
	
	@RequestMapping("/submitExactTest")
	public String submitExactTestDashboard(Model m,@RequestParam Map<String,String> req) {		
		m.addAttribute("cbColl", cbr.findAll());
		int testSeriesId=Integer.parseInt(req.get("testSeries"));
		String exactTestName=cbr.findOne(Integer.parseInt(req.get("courseBase"))).getCourseName()+":"+
		tsr.getOne(testSeriesId).getTestName()+"-"+req.get("exactTestName");
		ExactTest et = new ExactTest();
		et.setExactTestName(exactTestName);
		et.setTestSeriesId(tsr.findOne(testSeriesId));
		etr.save(et);
		m.addAttribute("success", "Exact Test Created Successfully !!!");
		return "feedExactTest";
	}
	
	/**
	 *  Test Sections
	 */
	
	@RequestMapping("/feedTestSections")
	public String feedTestSectionsDashboard(Model m,@RequestParam Map<String,String> req) {
		m.addAttribute("cbColl", cbr.findAll());
		return "feedTestSections";
	}
	
	@RequestMapping("/getTSWithCBSec")
	public String feedCourseBaseWithExactTestSeriesSec(Model m,@RequestParam Map<String,String> req) {
		System.out.println("ts");
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		String questionPage=req.get("questionPage");
		if(questionPage==null || questionPage.equals("")) {
			return "feedTestSections";
		}
		return "feedSectionQuestion";
	}
	
	@RequestMapping("/getExactTestWithTestSeries")
	public String getTestSectionWithTestSeries(Model m,@RequestParam Map<String,String> req) {
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		m.addAttribute("tsSelected", tsr.findOne(Integer.parseInt(req.get("testSeries"))));
		m.addAttribute("etColl",etr.findByTestSeriesId(tsr.findOne(Integer.parseInt(req.get("testSeries")))));
		String questionPage=req.get("questionPage");
		if(questionPage==null || questionPage.equals("")) {
			return "feedTestSections";
		}
		return "feedSectionQuestion";
	}
	
	@RequestMapping("/getTestSectionWithExactTest")
	public String getTestSectionWithExactTest(Model m,@RequestParam Map<String,String> req) {
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		m.addAttribute("tsSelected", tsr.findOne(Integer.parseInt(req.get("testSeries"))));
		m.addAttribute("etColl",etr.findByTestSeriesId(tsr.findOne(Integer.parseInt(req.get("testSeries")))));
		m.addAttribute("etSelected", etr.findOne(Integer.parseInt(req.get("exactTest"))));
		m.addAttribute("tsecColl", tSecRep.findByExactTestId(etr.findOne(Integer.parseInt(req.get("exactTest")))));
		String questionPage=req.get("questionPage");
		if(questionPage==null || questionPage.equals("")) {
			return "feedTestSections";
		}
		return "feedSectionQuestion";
	}
	
	@RequestMapping("/submitTestSections")
	public String submitTestSectionsDashboard(Model m,@RequestParam Map<String,String> req) {		
		TestSection tSec=new TestSection();
		tSec.setSectionName(req.get("testSectionName"));
		tSec.setExactTestId(etr.findOne(Integer.parseInt(req.get("exactTest"))));
		tSecRep.save(tSec);
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		m.addAttribute("tsSelected", tsr.findOne(Integer.parseInt(req.get("testSeries"))));
		m.addAttribute("etColl",etr.findByTestSeriesId(tsr.findOne(Integer.parseInt(req.get("testSeries")))));
		m.addAttribute("etSelected", etr.findOne(Integer.parseInt(req.get("exactTest"))));
		m.addAttribute("tsecColl", tSecRep.findByExactTestId(etr.findOne(Integer.parseInt(req.get("exactTest")))));
		String questionPage=req.get("questionPage");
		if(questionPage==null || questionPage.equals("")) {
			return "feedTestSections";
		}
		return "feedSectionQuestion";
	}


	/**
	 *  Section Questions
	 */
	
	@RequestMapping("/feedSectionQuestions")
	public String feedSectionQuestions(Model m,@RequestParam Map<String,String> req) {
		m.addAttribute("cbColl", cbr.findAll());
		return "feedSectionQuestion";
	}

	@RequestMapping("/getSectionQuestionWithTestSection")
	public String getSectionQuestionWithTestSection(Model m,@RequestParam Map<String,String> req) {		
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		m.addAttribute("tsSelected", tsr.findOne(Integer.parseInt(req.get("testSeries"))));
		m.addAttribute("etColl",etr.findByTestSeriesId(tsr.findOne(Integer.parseInt(req.get("testSeries")))));
		m.addAttribute("etSelected", etr.findOne(Integer.parseInt(req.get("exactTest"))));
		m.addAttribute("tsecColl", tSecRep.findByExactTestId(etr.findOne(Integer.parseInt(req.get("exactTest")))));
		m.addAttribute("tsecSelected", tSecRep.findOne(Integer.parseInt(req.get("testSection"))));
		m.addAttribute("secQueColl", sqr.findByExactTestSectionId(tSecRep.findOne(Integer.parseInt(req.get("testSection")))));
		return "feedSectionQuestion";
	}
	
	@RequestMapping("/submitSectionQuestions")
	public String submitSectionQuestions(Model m,@RequestParam Map<String,String> req) {		
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		m.addAttribute("tsSelected", tsr.findOne(Integer.parseInt(req.get("testSeries"))));
		m.addAttribute("etColl",etr.findByTestSeriesId(tsr.findOne(Integer.parseInt(req.get("testSeries")))));
		m.addAttribute("etSelected", etr.findOne(Integer.parseInt(req.get("exactTest"))));
		m.addAttribute("tsecColl", tSecRep.findByExactTestId(etr.findOne(Integer.parseInt(req.get("exactTest")))));
		m.addAttribute("tsecSelected", tSecRep.findOne(Integer.parseInt(req.get("testSection"))));
	
		SectionQuestion sq=new SectionQuestion();
		sq.setExactTestSectionId(tSecRep.findOne(Integer.parseInt(req.get("testSection"))));
		sq.setQueNo(Integer.parseInt(req.get("questionNumber")));
		sq.setQuestion(req.get("Question"));
		sq.setOpt1(req.get("Option1"));
		sq.setOpt2(req.get("Option2"));
		sq.setOpt3(req.get("Option3"));
		sq.setOpt4(req.get("Option4"));
		sq.setOpt5(req.get("Option5"));
		sq.setCorrectAns(req.get("CorrectAns"));
		sqr.save(sq);
		
		m.addAttribute("secQueColl", sqr.findByExactTestSectionId(tSecRep.findOne(Integer.parseInt(req.get("testSection")))));
		return "feedSectionQuestion";
	}
	
	@RequestMapping("/deleteQuestion")
	public String deleteQuestions(Model m,@RequestParam Map<String,String> req) {		
		m.addAttribute("tsColl", tsr.findByCourseBaseId(cbr.findOne(Integer.parseInt(req.get("courseBase")))));
		m.addAttribute("cbColl", cbr.findAll());
		m.addAttribute("cbSelected", cbr.findOne(Integer.parseInt(req.get("courseBase"))));
		m.addAttribute("tsSelected", tsr.findOne(Integer.parseInt(req.get("testSeries"))));
		m.addAttribute("etColl",etr.findByTestSeriesId(tsr.findOne(Integer.parseInt(req.get("testSeries")))));
		m.addAttribute("etSelected", etr.findOne(Integer.parseInt(req.get("exactTest"))));
		m.addAttribute("tsecColl", tSecRep.findByExactTestId(etr.findOne(Integer.parseInt(req.get("exactTest")))));
		m.addAttribute("tsecSelected", tSecRep.findOne(Integer.parseInt(req.get("testSection"))));
//		sqr.delete(sqr.findOne(Integer.parseInt(req.get("queSelect"))));;
		sqr.delete(Integer.parseInt(req.get("queSelect")));		
		m.addAttribute("secQueColl", sqr.findByExactTestSectionId(tSecRep.findOne(Integer.parseInt(req.get("testSection")))));
		return "feedSectionQuestion";
	}

}
