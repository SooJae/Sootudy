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
				        <input type="text" id="id" name="username" class="form-control" > 
				      </div>
				      <div class="form-group">
				        <label>비밀번호를 입력해주세요.</label>
				        <input type="password" id="pw" name="password" class="form-control" >
				        <small id="emailHelp" class="form-text text-muted"><a href="CheckIDForm.do">비밀번호 찾기</a></small>
				      </div>
				      
				       
					  	<div class="checkbox">
					  		<label><input name="remember-me" type="checkbox">로그인 상태 유지</label>
					  	</div>
				      <button type="submit" class="btn btn-success btn-lg btn-block mt-4" onclick="return checkValue();">로그인</button> 
				      <button type="button" class="btn btn-secondary btn-lg btn-block mt-3" id="join">회원가입</button>
					
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

function checkValue(){
    if(!$("#id").val()){
    	customAlert("fail","아이디를 입력해주세요");
    	return false;
  }
    else if(!$("#pw").val()){
    	customAlert("fail","비밀번호를 입력해주세요");
    	return false;
    }
}

	
$("#join").on("click", function(){
    self.location = "/member/join";
  });
</script>


