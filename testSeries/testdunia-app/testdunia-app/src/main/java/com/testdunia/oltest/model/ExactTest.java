package com.testdunia.oltest.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "exactTest")
public class ExactTest {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name="testSeriesId")
	private TestSeries testSeriesId;	

	private String exactTestName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TestSeries getTestSeriesId() {
		return testSeriesId;
	}

	public void setTestSeriesId(TestSeries testSeriesId) {
		this.testSeriesId = testSeriesId;
	}

	public String getExactTestName() {
		return exactTestName;
	}

	public void setExactTestName(String exactTestName) {
		this.exactTestName = exactTestName;
	}
	
}

