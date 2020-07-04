package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface VisitDao {
	void visit_save(Map params);
	/**
	 * ªÿ∑√»’÷æ
	 */
	List visitlog_list(Map params);
}
