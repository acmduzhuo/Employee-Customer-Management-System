package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.TableJson;
import com.st.service.CustomerService;

import util.ParamsUtil;

@Controller
public class CustomerAction {
	@Autowired
	CustomerService cusSer;

	@RequestMapping("/customer_all_page")//从system接受
	public String customer_all_page() {

		return "customer_all_Page";//页面上的文件名
	}
	@RequestMapping("customer_all_list")
	@ResponseBody
	public TableJson customer_list(@RequestParam Map params) {
		int count=cusSer.getCount(params);
		return new TableJson(count, cusSer.customer_list(params));
	}
	//跳转到公海客户信息页面
	@RequestMapping("/customer_public_page")
	public String customer_public_page() {
		return "customer_public_Page";
	}
	
	@RequestMapping("customer_save")
	@ResponseBody
	public void customer_save(@RequestParam Map params) {
		System.out.println(params);
		cusSer.customer_save(params);
	}
	@RequestMapping("customer_del")
	@ResponseBody
	public void customer_del(@RequestParam Map params) {
		System.out.println(params);
		cusSer.customer_del(params);
	}
	@RequestMapping("customer_del_more")
	@ResponseBody
	public void customer_del_more(@RequestParam Map params) {
		System.out.println(params);
		ParamsUtil.arr_str(params, "customerids");
		cusSer.customer_del_more(params);
	}
	@RequestMapping("customer_update")
	@ResponseBody
	public void customer_update(@RequestParam Map params) {
		cusSer.customer_update(params);
	}
	@RequestMapping("customer_public_list")
	@ResponseBody
	public TableJson customer_public_list(@RequestParam Map params) {
		int count=cusSer.getPublicCount(params);
		return new TableJson(count,cusSer.customer_public_list(params));
	}
	@RequestMapping("customer_private_page")
	public String customer_private_page() {
		return "customer_private_Page";
	}
	@RequestMapping("customer_private_list")
	@ResponseBody
	public TableJson customer_private_list(@RequestParam Map params) {
		int count=cusSer.getPrivateCount(params);
		return new TableJson(count,cusSer.customer_private_list(params));
	}
	@RequestMapping("customer_public")
	@ResponseBody
	public void customer_public(@RequestParam Map params) {
		
	}
}
