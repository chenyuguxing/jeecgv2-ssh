<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Jeecg Framework</title>
<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript">
$(function() {
	var sessionInfo_loginName = '${sessionInfo.loginName}';
	var sessionInfo_ip = '${sessionInfo.ip}';
	if (sessionInfo_loginName && sessionInfo_ip) {
		//alert(sessionInfo_loginName);
	}else{
		window.location.href = "login.jsp";
	}
});

</script>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="north" class="logo" style="height:60px;overflow: hidden;" href="layout/north.jsp"></div>
	<!--<div region="east" title="当前日期" split="true" collapsed="false" style="width:200px;overflow: hidden;" href="layout/east.jsp"></div>
	--><div region="center" title=" J2EE Code Generation Framework For Intelligent Development" style="overflow: hidden;" href="layout/center.jsp"></div>
	<div region="west" title="功能导航" split="false" style="width:200px;overflow: hidden;" href="layout/west.jsp"></div>
	<div region="south" style="height:20px;overflow: hidden;" href="layout/south.jsp"></div>
	<jsp:include page="isIe.jsp"></jsp:include>
	<input type="hidden" id="top" name="top"/>
</body>
</html>