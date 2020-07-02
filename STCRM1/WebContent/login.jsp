<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>登录</title>
<style type="text/css">
.td_red {
	border-style: solid;
	border-color: red;
	border-width: 1px;
}
</style>
</head>
<body>
	<!-- 页面上要显示的内容     注释-->
	登陆页面

	<div style="height: 200px; background-color: red; width: 400px;">
		<h1>标题1</h1>
		<h2>标题2</h2>
	</div>

	<table
		style="border-style: solid; border-color: red; border-width: 1px;">
		
		<tr>
			<td class="td_red">1</td>
			<td class="td_red">2</td>
			<td class="td_red">3</td>
		</tr>
		<tr>
			<td class="td_red">1</td>
			<td class="td_red">2</td>
			<td class="td_red">3</td>
		</tr>
		<tr>
			<td class="td_red">1</td>
			<td class="td_red">2</td>
			<td class="td_red">3</td>
		</tr>
	</table>
	
	<!-- 表单 -->
	<form action="数据提交的位置" method="post">
	手机号:<input name='tel' type="text" value="123"><br/>
	<input type="radio" name="sex">男<input type="radio" name='sex'>女<br/>
	<input type="checkbox" name='hobby' value="run"/>跑步
	<input type="checkbox" name='hobby' value="book"/>读书
	<input type="checkbox" name='hobby' value="geme"/>玩游戏<br/>
	
	密码:<input name="password" type="password"><br/>
	城市:<select name="city" >
		<option value="qd">青岛</option>
		<option value="zb">淄博</option>
	</select>
	<input type="button" id="but_1" value="提交"/><!-- 按钮 -->
	<a href="https://www.baidu.com">百度</a><!-- 超链接 -->
	<!-- <img src="static/img/fly.jpg"/> -->
	</form>
<!-- 引入layui.all.js -->
<script type="text/javascript" src="static/layui/layui.all.js"></script>
<script type="text/javascript">
	var $=layui.$;
	/* 给id为but_1组件添加一个点击事件 */
	
	$("#but_1").click(function(){
		$("[name=tel]").val("123123123123");
	});
	
	
	
	
	
	
	

</script>
</body>
</html>