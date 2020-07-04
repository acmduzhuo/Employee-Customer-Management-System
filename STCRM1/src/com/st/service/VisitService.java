package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.VisitDao;
import com.st.util.ParamsUtil;

@Service
public class VisitService {
	@Autowired
	VisitDao visitDao;
	public void visit_save(Map params,HttpSession session) {
		ParamsUtil.uuid(params);
		ParamsUtil.loginUserID(params, session);
		ParamsUtil.payment(params);
		visitDao.visit_save(params);
	}
	/*
	 * �ط���־
	 */
	public List visitlog_list(Map params) {
		return visitDao.visitlog_list(params);
	}
}
