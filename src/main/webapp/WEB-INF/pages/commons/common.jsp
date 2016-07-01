<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="chrome=1; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/static/js/html5shiv.js" type="text/javascript"></script>
<![endif]-->
<link name="themesName" rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/themes/color.css" />
<script>
	baseContext = "<%=request.getContextPath()%>";
	function resetForm(formId){//重置表单
		$('#'+formId).form('reset');
	}
	/* $('[name="themesName"]').attr('href',baseContext+'/static/css/themes/'+(webJsUtils.getCookie('manager_theme')||'default')+'/easyui.css'); */
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/CommonUtils.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/jquery-extend.js"></script>
	
<!-- 测试数据 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/temp/jsonData.js"></script>
