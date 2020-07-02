package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface CustomerDao {
	List test();
	List customer_list(Map params);
	int getCount(Map params);
	void customer_save(Map params);
	void customer_del(Map params);
	void customer_del_more(Map params);
	void customer_update(Map params);
	int getPublicCount(Map params);
    List customer_public_list(Map params);
    void customer_private(Map params);
    int getPrivateCount(Map params);
    List customer_private_list(Map params);
}
