<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 
<html>
<head>

 <script type="text/javascript">
        
        function doAction(value)
        {
            if(value == 0) // 목록
            	location.href="BoardListAction.bo?page=${pageNum}";
            else if(value == 1) // 수정
                location.href="BoardUpdateFormAction.bo?num=${board.board_Num}&page=${pageNum}";
        }


</script>


</head>
<body>
<div class="container board-whole m-full white">
 <div class="container board-detail">
<!-- 			<div class="row board-head in-visible row-no-padding"> -->
			<div class="row board-detail-head pb-3 pt-3">
				<div class="col-12 col-md-12"><h3>${board.board_Title}</h3></div>
			</div>
			<div class="row board-detail-headbt">
				<div class="col-6 col-md-2" style="font-weigth:bold; text-alingh:left;"><i class="fas fa-user-circle"></i>${board.board_NickName}</div>
				<div class="col-6 col-md-4"><i class="far fa-clock"></i> ${board.board_Date.substring(5,16)}</div>
				<div class="col-md-2"></div> 
				<div class="col-9 col-md-2 " style="text-align:right"><i class="far fa-eye"></i> ${board.board_Count}</div>
				<div class="col-3 col-md-2" style="text-align:right"><i class="fas fa-sun"></i>${board.board_Hit}</div>
			</div>
			<div class="row board-detail-body" style="min-height:300px;">
				<div class="board-content">
			${board.board_Content}
		 	<!-- <i class="fas fa-star"></i><i class="far fa-star"></i><i class="fas fa-star-half-alt"></i><i class="fas fa-trash-alt"></i>
			<i class="far fa-image fa-rotate-90"></i><i class="fas fa-image"></i> 댓글 <i class="fas fa-reply fa-rotate-180"></i>
			<i class="far fa-star"></i><i class="fas fa-star-half-alt"></i><i class="fas fa-burn"></i>
			<i class="fas fa-cloud-rain"></i><i class="fas fa-cloud-sun"></i>
			<i class="fas fa-fire"></i><i class="far fa-gem"></i><i class="fas fa-tint"></i><i class="fas fa-sun"></i> <i class="fab fa-hotjar"></i> <br>
			<i class="fas fa-cloud-sun"></i><i class="fas fa-cloud-moon"></i> 
			<i class="fas fa-sun"></i> -->
				</div>
			</div>
			<!-- <div class="row vote-btn pb-5 mb-5">
					<button type="button" class="btn btn-outline-danger btn-lg" style="margin: 0 auto;" onclick="hit();"><i class="fas fa-fire"></i> 추천</button>
			</div> -->
			<div class="row vote-btn p-3">
					<button type="button" class="btn btn-outline-danger btn-lg" style="margin: 0 auto;" onclick="hit();"><i class="fas fa-fire"></i> 추천</button>
			</div>
			
<%-- 			<div class="row board-detail-bottom justify-content-end p-1">
				<div>
				 <button type="button" class="btn btn-outline-dark btn-sm" onclick="javascript:location.href='BoardListAction.bo?page=${pageNum}'">&nbsp;목록</button>
				</div>
				<div class="pr-2">
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="doAction(0)"><i class="far fa-edit"></i>&nbsp;수정</button>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="boDeleteOpen()"><i class="far fa-trash-alt"></i>&nbsp;삭제</button>
				</div>
			</div> --%>
			<div class="row board-detail-bottom p-1">
				<div>
				 <button type="button" class="btn btn-outline-dark btn-sm" onclick="doAction(0);"><i class="fas fa-clipboard-list"></i>&nbsp;목록</button>
				</div>
				<div class="ml-auto">
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="doAction(1);"><i class="far fa-edit"></i>&nbsp;수정</button>
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="boDeleteOpen();"><i class="far fa-trash-alt"></i>&nbsp;삭제</button>
				</div>
			</div>
			
			
			<c:if test="${requestScope.commentList != null}">
        <c:forEach var="comment" items="${requestScope.commentList}">
        
        <div style="font-size:14px" class="m-2 mb-2">
			<div class="row">
			<div class="comment-header p-2 col-4" style="border-top-left-radius: 4px;" >
                        ${comment.comment_ID}
                        </div>
             <div class="comment-header p-2 col-8" style="border-top-right-radius: 4px; text-align:right;">
                    <c:if test="${comment.comment_ID == sessionScope.sessionID}">
                        <a href="#" onclick="cmDeleteOpen(${comment.comment_Num})">삭제</a>
                    </c:if>        
                        ${comment.comment_Date.substring(5,16)}
             </div>
             <div class="col-12 comment-body p-2">
                        ${comment.comment_Content}
             </div>    
             </div>
             
             </div>
        </c:forEach>
    </c:if>
			
			<div>
			</div>
</div>





    <c:choose>
     <c:when test="${sessionScope.sessionNickName eq null}">
         <div class="alert alert-primary" role="alert" style="text-align:center;"><a href="LoginForm.do" class="alert-link">로그인을 한 뒤에 댓글을 작성 하실 수 있습니다</a></div>
	</c:when>
	<c:otherwise>
		 <form id="writeCommentForm">
            	 <input type="hidden" name="comment_board" value="${board.board_Num}">
						<div class="input-group mt-3">
						
 					 <input type="text" class="form-control" id="cmt" name="comment_content" placeholder="댓글을 입력해주세요" >
 						 <div class="input-group-append">
    					<button type="button" class="btn btn-primary" onclick="writeCmt(); return false;"><i class="fas fa-pencil-alt"></i></button>
 			 			</div>
						</div>
			</form>
	</c:otherwise>
	</c:choose>
    
    
</div>

<script>


$(function(){
	  $("#writeCommentForm").keypress(function(e){
	    if(e.which == 13) {
	    	writeCmt();
	    	e.preventDefault();
	    }
	  })
	})

// 추천
function hit(){
	var board_num = ${board.board_Num};
	var sessionID = "${sessionScope.sessionID}";
	
	$.ajax({
		type:"POST",
		url: "BoardHitAction.bo",
		cache: false,
		data:{board_num:board_num, sessionID:sessionID}, //{"board":"값", "id":"값", "content"="값"}으로 전달 됨
		success: function(result){
			if(result == 1){ 
				document.location.reload();
			} else{
				checkHit();
			}
		}
	});
	
}



	
	
	
// 댓글 등록
function writeCmt()
{
    var form = document.getElementById("writeCommentForm");
    
    var board = "${board.board_Num}";
    var id = "${sessionScope.sessionID}";
    var nickName = "${sessionScope.sessionNickName}";
    var content = form.comment_content.value;
    
    if(!content)
    {
        alert("내용을 입력하세요.");
        return false;
    }
    else{
    	var obj = new Object();
    	
    	obj.comment_board = board;
    	obj.comment_id = id;
    	obj.comment_nickName = nickName;
    	obj.comment_content=content;

    	$.ajax({
    			type:"POST",
    			url: "CommentWriteAction.co",
    			dataType:"json",
    			cache: false,
    			data:obj, // {"board":"값", "id":"값", "content"="값"}으로 전달 됨
    			success: function(result){
    				if(result == 1){ 
    					document.location.reload();
    				} else{
    					
    					
    				}
    			}
    		});
    	
    }
   
}


function boDeleteOpen(){
	var msg = confirm("게시물을 삭제하시겠습니까?");
	
	if(msg == true){ // 확인을 누를경우
		 location.href="BoardDeleteAction.bo?num=${board.board_Num}&page=${pageNum}";
	    }
	    else{
	        return false; // 삭제취소
	    }
	
}


function cmDeleteOpen(comment_num){
    var msg = confirm("댓글을 삭제하시겠습니까?");    
    if(msg == true){ // 확인을 누를경우
        deleteCmt(comment_num);
    }
    else{
        return false; // 삭제취소
    }
}
	

function deleteCmt(comment_num)
{
    var comment_num = comment_num;
    
    $.ajax({
		type:"POST",
		url: "CommentDeleteAction.co",
		cache: false,
		data:{comment_num:comment_num}, //{"board":"값", "id":"값", "content"="값"}으로 전달 됨
		success: function(result){
			if(result == 1){ 
				document.location.reload();
			} else{
				checkDelete();
			}
		}
	});
}


</script>
</body>
</html>


