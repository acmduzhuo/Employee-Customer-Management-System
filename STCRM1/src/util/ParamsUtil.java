package util;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

public class ParamsUtil {
	public static void page(Map params) {
		int page = Integer.parseInt(params.get("page").toString());
		int limit = Integer.parseInt(params.get("limit").toString());
		int start = (page - 1) * limit;
		params.put("start", start);
	}
	public static void uuid(Map params) {
		UUID uuid=UUID.randomUUID();
		params.put("uuid", uuid.toString());
	}
	/*
	 * 向params中添加默认密码，属性名为User_loginpass
	 */
	public static String initpass(Map params) {
		String pass="123456";
		params.put("User_loginpass",pass);
		return pass;
	}
	/*
	 * 将字符串变为'A','B'格式方便sql使用
	 */
	public static void arr_str(Map params, String key) {
		String arr_str = params.get(key) +"";
		arr_str = arr_str.substring(0,arr_str.length()-1);
		arr_str = arr_str.replaceAll(",", "','");
		arr_str="'"+arr_str+"'";
		params.put(key, arr_str);
		System.out.println(params);
	}
	public static void state(Map params,int state) {
		params.put("state", state);
	}
	public static void loginUserId(Map params, HttpSession session) {
		String loginUserId = "73c52aa4-af50-4564-a1dc-77654f61e632";
		params.put("loginUserId", loginUserId);
	}
}
