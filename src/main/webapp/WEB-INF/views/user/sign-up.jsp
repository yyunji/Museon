<<<<<<< HEAD
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
	                  <p class="text-danger hide">아이디를 입력해주세요.</p>
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">비밀번호</lable>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control userPw" id="userPw" placeholder="비밀번호를 입력해주세요.">
	                  <p class="text-danger hide">비밀번호를 입력해주세요.</p>
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">비밀번호 확인</lable>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control pwCheck" class="pwCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
	                  <p class="text-danger hide">비밀번호를 한번 더 입력해주세요.</p>
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">이름</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userName" id="userName" placeholder="이름을 입력해주세요.">
	                  <p class="text-danger hide">이름을 입력해주세요.</p>
	               </div>
	            </div>
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">이메일</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
	                  <p class="text-danger hide">이메일을 입력해주세요.</p>
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
function validation ( input ) {
	var validate_state = true;
	validate_state = showErrorMsg( input );
	
	if ( !validate_state ) {
		return false;
	}
	
	console.log( validate_state );
	
	if ( input.hasClass( "userId" ) ) {
		$.ajax({
			cache : false,
			async : false,
			url : ctx + "/idCheck",
			method : "post",
			data : {
				userId : input.val()
			}
		}).done ( function ( response ) {
			checkNum = response;
		}).fail ( function ( error ) {
			
		});
		
		if ( checkNum > 0 ) {
			input.next().text("이미 사용중인 아이디입니다.");
			return false;
		}
		
	} else if ( input.hasClass( "userPw" ) ) {
		if ( input.val() == null || input.val() === "" ) {
			console.log( "비밀번호 잘못 입력" );
			return false;
		}
	} else if ( input.hasClass( "pwCheck" ) ) {
		if ( input.val() == null || input.val() === "" ) {
			return false;
		}
		
		if ( input.val() !== $form.find( ".userPw" ).val() ) {
			console.log( "비밀번호 다름" );
		}
		console.log( $form.find( ".userPw" ) );
	} else if ( input.hasClass( "userEmail" ) ) {
		var splitStr = input.val().split("@");
		
		if ( ( splitStr.length > 2 || splitStr.length < 2 ) || splitStr[1].length < 1) {
			console.log( "이메일 잘못 입력" )
			return false;
		}
		
		$.ajax({
			cache : false,
			async : false,
			url : ctx + "/emailCheck",
			method : "post",
			data : {
				userEmail : input.val()
			}
		}).done ( function ( response ) {
			checkNum = response;
			console.log( response );
		}).fail ( function ( error ) {
			
		});
	}
}

$form.submit( function ( event ) {
	var submitState = true;
	submitState = submitValidation( $form );
	if ( !submitState ) {
		return false;
	}
	
	if ( checkNum > 0 ) {
		return false;
	}
	
	if ( $form.find(".userPw").val() !== $form.find(".pwCheck").val() ) {
		alert( "비밀번호가 맞지 않습니다." );
		return false;
	} 
	
	$.ajax({
		cache : false,
		url : ctx + "/signUpProcess",
		method : "post",
		data : {
			userId : $form.find(".userId"),
			userPw : $form.find(".userPw"),
			userName : $form.find(".userName"),
			userEmail : $form.find(".userEmail")
		}
	}).done ( function ( response ) {
		console.log( response );
	}).fail ( function ( error ) {
		
	});
	return false;
});

function showErrorMsg ( input, type ) {
	
	
	if ( input.hasClass( "userId" ) ) {
		if ( input.val() === null || input.val() === "" ) {
			input.next().text("아이디를 입력해주세요.")
		}
	}
	
	if ( input.hasClass( "pwCheck" ) ) {
		if ( input.val() === null || input.val() === "" ) {
			input.next().text("비밀번호를 한번 더 입력해주세요.")
		} else if ( input.val() !== $form.find( ".userPw" ).val() ) {
			input.val("").focus();
			input.next().addClass("show").removeClass("hide").text("비밀번호가 일치하지 않습니다.");
			return false;
		} else {
			input.next().addClass("hide").removeClass("show");
		}
	}
	
	if ( input.val() === null || input.val() === "" ) {
		input.next().addClass("show").removeClass("hide");
		return false;
	} else {
		input.next().addClass("hide").removeClass("show");
	}
	return true;
}

function submitValidation () {
	var formInput = $form.find("input"),
		submitState = true;
	
	for ( var i = 0; i < formInput.length; i++ ) {
		if ( $(formInput[i]).val() === null || $(formInput[i]).val() === "" ) {
			$(formInput[i]).next().addClass("show").removeClass("hide");
			submitState = false;
		} else {
			$(formInput[i]).next().addClass("hide").removeClass("show");
			submitState = true;
		}
	}
	return submitState;
}
</script>

</body>
=======
>>>>>>> b374bbd05a06a91976f6162cc5b73f07963026cb
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
	         <form action="${ctx }/signProc" class="form-horizontal" method="post" onSubmit="return false;">
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">아이디</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userId" id="userId" placeholder="아이디를 입력해주세요.">
	                  <p class="text-danger hide">아이디를 입력해주세요.</p>
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">비밀번호</lable>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control userPw" id="userPw" placeholder="비밀번호를 입력해주세요.">
	                  <p class="text-danger hide">비밀번호를 입력해주세요.</p>
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">비밀번호 확인</lable>
	               <div class="col-sm-10">
	                  <input type="password" class="form-control pwCheck" class="pwCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
	                  <p class="text-danger hide">비밀번호를 한번 더 입력해주세요.</p>
	               </div>
	            </div>
	            
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">이름</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userName" id="userName" placeholder="이름을 입력해주세요.">
	                  <p class="text-danger hide">이름을 입력해주세요.</p>
	               </div>
	            </div>
	            <div class="form-group">
	               <lable class="col-sm-2 control-label">이메일</lable>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
	                  <p class="text-danger hide">이메일을 입력해주세요.</p>
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
function validation ( input ) {
	var validate_state = true;
	validate_state = showErrorMsg( input );
	
	if ( !validate_state ) {
		return false;
	}
	
	console.log( validate_state );
	
	if ( input.hasClass( "userId" ) ) {
		$.ajax({
			cache : false,
			async : false,
			url : ctx + "/rest/idCheck",
			method : "POST",
			data : {
				userId : input.val()
			}
		}).done ( function ( response ) {
			checkNum = response;
		}).fail ( function ( error ) {
			
		});
		
		if ( checkNum > 0 ) {
			input.next().text("이미 사용중인 아이디입니다.");
			return false;
		}
		
	} else if ( input.hasClass( "userPw" ) ) {
		if ( input.val() == null || input.val() === "" ) {
			console.log( "비밀번호 잘못 입력" );
			return false;
		}
	} else if ( input.hasClass( "pwCheck" ) ) {
		if ( input.val() == null || input.val() === "" ) {
			return false;
		}
		
		if ( input.val() !== $form.find( ".userPw" ).val() ) {
			console.log( "비밀번호 다름" );
		}
		console.log( $form.find( ".userPw" ) );
	} else if ( input.hasClass( "userEmail" ) ) {
		var splitStr = input.val().split("@");
		
		if ( ( splitStr.length > 2 || splitStr.length < 2 ) || splitStr[1].length < 1) {
			console.log( "이메일 잘못 입력" )
			return false;
		}
		
		$.ajax({
			cache : false,
			async : false,
			url : ctx + "/rest/emailCheck",
			method : "POST",
			data : {
				userEmail : input.val()
			}
		}).done ( function ( response ) {
			checkNum = response;
			console.log( response );
		}).fail ( function ( error ) {
			
		});
	}
}

$form.submit( function ( event ) {
	event.preventDefault();
	var submitState = true;
	submitState = submitValidation( $form );
	if ( !submitState ) {
		return false;
	}
	
	if ( checkNum > 0 ) {
		return false;
	}
	
	if ( $form.find(".userPw").val() !== $form.find(".pwCheck").val() ) {
		alert( "비밀번호가 맞지 않습니다." );
		return false;
	} 
	
	$.ajax({
		cache : false,
		url : ctx + "/rest/signUpProcess",
		type : "POST",
		data : {
			userId : $form.find(".userId").val(),
			userPw : $form.find(".userPw").val(),
			userName : $form.find(".userName").val(),
			userEamil : $form.find(".userEmail").val()
		}
	}).done ( function ( response ) {
		console.log( response );
	}).fail ( function ( error ) {
		
	});
	
	return false;
});

function showErrorMsg ( input, type ) {
	
	
	if ( input.hasClass( "userId" ) ) {
		if ( input.val() === null || input.val() === "" ) {
			input.next().text("아이디를 입력해주세요.")
		}
	}
	
	if ( input.hasClass( "pwCheck" ) ) {
		if ( input.val() === null || input.val() === "" ) {
			input.next().text("비밀번호를 한번 더 입력해주세요.")
		} else if ( input.val() !== $form.find( ".userPw" ).val() ) {
			input.val("").focus();
			input.next().addClass("show").removeClass("hide").text("비밀번호가 일치하지 않습니다.");
			return false;
		} else {
			input.next().addClass("hide").removeClass("show");
		}
	}
	
	if ( input.val() === null || input.val() === "" ) {
		input.next().addClass("show").removeClass("hide");
		return false;
	} else {
		input.next().addClass("hide").removeClass("show");
	}
	return true;
}

function submitValidation () {
	var formInput = $form.find("input"),
		submitState = true;
	
	for ( var i = 0; i < formInput.length; i++ ) {
		if ( $(formInput[i]).val() === null || $(formInput[i]).val() === "" ) {
			$(formInput[i]).next().addClass("show").removeClass("hide");
			submitState = false;
		} else {
			$(formInput[i]).next().addClass("hide").removeClass("show");
			submitState = true;
		}
	}
	return submitState;
}
</script>

</body>
</html>