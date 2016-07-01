<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>主页</title>
<jsp:include page="/WEB-INF/pages/commons/common.jsp" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/mainframe.css">
<script type="text/javascript"
	src="${ctx}/static/js/mainframe/mainframe.action.js"></script>
</head>
<body class="easyui-layout">
	<!-- 正上方panel -->
	<!-- <div data-options="region:'north',border:false">
		<div class="inlineblock admin_top_left">
    		<div class="admin_title displayblock">海风车运营支持平台</div>
	    </div>
	</div> -->
	<div data-options="region:'west',split:true,title:'功能菜单'" style="width: 200px; overflow: hidden;">
 		<!-- 功能树 -->
		<ul id="navigatorTree" >
			<li data-options="iconCls:'icon-tip',attributes:{'url':'${ctx}/alarm.do'}"><strong>到位告警</strong></li>
			<li data-options="iconCls:'icon-redo',attributes:{'url':'${ctx}/trajectoryReconstruction.do'}"><strong>轨迹重构</strong></li>
			<li data-options="iconCls:'icon-search',attributes:{'url':'${ctx}/associationAnalysis.do'}"><strong>关联分析</strong></li>
   		</ul>
	</div>
	<!-- 正中间panel -->
	<div data-options="region:'center',border:false">
	   <div id="mainContent" data-options="region:'center',border:false,fit:true" class="easyui-tabs">
			<div title="<strong>欢迎页</strong>" data-options="closable:false"> 
				<div style="margin-top:20px;">
					<h3>你好，欢迎来到车辆轨迹分析系统</h3>
				</div>
			</div> 
    	</div>  
    </div>
   	<!-- 正下方panel -->
    <div data-options="region:'south'" class="mainframe_foot tree-node-hover">
    		&copy;版权所有
    </div> 
</body>
</html>