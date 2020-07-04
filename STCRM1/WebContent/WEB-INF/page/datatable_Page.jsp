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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
html,body{
    width:100%;
    height:100%;
}
div{
    float:left;
    width:50%;
    height:50%;
}
</style>
</head>
<body>

<div id="div1" ></div>
<div id="div2" style="background-color:yellow;"></div>
<div id="div3" style="background-color:green;"></div>
<div id="div4" style="background-color:blue;"></div>
<script type="text/javascript" src="static/echarts/echarts.min.js"></script>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">
// 基于准备好的dom，初始化echarts实例
var $=layui.$;
$.ajaxSettings.async = false;
var myChart1 = echarts.init(document.getElementById('div1'));
var myChart2 = echarts.init(document.getElementById('div2'));
var myChart3 = echarts.init(document.getElementById('div3'));
var myChart4 = echarts.init(document.getElementById('div4'));

var tabledata1;
$.post("total_sales",function(d){
	tabledata1=d;
})
// 指定图表的配置项和数据
var option1 = {
	title : {
		text : '业务员销售总额'
	},
	tooltip : {},
	legend : {
		data : [ '销量额' ]
	},
	xAxis : {
		data : tabledata1.name
	},
	yAxis : {},
	series : [ {
		name : '销量',
		type : 'bar',
		data : tabledata1.money
	} ]
};


var option2 = {
	    xAxis: {
	        type: 'category',
	        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [{
	        data: [820, 932, 901, 934, 1290, 1330, 1320],
	        type: 'line'
	    }]
	};

var option3 = {
	    title: {
	        text: '漏斗图',
	        subtext: '纯属虚构'
	    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c}%"
	    },
	    toolbox: {
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    legend: {
	        data: ['展现','点击','访问','咨询','订单']
	    },

	    series: [
	        {
	            name:'漏斗图',
	            type:'funnel',
	            left: '10%',
	            top: 60,
	            //x2: 80,
	            bottom: 60,
	            width: '80%',
	            // height: {totalHeight} - y - y2,
	            min: 0,
	            max: 100,
	            minSize: '0%',
	            maxSize: '100%',
	            sort: 'descending',
	            gap: 2,
	            label: {
	                show: true,
	                position: 'inside'
	            },
	            labelLine: {
	                length: 10,
	                lineStyle: {
	                    width: 1,
	                    type: 'solid'
	                }
	            },
	            itemStyle: {
	                borderColor: '#fff',
	                borderWidth: 1
	            },
	            emphasis: {
	                label: {
	                    fontSize: 20
	                }
	            },
	            data: [
	                {value: 60, name: '访问'},
	                {value: 40, name: '咨询'},
	                {value: 20, name: '订单'},
	                {value: 80, name: '点击'},
	                {value: 100, name: '展现'}
	            ]
	        }
	    ]
	};
var option4 = {
	    tooltip: {
	        trigger: 'item',
	        formatter: '{a} <br/>{b}: {c} ({d}%)'
	    },
	    legend: {
	        orient: 'vertical',
	        left: 10,
	        data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
	    },
	    series: [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                show: false,
	                position: 'center'
	            },
	            emphasis: {
	                label: {
	                    show: true,
	                    fontSize: '30',
	                    fontWeight: 'bold'
	                }
	            },
	            labelLine: {
	                show: false
	            },
	            data: [
	                {value: 335, name: '直接访问'},
	                {value: 310, name: '邮件营销'},
	                {value: 234, name: '联盟广告'},
	                {value: 135, name: '视频广告'},
	                {value: 1548, name: '搜索引擎'}
	            ]
	        }
	    ]
	};

// 使用刚指定的配置项和数据显示图表。
myChart1.setOption(option1);
myChart2.setOption(option2);
myChart3.setOption(option3);
myChart4.setOption(option4);
</script>
</body>
</html>