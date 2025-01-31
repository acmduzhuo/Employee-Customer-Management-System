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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="static/layui/css/layui.css">
<body>

<!-- 天骄表头工具 -->
<script type="text/html" id="toolbar">
	<input type="text" style="height:38px;" id="check"/>
	<button class="layui-btn layui-icon layui-icon-search " lay-event="select">查询</button>
	<button class="layui-btn layui-icon layui-icon-add-1" lay-event="insert">新增</button>
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="refresh">刷新</button>
</script>
<script type="text/html" id="rowtoolbar">
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-edit" lay-event="update">编辑</a>
    <a class="layui-btn layui-btn-xs layui-icon layui-icon-edit layui-bg-blue" lay-event="private">跟单</a>
    <a class="layui-btn layui-btn-xs layui-icon layui-icon-edit layui-bg-blue" lay-event="visitlog">回访记录</a>
</script>
<table class="layui-table" lay-data="{url:'customer_public_list', page:true, id:'customertable_id',toolbar:'#toolbar'}" lay-filter="customertable">
  <thead>
    <tr>
     <th lay-data="{type:'checkbox'}"></th>
     <th lay-data="{type:'numbers'}">行号</th>
<!--       <th lay-data="{field:'Customer_id', sort: true}">ID</th> -->
      <th lay-data="{field:'Customer_name',sort: true }">客户名</th>
      <th lay-data="{field:'Customer_liaison',sort: true}">联系人</th>
      <th lay-data="{field:'Customer_tel',sort: true }">手机号码</th>
           <th lay-data="{field:'Customer_state', sort: true,
      templet:function(data){
      if(data.Customer_state==0){
          return '公海客户'
      }else{
          return '私有客户';
      }
      }}">状态</th>
      <th lay-data="{field:'Customer_addr', sort: true}">住址</th>
      <th lay-data="{toolbar:'#rowtoolbar',width:300}">操作</th>
    </tr>
  </thead>
</table>

<form  hidden id="h_div" class="layui-form "  lay-filter="customersave">
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
			<label class="layui-form-label">客户名</label>
			<div class="layui-input-inline">
				<input name="customer_name" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input name="customer_liaison" type="text"  class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="customer_tel"  type="text" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="customer_addr"type="text"  class="city_input layui-input kong" lay-verify="required"/>
				</div>
			</div>
		</div>
	</form>
	
	<form  hidden id="update_h_div" class="layui-form "  lay-filter="customerupdate">
	    <input type='hidden' name="customer_id"/>
		<div class="layui-form-item">
			<div class="layui-inline">
			<label class="layui-form-label">客户名</label>
			<div class="layui-input-inline">
				<input name="customer_name" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input name="customer_liaison" type="text" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="customer_tel"  type="text" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="customer_addr"type="text"  class="city_input layui-input kong"  lay-verify="required"/>
				</div>
			</div>
		</div>
	</form>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">
var table = layui.table;
var $ = layui.$;
var layer = layui.layer;
var form = layui.form;
table.on('toolbar(customertable)', function(obj) {
	//获取选中数据
	var checkStatus = table.checkStatus('customertable_id');
	var data = checkStatus.data;
	//在浏览器控制台打印
	
	switch (obj.event) {
	
	case 'refresh':
		table.reload('customertable_id',{
			url : 'customer_public_list',
			where : {
				"check" : ''
			}
		});
		break;
	case 'select':
		//console.log($("#check").val());
		//查询管理员信息
		table.reload('customertable_id', {
			url : 'customer_public_list',
			where : {
				"check" : $("#check").val()
			}
		});
		break;
	case 'insert':
		//把表单中的内容清空掉
		form.val("customersave",{
			'customer_name':'',
			'customer_liaison':'',
			'customer_addr':'',
			'customer_tel' :''
		});
		//弹出对话框，供客户填写数据
		layer.open({
					type : 1,
					title : '新增管理员信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("customer_save",form.val("customersave"), function() {
							layer.closeAll();
							layer.alert('默认密码:123456',{title:'新增用户信息'});
							table.reload('customertable_id');
						});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
		//保存和取消按钮
		break;
	}
});

table.on('tool(customertable)', function(obj) {
	var data = obj.data;
	//console.log(data);
	switch (obj.event) {
	case 'visitlog':
		location.href="visitlog_page?Customer_id="+data.Customer_id;
		break;
	case 'private':
		layer.confirm("确定要对"+data.Customer_name+"跟单吗？",{
			btn:['确定','取消']
		},function(){
			//点击第一个按钮执行方法
			$.post("customer_private",data,function(d){
				//执行成功表格重新刷新
				layer.msg(data.Customer_name+"已成为您的私有客户",{
					icon:6,
					time:2000
			        });
				table.reload('customertable_id');
			});
		});
		break;
	case 'update':
		//$("update_h_div [name=user_sex]").val(data.user_sex);
		form.val("customerupdate",{
			'customer_name':data.Customer_name,
			'customer_liaison':data.Customer_liaison,
			'customer_addr':data.Customer_addr,
			'customer_tel':data.Customer_tel,
			'customer_id':data.Customer_id
		});
		//弹出对话框
		layer.open({
					type : 1,
					title : '编辑公海客户信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("customer_update",form.val("customerupdate"), function() {
							layer.closeAll();
							layer.msg(data.Customer_name+'客户信息修改成功！',{icon:6,time:2000});
							table.reload('customertable_id');
						});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
		break;
	}
});
</script>
</body>
</html>