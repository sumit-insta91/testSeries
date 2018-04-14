package com.testdunia.oltest.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testdunia.oltest.model.ExactTest;
import com.testdunia.oltest.model.TestSeries;

public interface ExactTestRepository  extends JpaRepository<ExactTest, Integer> {
	Collection<? extends ExactTest> findByTestSeriesId(TestSeries testSeriesId);
}
