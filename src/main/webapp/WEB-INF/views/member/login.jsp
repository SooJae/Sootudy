<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- right column -->
          <div class="col-md-12">
            <!-- general form elements disabled -->
					<div style="margin: 0 auto; max-width:340px;">
            <div class="card">
              <div class="card-body getbody">
                  
               <form role="form" action="/login" method="post">
					<fieldset>
					
				        <h3 class="mb-4 form-head">로그인</h3>
				      <div class="form-group">
				        <label>아이디를 입력해주세요.</label>
				        <input type="text" id="id" name="id" class="form-control" > 
				      </div>
				      <div class="form-group">
				        <label>비밀번호를 입력해주세요.</label>
				        <input type="password" id="pw" name="pw" class="form-control" >
				        <small id="emailHelp" class="form-text text-muted"><a href="CheckIDForm.do">비밀번호 찾기</a></small>
				      </div>
				      
				       
					  	<div class="checkbox">
					  		<label><input name="remember-me" type="checkbox">Remember Me</label>
					  	</div>
				      <button type="submit" class="btn btn-success btn-lg btn-block mt-4" onclick="return checkValue();">로그인</button> 
				      <button type="button" class="btn btn-secondary btn-lg btn-block mt-3" id="join">회원가입</button>
					  	<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
					
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
				  </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
        
        
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
    
    
    
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/dist/js/reply.js"></script>

<script>

$(function(){
	
	$(".btn-success").on("click", function(e){
		
		e.preventDefault();
		$("form").submit();
	});
	
	 $("#join").on("click", function(){
	     self.location = "/member/join";
	   });
});
</script>


<!-- 
<script type="text/javascript">
	var bnoValue='<c:out value="${board.bno}"/>';
	
 	replyService.add(
			{bno:bnoValue, replytext:"JS Test", replyer:"tester"}
			,
			function(result){
				alert("RESULT:"+result);
			});  
			
		
	replyService.getList({bno:bnoValue,page:1}, function(list){
	 		list.forEach(function(i){
				console.log(i);
				}
			); 
		});
			
	replyService.remove(22, function(count){
			console.log(count);
			if(count === "success"){
				alert("REMOVED");
			}
		}, function(err){
			alert("ERROR...");
		});
		
	replyService.update({
			rno : 24,
			bno : bnoValue,
			replytext : "Modified Reply..."
		}, function(result){
			alert("수정완료");
		});
	replyService.get(10,function(data){
		console.log(data);
	});
		
		
</script> 
-->

