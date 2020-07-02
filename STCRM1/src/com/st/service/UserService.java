package com.st.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.UserDao;

import util.ParamsUtil;
@Service
public class UserService {
	@Autowired
	UserDao user_dao;
	
	public void test() {
		List list=user_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	public List user_list(Map params) {
		//计算出每页要显示的数据开始的下标，保存到params中
		ParamsUtil.page(params);
		return user_dao.user_list(params);
	}
	public int getCount(Map params) {
		return user_dao.getCount(params);
	}
	public void user_del(Map params) {
		user_dao.user_del(params);
	}
	public void user_save(Map params) {
		ParamsUtil.uuid(params);
		ParamsUtil.initpass(params);
		user_dao.user_save(params);
	}
	public void user_update(Map params) {
		user_dao.user_update(params);
	}
	public void user_del_more(Map params) {
		//要执行删除
		//in('','','')
		//参数
		user_dao.user_del_more(params);
	}
}
