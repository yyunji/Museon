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
	         <form action="${ctx }/signProc" class="form-horizontal" method="post">
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
	               <button type="submit" class="btn btn-orangecolor btn-lg btn-block">회원가입</button>
	               <button type="button" class="btn btn-default btn-lg btn-block" onclick=" location.href='${ctx}/' ">뒤로가기</button>
	            </div>
	         </form>
	      </div>
	   </div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/common-lib.jsp"></jsp:include>

<script type="text/javascript">
var ctx = "${ctx }";
</script>

<script type="text/javascript">
var $form = $(".signup-wrap form"),
	$input = $form.find("input"),
	checkNum = 0;
	
	console.log( $input );
	
	$input.on("blur", function ( event ) {
		validation( $(this) );
	});
function validation ( type ) {
	
	if ( type.hasClass( "userId" ) ) {
		console.log( "아이디" );
		$.ajax({
			cache : false,
			async : false,
			url : ctx + "/idCheck",
			method : "post",
			data : {
				userId : type.val()
			}
		}).done ( function ( response ) {
			checkNum = response;
		}).fail ( function ( error ) {
			
		});
		
		console.log( checkNum );
		
		if ( checkNum > 0 ) {
			return false;
		}
		
	} else if ( type.hasClass( "userPw" ) ) {
		if ( type.val() === "" || type.val() == null ) {
			console.log( "비밀번호 잘못 입력" );
			return false;
		}
	} else if ( type.hasClass( "pwCheck" ) ) {
		if ( type.val() === "" || type.val() == null ) {
			return false;
		}
		
		if ( type.val() !== $form.find( ".userPw" ).val() ) {
			console.log( "비밀번호 다름" );
		}
		console.log( $form.find( ".userPw" ) );
	} else if ( type.hasClass( "userEmail" ) ) {
		var splitStr = type.val().split("@");
		
		if ( ( splitStr.length > 2 || splitStr.length < 2 ) || splitStr[1].length < 1) {
			console.log( "이메일 잘못 입력" )
		}
	}
}

$form.submit( function ( event ) {
	if ( checkNum > 0 ) {
		return false;
	}
	
	console.log( "submit" );
	console.log( ctx );
	
	$.ajax({
		cache : false,
		url : ctx + "/signProc",
		method : "post"
	}).done ( function ( response ) {
		console.log( response );
	}).fail ( function ( error ) {
		
	});
	return false;
});
</script>

</body>
</html>