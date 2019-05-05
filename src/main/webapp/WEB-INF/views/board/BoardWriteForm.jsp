<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty sessionScope.sessionID}">
	<script>alert("로그인을 해주세요"); location.href="LoginForm.do";</script>
</c:if>
<meta charset="UTF-8">

 
 <script type="text/javascript">
/*  $(document).keypress(function(event) {
	    var keycode = event.keyCode || event.which;
	    if(keycode == '13') {
	        writeForm.submit();   
	    }
	}); */



        
        // 취소 버튼 클릭시 로그인 화면으로 이동
       function changeForm(val){
    	 	  if(val == "1"){
     	 	     location.href="LoginForm.do";
  	 	}
        }
        
    </script>
</head>
<body>
		<%-- <c:if test="${sessionScope.sessionID eq null}">
		<c:set var="fail" value="즐즐" scope="request"/>
			 	<c:redirect url="BoardListAction.bo"/>
		</c:if>	 --%>
            
<div class="container board-list m-full"">
	<!-- section : 본문역할 -->
	<div class="container board">
		<form method="post" name="writeForm" action="BoardWriteAction.bo" enctype="multipart/form-data">
	 		<input type="hidden" name="board_ID" value="${sessionScope.sessionID}">
	 		<input type="hidden" name="board_NickName" value="${sessionScope.sessionNickName}">
 			<div class="form-group">
 			<input class="form-control" type="text" maxlength="100" name="board_Title" id="formTitle" placeholder="글 제목을 입력하세요">
 			</div>
 			<div class="form-group">
 			<textarea name="board_Content" id="summernote"></textarea>
			</div>
 			<button type="submit" class="btn btn-success btn-lg btn-block mt-5" onclick="return checkWriteForm()">글 쓰기</button>
 		</form>
 	</div>
</div>
 
    <script>
 $(document).ready(function() {  
		
	    $('#summernote').summernote({
	    	  
	        height: ($(window).height() - 100),
	        lang: 'ko-KR', 
	      
	        toolbar: [
	  	        // [groupName, [list of button]]
	  	        ['style', ['style']],
	  	        ['font', ['bold', 'italic', 'underline', 'clear']],
	  	        ['fontname', ['fontname']],
	  	        ['fontsize', ['fontsize']],
	  	        ['color', ['color']],
	  	        ['insert',['picture','link','video']],
	  	        ['para', ['ul', 'ol', 'paragraph']],
	  	      ] ,
	        callbacks: {
	            onImageUpload: function(files,editor,welEditable) {
	                uploadImage(files[0], editor, welEditable);
	            }
	    		
	        }
	    });
	    
	    $(".note-icon-caret").remove();

	    function uploadImage(file, editor, welEditable) {
	        var data = new FormData();
	        data.append("image", file);
	        $.ajax({
	            url: 'ImageUploadAction.bo',
	            cache: false,
	            contentType: false,
	            processData: false,
	            data: data,
	            type: "post",
	            success: function(url) {
	                var image = $('<img>').attr({src: "../DDB/img/"+url});
	                $('#summernote').summernote("insertNode", image[0]);
	            },
	            error: function(data) {
	                console.log(data);
	            }
	        });
	    }
	});
</script>
	
	
	
</body>
</html>