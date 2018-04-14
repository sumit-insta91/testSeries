package com.testdunia.oltest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testdunia.oltest.model.CourseBase;
import com.testdunia.oltest.model.TestSeries;

public interface TestSeriesRepository  extends JpaRepository<TestSeries, Integer> {
		List<TestSeries> findByCourseBaseId(CourseBase courseBaseId);
}
