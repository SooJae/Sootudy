<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>General Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">General Form</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- right column -->
          <div class="col-md-12">
            <!-- general form elements disabled -->
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">General Elements</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body getbody">
                  
               <form role="form" action="/login" method="post">
					<fieldset>
						<div class="form-group">
					 	 <input class="form-control" placeholder="아이디 입력" name="username" type="text" autofocus>
					 	 
					  	</div>
						<div class="form-group">
					 	 <input class="form-control" placeholder="비밀번호 입력" name="password" type="password" >
					  	</div>
					  	<div class="checkbox">
					  		<label><input name="remember-me" type="checkbox">Remember Me</label>
					  	</div>
					  	<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
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

