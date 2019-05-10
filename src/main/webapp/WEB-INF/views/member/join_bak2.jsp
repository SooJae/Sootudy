<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

  <div style="margin: 0 auto; max-width:330px;">
  <!-- section : 본문역할 -->
  <div class="card">
  <div class="card-body"> 
  <h3 class="mb-4 form-head">회원가입</h3>
    <form class="formCheck" method="post" action="/member/join" id="joinForm" name="userInfo" onsubmit="return checkJoinForm();">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <div class="form-group" id="idForm">
        <label for="id">아이디를 입력해주세요(영어+숫자조합 4~10자)</label>
        <input type="text" id="id" name="memberID" class="form-control" maxlength="10" size="10" >   
        <i></i>
      </div>
      <div class="form-group" id="nickNameForm">
        <label for="nm">닉네임을 입력해주세요 (2~8자)</label>
        <input type="text" id="nm" name="memberNickName" class="form-control" maxlength="8" size="8"> 
        <i></i>
      </div>
      <div class="form-group" id="pwForm">
        <label for="pw">비밀번호를 입력해주세요 (8~16자)</label>
        <input type="password" id="pw" name="memberPW" class="form-control valid" maxlength="16" size="16">
        <i></i>
      </div>
      <div class="form-group" id="pw2Form">
        <label for="pw2">비밀번호를 확인해주세요</label>
        <input type="password" id="pw2" name="memberPW2" class="form-control"  maxlength="16" size="16">
        <i></i>
      </div>
      <div class="form-group" id="emailForm">
        <label for="email">이메일을 입력해주세요</label>
        <input type="text" id="email" name="memberEmail" class="form-control">
        <i></i>
        <small id="emailHelp" class="form-text text-muted">이메일은 비밀번호 찾기에 사용됩니다</small>
        
      </div>
      
        <button type="submit" id="btn1" class="btn btn-secondary btn-lg btn-block mt-5">회원가입</button>
      <button type="button" id="btn2" class="btn btn-success btn-lg btn-block mt-3" onclick="changeForm(1)">로그인</button>
    </form>
  </div>
  </div>
</div>
    
    
    
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/dist/js/sj.js"></script>
<script>
$(function(){
	
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";


//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
	$(document).ajaxSend(function(e, xhr, options){
	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
//디바운싱을 위한 타이머 설정
var timer;
		$(".formCheck").keyup(function(e){
			if (timer) {
			    clearTimeout(timer);
			  }
 timer = setTimeout(function() { 		
			var focus = $(":focus");
				joinCheckService.checkForm(focus);
			},150); 
		});
	
		$(".btn-success").on("click", function(e){
			e.preventDefault();
			$("form").submit();
		});
		
		
});
</script>
