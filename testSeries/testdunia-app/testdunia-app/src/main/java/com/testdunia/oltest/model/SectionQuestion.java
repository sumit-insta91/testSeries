package com.testdunia.oltest.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * @author Sumit
 *
 *
 *CREATE TABLE TestQuestion (
    Id int NOT NULL,
    TestSeriesId int NOT NULL,
    QueNo int NOT NULL ,
    Question VARCHAR(128) NOT NULL,
    Opt1 VARCHAR(32) ,
    Opt2 VARCHAR(32) ,
    Opt3 VARCHAR(32) ,
    Opt4 VARCHAR(32) ,
    Opt5 VARCHAR(32) ,
    CorrectAns VARCHAR(32),
    PRIMARY KEY (Id),
    FOREIGN KEY (TestSeriesId) REFERENCES TestSeries(Id)
);
 *
 */
@Entity
@Table(name="sectionQuestion")
public class SectionQuestion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "testSectionId")
	private TestSection exactTestSectionId;
	
	private Integer queNo;
	
	private String question;
	
	private String opt1;
	
	private String opt2;
	
	private String opt3;
	
	private String opt4;
	
	private String opt5;
	
	private String correctAns;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Integer getQueNo() {
		return queNo;
	}
	public void setQueNo(Integer queNo) {
		this.queNo = queNo;
	}

	public String getOpt1() {
		return opt1;
	}
	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}
	public String getOpt2() {
		return opt2;
	}
	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}
	public String getOpt3() {
		return opt3;
	}
	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}
	public String getOpt4() {
		return opt4;
	}
	public void setOpt4(String opt4) {
		this.opt4 = opt4;
	}
	public String getOpt5() {
		return opt5;
	}
	public void setOpt5(String opt5) {
		this.opt5 = opt5;
	}
	public String getCorrectAns() {
		return correctAns;
	}
	public void setCorrectAns(String correctAns) {
		this.correctAns = correctAns;
	}
	public TestSection getExactTestSectionId() {
		return exactTestSectionId;
	}
	public void setExactTestSectionId(TestSection exactTestSectionId) {
		this.exactTestSectionId = exactTestSectionId;
	}
}
