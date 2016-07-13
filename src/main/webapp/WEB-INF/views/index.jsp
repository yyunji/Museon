<%@page import="com.museon.Common.MuseonCommon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= MuseonCommon.appName %> - Welcome MuseOn</title>

<%@include file="/WEB-INF/views/include/meta.jsp" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>
<link href="${ctx }/css/index.css" rel="stylesheet">

</head>
<body>

<div id="wrap">

	<div class="login-wrap">
	   <h1 class="logo">
	      <%@include file="/WEB-INF/views/svg/logo.jsp" %>
	   </h1>
	   
	   <div class="login-btn-wrap">
	      <button type="button" class="btn btn-maincolor btn-lg btn-block google-login">구글계정으로 로그인</button>
	      <button type="button" class="btn btn-maincolor btn-lg btn-block">페이스북계정으로 로그인</button>
	      <button type="button" class="btn btn-maincolor btn-lg btn-block" onclick=" location.href='${ctx}/signUp' ">회원가입</button>
	   </div>
	</div>
	<c:forEach items="${test }" var="test">
		${test.user_id }
	</c:forEach>
	


</div>


<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript" src="${ctx }/js/common.js"></script>
<script type="text/javascript">
</script>

</body>
</html>