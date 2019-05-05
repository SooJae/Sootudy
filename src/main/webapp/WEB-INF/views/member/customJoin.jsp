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
    <form class="formCheck" method="post" action="MemberJoinAction.do" id="joinForm" name="userInfo" onsubmit="return checkJoinForm();">
      <div class="form-group" id="idForm">
        <label for="ID">아이디를 입력해주세요(영어+숫자조합 4~10자)</label>
        <input type="text" id="ID" name="memberID" class="form-control" style="ime-mode:inactive;" minlength="4" maxlength="12" size="12" >   
        <i></i>
      </div>
      <div class="form-group" id="nickNameForm">
        <label for="NickName">닉네임을 입력해주세요 (2~8자)</label>
        <input type="text" id="NickName" name="memberNickName" class="form-control"  minlength="2" maxlength="8" size="11"> 
        <i></i>
      </div>
      <div class="form-group" id="pwForm">
        <label for="PW">비밀번호를 입력해주세요 (8~16자)</label>
        <input type="password" id="PW" name="memberPW" class="form-control valid"  minlength="8" maxlength="16" size="16">
        <i></i>
      </div>
      <div class="form-group" id="pw2Form">
        <label for="PW2">비밀번호를 확인해주세요</label>
        <input type="password" id="PW2" name="memberPW2" class="form-control"   minlength="8" maxlength="16" size="16">
        <i></i>
      </div>
      <div class="form-group" id="emailForm">
        <label for="Email">이메일을 입력해주세요</label>
        <input type="text" id="Email" name="memberEmail" class="form-control">
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

<script type="text/javascript" src="/resources/dist/js/reply.js"></script>
<script type="text/javascript" src="/resources/dist/js/sj.js"></script>
<script>

$(function(){
	
	$(".btn-success").on("click", function(e){
		
		e.preventDefault();
		$("form").submit();
	});
});
</script>

