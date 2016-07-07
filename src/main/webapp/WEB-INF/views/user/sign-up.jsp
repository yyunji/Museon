<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/meta.jsp" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>
<title>Insert title here</title>
</head>
<body>

<form action="${ctx }/signProc" method="post">

   <h1>회원가입 테스트</h1>
   <div class="signup-form form-group">
      <label for="">아이디*</label>
      <input type="text" name="userId" class="form-control" placeHolder="아이디를 입력해주세요."/>
   </div>
   <div class="signup-form form-group">
      <label for="">비밀번호*</label>
      <input type="password" name="userPw" class="form-control" placeHolder="비밀번호를 입력해주세요."/>
   </div>
   <div class="signup-form form-group">
      <label for="">비밀번호 확인*</label>
      <input type="password" name="checkPw" class="form-control" placeHolder="비밀번호를 한번더 입력해주세요."/>
   </div>
   
   <div class="signup-form form-group">
      <label for="">이름*</label>
      <input type="text" name="userName" class="form-control" placeHolder="이름을 입력해주세요."/>
   </div>
   
   <div class="btn-wrap">
      <button type="submit" class="btn btn-primary">회원가입</button>
      <button type="button" class="btn btn-default">취소</button>
   </div>

</form>
<jsp:include page="/WEB-INF/views/include/common-lib.jsp"></jsp:include>


<script type="text/javascript">

</script>

</body>
</html>