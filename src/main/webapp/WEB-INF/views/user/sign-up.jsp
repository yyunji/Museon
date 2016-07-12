<%@page import="com.museon.Common.MuseonCommon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/meta.jsp" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>

<link href="${ctx }/css/user/signup.css" rel="stylesheet">
<title><%= MuseonCommon.appName %> - 회원가입</title>
</head>
<body>

<div id="wrap">
	<div id="header">
		<h1>MEMBER SINGUP</h1>
	</div>
	
	<div id="container">
	   <div class="content">
	      <div class="signup-wrap">
	         <div class="signup-title">
	                   회원가입
	           <em></em>
	         </div>
	         <form action="" class="form-horizontal">
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">아이디</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userId" id="userId" placeholder="아이디를 입력해주세요.">
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">비밀번호</lable>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control userPw" id="userPw" placeholder="비밀번호를 입력해주세요.">
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">비밀번호 확인</lable>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control pwCheck" class="pwCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">이름</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userName" id="userName" placeholder="아이디를 입력해주세요.">
	               </div>
	            </div>
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">이메일</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
	               </div>
	            </div>
	            
	            <div class="btn-wrap">
	               <button type="button" class="btn btn-orangecolor btn-lg btn-block">회원가입</button>
	               <button type="button" class="btn btn-default btn-lg btn-block" onclick=" location.href='${ctx}/' ">뒤로가기</button>
	            </div>
	         </form>
	      </div>
	   </div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/common-lib.jsp"></jsp:include>


<script type="text/javascript">
<<<<<<< HEAD
=======

>>>>>>> 1f55b7da6b8d4b90341f60020cbc6c4983aebaf9
var $form = $(".signup-wrap form"),
	$input = $form.find("input");
	
	console.log( $input );
	
	$input.on("blur", function ( event ) {
		validation( $(this) );
	});
<<<<<<< HEAD
=======

>>>>>>> 1f55b7da6b8d4b90341f60020cbc6c4983aebaf9
function validation ( type ) {
	
	if ( type.hasClass( "userId" ) ) {
		console.log( "아이디" );
	}
	else if ( type.hasClass("userEmail") ) {
		var splitStr = type.val().split("@");
		
		if ( ( splitStr.length > 2 || splitStr.length < 2 ) || splitStr[1].length < 1) {
			console.log( "이메일 잘못 입력" )
		}
	}
}
<<<<<<< HEAD
=======

>>>>>>> 1f55b7da6b8d4b90341f60020cbc6c4983aebaf9
</script>

</body>
</html>