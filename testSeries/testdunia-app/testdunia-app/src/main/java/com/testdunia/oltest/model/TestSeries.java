package com.testdunia.oltest.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * @author Sumit
 *
 *         CREATE TABLE TestSeries ( Id int NOT NULL, Name VARCHAR(32) NOT NULL,
 *         CourseBaseId int NOT NULL, PRIMARY KEY (Id), FOREIGN KEY
 *         (CourseBaseId) REFERENCES COURSEBASE(Id) );
 *
 */
@Entity
@Table(name = "testSeries")
public class TestSeries {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "courseBaseId")
	private CourseBase courseBaseId;

	private String testName;

	@ManyToMany(mappedBy = "userTestSeries")
    private Set<UserBase> userBase = new HashSet<>();
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public CourseBase getCourseBaseId() {
		return courseBaseId;
	}

	public void setCourseBaseId(CourseBase courseBaseId) {
		this.courseBaseId = courseBaseId;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public Set<UserBase> getUserBase() {
		return userBase;
	}

	public void setUserBase(Set<UserBase> userBase) {
		this.userBase = userBase;
	}



}
