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

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

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
              <p class="m-p btnc" data-oper="login">로그인을 해주세요</p>
             </sec:authorize>
              <sec:authorize access ="isAuthenticated()">
                <p class="m-p" style="font-size: 1.5rem; margin-left:10px"><i class="fas fa-user-circle"></i>
                <sec:authentication property="principal.username"/>
               </p> 
             </sec:authorize>
             <li class="active">
                 <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                 <ul class="collapse list-unstyled" id="homeSubmenu">
                     <li>
                         <a href="#">home1</a>
                     </li>
                     <li>
                         <a href="#">home2</a>
                     </li>
                     <li>
                         <a href="#">home3</a>
                     </li>
                 </ul>
             </li>

             <li>
                 <a class="btnc" href="#" data-oper="board">게시판</a>
             </li>    

             <li>
                     <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Page</a>
                     <ul class="collapse list-unstyled" id="pageSubmenu">
                         <li>
                             <a href="#">page1</a>
                         </li>
                         <li>
                             <a href="#">page2</a>
                         </li>
                         <li>
                             <a href="#">page3</a>
                         </li>
                     </ul>
                 </li>
                 <li>
                     <a href="#">Services</a>
                 </li>
                 <li>
                     <a href="#">Contact Us</a>
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
             <li>
                 <a href="#" class="article">article</a>
             </li>
         </ul>
     </nav>

     
<!-- <div class="content"> -->
	 <nav class="navbar navbar-expand-lg navbar-dark">
	
	<button type="button" id="sidebarCollapse" class="btn">
	    <i class="fa fa-align-justify" style="color:white;"></i> <span></span>
	</button>
	     <a class="navbar-brand" href="#" style="color: #fff; border: 1.5px solid; padding: 1.5px 10px 1.5px 10px; border-radius: 8px; margin-left:8px;">S</a> 
	      <button class="navbar-toggler" id="pc-navbar" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <div class="collapse navbar-collapse justify-content-around" id="navbarNav">
	        <ul class="navbar-nav ">
	          <li class="nav-item">
	            <a class="nav-link btnc" href="#" data-oper="board">게시판</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link btnc" href="#" data-oper="study">스터디2</a>
	          </li>
	          
	         
	          <li class="nav-item dropdown">
					    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="far fa-user"></i></a>
					    <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">회원 설정</a>
					      <div class="dropdown-divider"></div>
					        <sec:authorize access ="isAnonymous()">
  					       <a class="dropdown-item btnc" href="#" data-oper="login">로그인</a>
								  </sec:authorize>
								  <sec:authorize access ="isAuthenticated()">
  					       <a class="dropdown-item btnc" href="#" data-oper="logout">로그아웃</a>
											<%-- <form id="logout" action='<c:url value='/member/logout'/>' method="POST">
											   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
											</form> --%>
								  </sec:authorize>
					    </div>
					  </li>
					  <%-- <sec:authorize access="isAnonymous()"> --%>
					  
	        </ul>
	      </div>
	    </nav>
	    
	<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
 
<%-- <c:if test="${!empty requestScope.fail||!empty requestScope.success}">
		<c:choose>
			<c:when test="${!empty requestScope.fail}">
				<c:set var="errorMsg" value="${requestScope.fail}"/>
			</c:when>
			<c:otherwise>
				<c:set var="successMsg" value="${requestScope.success}"/>
			</c:otherwise>
		</c:choose>
	</c:if>
	
	
	<c:choose>
		<c:when test="${!empty errorMsg}">
		<div class="container mt-2">
		 	<div class="alert alert-danger alert-dismissible show fade" id="dangerAlert" role="alert" style="text-align:center; padding:1%;">
			<strong>${errorMsg}</strong>
  
</div>
			</div> 
		</div>
		</c:when>
		<c:when test="${!empty successMsg}">
			<div class="container mt-2">
				<div class="alert alert-success alert-dismissible show fade" id="successAlert" role="alert" style="text-align:center; padding:1%;">
				<strong>${successMsg}</strong>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container mt-2">
				<div class="alert alert-danger alert-dismissible fade" id="dangerAlert" role="alert" style="text-align:center; padding:1%;">
				</div>
			</div>
		</c:otherwise>
	</c:choose> 
	 --%>
	 
 <%-- <c:if test="${!empty result}">  --%>
<div class="alertForm container mt-2">
<!-- 
	<div class="alert alert-danger alert-dismissible show" role="alert">
	
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	 -->
</div>
<%-- </c:if> --%>


<script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	
	$(".btnc").on("click",function(e){
		e.preventDefault();
		
		let operation = $(this).data("oper");
		console.log(operation);
		let loc;
		if(operation === "board"){
			loc = "/board/list";
		} else if(operation ==="study"){
			loc = "/study/list" ;
		} else if(operation ==="login"){
      loc = "/member/login"; 
    } else if(operation ==="logout"){
    	$(this).html(`<form action='<c:url value='/member/logout'/>' method="POST">
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
		  if(resultFlag === "false"){
			  var alert=`<div class="alert alert-danger fade show" role="alert" style="text-align:center; padding:1%;"> <strong>`+resultMsg+`<strong> <div>`;
		  }else{
			  var alert=`<div class="alert alert-success fade show" role="alert" style="text-align:center; padding:1%;"><strong>`+resultMsg+`<strong><div>`;
		  }
			  $(".alertForm").html(alert);
	   } 
	}

	$(".alert").on("click",function(){
		$('.alert').alert('close');
	})
}); 

</script>