<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sootudy</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Sidebar CSS -->
<link rel="stylesheet" href="/resources/dist/css/sidebar.css">
<link rel="stylesheet" href="/resources/dist/css/custom.css">
<link rel="stylesheet" href="/resources/dist/css/study.css">
<link rel="stylesheet" href="/resources/dist/css/chat.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>

</head>


<style>
/* .far fa-user{
font-size : 0.95rem;
} */
.m-p{
color:white;
}
</style>

<body>
  <div class="wrapper">
     <div class="overlay"></div>
     <nav id="sidebar">
         <div class="sidebar-header">
             <h3>수터디</h3>
         </div>

         <ul class="list-unstyled components">
             <sec:authorize access ="isAnonymous()">
              <p class="m-p btnc" data-oper="login" >로그인을 해주세요</p>
             </sec:authorize>
              <sec:authorize access ="isAuthenticated()">
                <p class="m-p" style="font-size: 1.5rem; margin-left:10px;" ><i class="fas fa-user-circle"></i>
                <sec:authentication property="principal.username"/>
               </p> 
             </sec:authorize>
             <li class="active">
                 <a class="btnc" href="#" data-oper="board">게시판</a>
             </li>    
             <li >
                 <a class="btnc" href="#" data-oper="study">스터디</a>
             </li>
             <li >
                 <a class="btnc" href="#" data-oper="chat">채팅방</a>
             </li>
         </ul>

         <ul class="list-unstyled CTAs">
             <li>
	                 <a href="#" class="download">
                  <sec:authorize access ="isAuthenticated()">
	                   <span class="btnc" data-oper="logout">로그아웃</span>
                 </sec:authorize>
                 <sec:authorize access ="isAnonymous()">
                     <span class="btnc" data-oper="login">로그인</span>
                 </sec:authorize> 
                  </a>
             </li>
         </ul>
     </nav>

     
<!-- <div class="content"> -->
<div style="background-color:#0945b3;">
	 <nav class="navbar navbar-expand-lg navbar-dark mx-auto">
	
	<button type="button" id="sidebarCollapse" class="btn">
	    <i class="fa fa-align-justify" style="color:white;"></i> <span></span>
	</button>
	     <a class="navbar-brand" href="/" style="color: #fff; border: 1.5px solid; padding: 1.5px 10px 1.5px 10px; border-radius: 8px;">S</a> 
	      <button class="navbar-toggler" id="pc-navbar" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarNav">
	        <ul class="navbar-nav ">
	          <li class="nav-item">
	            <a class="nav-link btnc" href="#" data-oper="board">게시판</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link btnc" href="#" data-oper="study">스터디</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link btnc" href="#" data-oper="chat">채팅방</a>
	          </li>
	          </ul>
	          <ul class="nav navbar-nav ml-auto">
     
	          <li class="nav-item dropdown">
					    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="far fa-user"></i></a>
					    <div class="dropdown-menu dropdown-menu-right">
<!-- 					      <a class="dropdown-item" href="#">회원 설정</a> -->
					      <div class="dropdown-divider"></div>
					        <sec:authorize access ="isAnonymous()">
  					       <a class="dropdown-item btnc" href="#" data-oper="login">로그인</a>
<!--   					       <button type="button" class="btn btnc btn-primary" data-oper="login"><i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</button> -->
								  </sec:authorize>
								  <sec:authorize access ="isAuthenticated()">
  					       <a class="dropdown-item btnc" href="#" data-oper="logout">로그아웃</a>
								  </sec:authorize>
					    </div>
					  </li>
					     </ul>
					  
	        </ul>
	      </div>
	    </nav>
</div>
	    
	<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
 
<div class="alertForm container mt-2">
<div class="alert alert-danger alert-custom" role="alert" ><strong></strong></div>
<div class="alert alert-success alert-custom" role="alert" ><strong></strong></div>

</div>


<script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script type="text/javascript" src="/resources/dist/js/chat.js"></script>
<script type="text/javascript" src="/resources/dist/js/chat_scroll.js"></script>
<script type="text/javascript">

var customAlert = function(flag,msg){
	if(flag === "fail"){
		$(".alert-danger strong").html(msg);
		$(".alert-danger").show();
		 $("html, body").stop().animate({scrollTop: 0}, 100); 
	}else{
		  $(".alert-success strong").html(msg);
		  $(".alert-success").show();
		  $("html, body").stop().animate({scrollTop: 0}, 100); 
	  }
}

$(function(){
	$(".btnc").on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		var loc;
		if(operation === "board"){
			loc = "/board/list";
		} else if(operation ==="study"){
			loc = "/study/list";
		} else if(operation ==="chat"){
			loc = "/chat/room";
		} else if(operation ==="login"){
     		loc = "/member/login"; 
    } else if(operation ==="logout"){
    	$(this).html(`<form action="<c:url value='/member/logout'/>" method="POST">
                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                </form>`);
    	$(this).find("form").submit();
    	return;
     }
		self.location=loc;
	});
	
	
	var result = '<c:out value="${result}"/>';  
	var resultFlag = '<c:out value="${result.flag}"/>';
	var resultMsg = '<c:out value="${result.msg}"/>';
	
	
	checkAlert(result);
	
	history.replaceState({},null,null);
	
	
	function checkAlert(result) {
		
		  if(result ==='' || history.state){
		    return;
		  }
		   if(result){ 
			   
			   customAlert(resultFlag,resultMsg);
		   } 
		}
	
	
	$(".alert").on("click",function(){
		$('.alert').alert('close');
	});
}); 

</script>