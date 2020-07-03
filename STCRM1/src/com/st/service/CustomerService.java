package com.st.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.CustomerDao;

import util.ParamsUtil;
@Service
public class CustomerService {
	@Autowired
	CustomerDao cusDao;
	public int getCount(Map params) {
		return cusDao.getCount(params);
	}
	public List customer_list(Map params) {
		ParamsUtil.page(params);
		return cusDao.customer_list(params);
	}
	public void customer_save(Map params) {
		ParamsUtil.uuid(params);
//		String str=params.get("private")+"";
//		if("null".equals(str)) {
//			params.put("loginUserID", "");
//			params.put("customer_state", "0");
//		}else {
//			ParamsUtil.LoginUserID(params,null);
//			params.put(params, 1);
//		}
		params.put("customer_user_id", "");
		params.put("customer_state", "0");
		//params.put("customer_liaison", "³Â´«´ï");
//		System.out.println("Sercice");
//		System.out.println(params);
		cusDao.customer_save(params);
	}
	public void customer_del_more(Map params) {
		//ParamsUtil.arr_str(params, "customerids");
		//System.out.println("customerids");
		cusDao.customer_del_more(params);
	}
	public void customer_update(Map params) {
		cusDao.customer_update(params);
//		System.out.println("Sercice");
//		System.out.println(params);
	}
	public void customer_del(Map params) {
		cusDao.customer_del(params);
	}
	public int getPublicCount(Map params) {
		return cusDao.getPublicCount(params);
	}
	public List customer_public_list(Map params) {
		ParamsUtil.page(params);
		return cusDao.customer_public_list(params);
	}
	public void customer_private(Map params) {
		ParamsUtil.state(params, 1);
		ParamsUtil.loginUserId(params, null);
		cusDao.customer_private(params);
	}
	public int getPrivateCount(Map params) {
		return cusDao.getPrivateCount(params);
	}
	public List customer_private_list(Map params) {
		ParamsUtil.page(params);
		return cusDao.customer_private_list(params);
	}
}
