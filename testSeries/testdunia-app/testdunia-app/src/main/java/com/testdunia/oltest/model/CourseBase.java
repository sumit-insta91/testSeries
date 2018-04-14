package com.testdunia.oltest.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/** 
 * 
 * @author Sumit
 *
 *
CREATE TABLE COURSEBASE (
    Id int NOT NULL,
    CourseName VARCHAR(32) NOT NULL,
    PRIMARY KEY (Id)
);
 *
 */
@Entity
@Table(name="courseBase")
public class CourseBase {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String courseName;
	
	/*@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "testseriesid")
	private TestSeries testSeries;
	*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	/*public TestSeries getTestSeries() {
		return testSeries;
	}
	public void setTestSeries(TestSeries testSeries) {
		this.testSeries = testSeries;
	}
	
	*/
}
