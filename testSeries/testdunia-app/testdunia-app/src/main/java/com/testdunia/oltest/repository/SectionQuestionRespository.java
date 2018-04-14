package com.testdunia.oltest.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import com.testdunia.oltest.model.ExactTest;
import com.testdunia.oltest.model.SectionQuestion;
import com.testdunia.oltest.model.TestSection;

public interface SectionQuestionRespository extends JpaRepository<SectionQuestion, Integer>{
	Collection<? extends SectionQuestion> findByExactTestSectionId(TestSection testSectionId);
}
