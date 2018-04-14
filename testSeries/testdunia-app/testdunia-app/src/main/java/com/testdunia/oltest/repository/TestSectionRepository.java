package com.testdunia.oltest.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testdunia.oltest.model.ExactTest;
import com.testdunia.oltest.model.TestSection;

public interface TestSectionRepository extends JpaRepository<TestSection, Integer> {
	List<TestSection> findByExactTestId(ExactTest exactTestId);

}
