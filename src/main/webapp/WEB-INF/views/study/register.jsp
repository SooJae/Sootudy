<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../includes/header.jsp" %>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}
.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content:center;
	text-align:center;
}
.uploadResult ul li img {
	width: 100px;
}
.uploadResult ul li span{
	color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
.bigPicture img {
	width:600px;
}



</style>


   <!-- Content Header (Page header) -->

 <!-- Main content -->
 <!--  breadcrumb -->
<section class="container board-list m-full">
        <div class="container-fluid">
            <div class="text-center">
              <h1>게시판</h1>
            </div>
        </div>
</section>
 
 <section>
 <div class="container board-whole m-full white">
			 <div class="container board-detail getbody" style="padding : 0px;">
			  <!-- section : 본문역할 -->
			  <div class="board-detail-body" style="border: 1px solid lightgray;">
			    <form method="post" role="form" action="/study/register">
				      <div class="form-group">
				       <input class="form-control" type="text" maxlength="100" name="title" placeholder="모임 이름을 적어주세요">
				      </div>
				      <div class="form-group">
				       <textarea class="form-control" rows="5" placeholder="모임에 대해 알려주세요" name="content"></textarea>
				      </div>
				         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				         <input type="hidden" name="leader" value='<sec:authentication property="principal.username"/>'>
				         <%-- <input type="hidden" name="bname" value="${pageMaker.cri.bname}"/> --%>
			           <div style="text-align:right"> 
			           <button type="button" id="list" class="btn btn-secondary btn-lg mt-2">취소</button>
			           <button type="submit" class="btn btn-primary btn-lg mt-2">만들기</button>
			           </div>
				        
			    </form>
			  </div>
			</div>
    </div>
    </section>
    <!-- section -->
    
    <%@ include file="../includes/footer.jsp" %>
<script>
$(function(){
	var formObj = $("form[role='form']");
	
	$("#list").on("click", function(e){
         self.location="list";
	});
	  
	  $("button[type='submit']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    
		if(!$("input[name='title']").val()){
			customAlert("fail","모임 명을 입력해주세요");
			return false;
		}else if(!$("textarea[name='content']").val()){
			customAlert("fail","모임 내용을 입력해주세요");
			return false;
		}
	    
		

	

	  
	  
});
</script>

