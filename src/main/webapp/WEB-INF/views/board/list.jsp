<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>


<!--  breadcrumb -->
<section class="container board-list m-full">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>게시판</h1>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">홈</a></li>
	              <li class="breadcrumb-item active">게시판</li>
	            </ol>
	          </div>
	        </div>
	      </div>
</section>


<!-- section -->

    
<section class="container board-list m-full" style="text-align:center;">
  <div class="row board-list-head white in-visible row-no-padding ">
<!--     <div class="col-md-1">번호</div> -->
    <div class="col-md-1">추천</div>
    <div class="col-md-5">제목</div>
    <div class="col-md-2">닉네임</div>
    <div class="col-md-3">날짜</div>
    <div class="col-md-1">조회</div>
  </div> 
<c:forEach items="${list}" var="board">
 <div class="row board-list-body white move" href='<c:out value="${board.bno}"/>'>
<%--   <div class="col-md-1 in-visible"><c:out value="${board.bno}"/></div> --%>
  <c:choose>
  
    <c:when test="${board.like_cnt eq 0}">
      <div class="col-2 col-md-1" style="color:lightgray;"><i class="fas fa-fire"></i> 0</div>
    </c:when>
    
    <c:otherwise>
      <div class="col-2 col-md-1" style="color:#0945b3;"><i class="fas fa-fire"></i> <c:out value="${board.like_cnt}"/></div>
    </c:otherwise>
    
  </c:choose>
  <div class="col-10 col-md-5 ellipsis title" style="text-align:left; padding-left:0"><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a> <span style="color:blue;"><c:if test="${board.reply_cnt ne 0}">&nbsp;&nbsp;[<c:out value="${board.reply_cnt}"/>]</c:if></span></div>
  <div class="col-6 col-md-2 ellipsis" id="nick"><a href="#"><c:out value="${board.writer}"/></a></div>
  <div class="col-3 col-md-3"><fmt:formatDate pattern="MM-dd HH:mm" value="${board.udt_dt}"/></div>
  <div class="col-3 col-md-1"><c:out value="${board.v_cnt}"/></div>
 </div>
</c:forEach>

<div class="mt-3">
  <form id="searchForm" action="/board/list" method="get">

    <div class="form-row justify-content-center">
      <select name="type">
        <option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목+내용</option>
        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목+작성자</option>
        <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목+내용+작성자</option>
      </select>
  
      <input type="text" size="20" name="keyword" class="form-control" style="width:10rem" value='<c:out value="${pageMaker.cri.keyword}"/>'/>&nbsp; 
     <%--  <input type="hidden" name="bname" value='<c:out value="${pageMaker.cri.bname}"/>'/> --%>
      
      <input type="hidden" name="filter_mode" value='<c:out value="${pageMaker.cri.filter_mode}"/>'/>
      <input type="hidden" name="page" value='<c:out value="${pageMaker.cri.page}"/>'/>
	    <input type="hidden" name="perPageNum" value='<c:out value="${pageMaker.cri.perPageNum}"/>'/>
      <button class="btn btn-primary">검색</button>
     </div> 
  </form> 
</div> 
<!-- /search -->

<form id='actionForm' action="/board/list" method='get'>
  <%--  <input type="hidden" name="bname" value='<c:out value="${pageMaker.cri.bname}"/>'/> --%>
  <input type="hidden" name="filter_mode" value='<c:out value="${pageMaker.cri.filter_mode}"/>'/>
   <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
   <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
   <input type="hidden" name="page" value='<c:out value="${pageMaker.cri.page}"/>'/>
   <input type="hidden" name="perPageNum" value='<c:out value="${pageMaker.cri.perPageNum}"/>'/>
</form>

<!-- navigation -->
<div class="row justify-content-between mt-3" >
  <div>
	  <form id="bestForm">
 	    <input type="hidden" name="filter_mode" value="<c:out value="${pageMaker.cri.filter_mode}"/>"/>
 	    <c:choose>
 	      <c:when test="${pageMaker.cri.filter_mode ne 'best'}">
  		    <button type="button" class="btn btn-outline-danger" id="best" style="font-color:red"><i class="fas fa-sun"></i>인기글</button>
 	      </c:when>
 	      <c:otherwise>
 	        <button type="button" class="btn btn-danger" id="best" style="font-color:red"><i class="fas fa-sun"></i>인기글</button>
 	      </c:otherwise>
 	    </c:choose>
		  
	  </form>
  </div>
<nav aria-label="...">
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
     <li class="page-item paginate_button previous"><a class="page-link" href="${pageMaker.startPage-1 }">&laquo;</a></li>
    </c:if>

    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }" >
     <li class="page-item paginate_button ${pageMaker.cri.page == num ? 'active': '' }"><a class="page-link" href="${num}">${num}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next}">
     <li class="page-item paginate_button"><a class="page-link" href="${pageMaker.endPage+1 }">&raquo;</a></li>
    </c:if>
 </ul>
</nav>
   <div>
    <button type="button" class="btn btn-primary" id="regBtn"><i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</button>
   </div>
</div>
<!-- ./navigation -->
</section>
<!--./section  -->


   
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/dist/js/board_like.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/moment.min.js"></script> -->
 

<script>



$(function(){
	
	
   $("#regBtn").on("click", function(){
     self.location = "/board/register";
   });
   
   var actionForm = $("#actionForm");
   var bestForm = $("#bestForm");
   
   $(".paginate_button a").on("click", function(e){
    e.preventDefault();
    actionForm.find("input[name='page']").val($(this).attr("href"));
    actionForm.submit();
   });
   
   $(".move").on("click", function(e){
	   
     e.preventDefault();
     actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
     actionForm.attr("action","/board/get");
     actionForm.submit();
   });
   
   $("#best").on("click", function(e){
	   e.preventDefault();
	   
	  // if(bestForm.find("input[value='best']")){
	  if(bestForm.find("input[name='filter_mode']").val()==""){
		   bestForm.find("input").attr("value","best");
		   $(this).attr("class","btn btn-danger");
	  }else{
		  bestForm.find("input").attr("value","");
	    $(this).attr("class","btn btn-outline-danger");
	  }
	   //}
	   //else{
	   //}
	   
	   /* else if(bestForm.find("input[name='filter_mode']").val("best")){
	         console.log("메롱");
	    }  */
	  bestForm.submit();
   });
   var searchForm =$("#searchForm");
   $("#searchForm button").on("click",function(e){
     e.preventDefault();
     
     if(!searchForm.find("option:selected").val()){
    	 customAlert("fail","검색어 종류를 입력해주세요");
//        alert("검색종류를 입력하세요");
//        return false();
     }
     if(!searchForm.find("input[name='keyword']").val()){
       customAlert("fail","키워드를 입력해주세요");
     }
     searchForm.find("input[name='page']").val("1");
     searchForm.submit();
     
   });
  });
</script>
