<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script type="text/javascript">
 


        // 취소 버튼 클릭시 로그인 화면으로 이동
function changeForm(val){
    	 	  if(val == "1"){
     	 	     location.href="BoardWriteForm.bo";
  	 		} else if(val=="2"){
  	 			location.href="BoardListAction.bo?boardMode=recommend";
  	 			}
		}
      
</script>
<style>


.board-list-body div{
	padding:0;
}
</style>
</head>
<body>

	
	<!-- section : 본문역할 -->
	<div class="container board-list m-full" style="text-align:center;">
			<div class="row board-list-head white in-visible row-no-padding ">
				<div class="col-md-1">번호</div>
				<div class="col-md-1">추천</div>
				<div class="col-md-6">제목</div>
				<div class="col-md-2">닉네임</div>
				<div class="col-md-1">날짜</div>
				<div class="col-md-1">조회</div>
			</div>
			
		<c:forEach var="board" items="${requestScope.list}">
            <div class="row board-list-body white">
            	<div class="col-md-1 in-visible">${board.board_Num}</div>
                 <div class="col-2 col-md-1"><span class="badge badge-pill badge-secondary">${board.board_Hit}</span></div>
    			 <div class="col-10 col-md-6 ellipsis title" style="text-align:left;">
                  <a href="BoardDetailAction.bo?num=${board.board_Num}&pageNum=${spage}">
                    ${board.board_Title}</a> <c:if test="${board.board_CommentCount ne 0}">&nbsp;[${board.board_CommentCount}]</c:if>
                    
                 </div>
                <div class="col-6 col-md-2 ellipsis" id="nick"><a href="#">${board.board_NickName}</a></div>
                <div class="col-3 col-md-1" id="date">${board.board_Date}</div>
                <div class="col-3 col-md-1" id="count">${board.board_Count}</div>
            </div>
       	 </c:forEach>
       	 
       	 
       	 <!-- 페이지 넘버 부분 -->
<div class="row justify-content-between mt-3" >

	<div>
 	<button type="button" class="btn btn-outline-danger" onclick="changeForm(2)" style="font-color:red"><i class="fas fa-sun"></i>인기글</button>
 	</div>
 	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
     <c:if test="${startPage != 1}">
            <a class="page-link" href='BoardListAction.bo?page=${startPage-1}' tabindex="-1"><</a>
        </c:if>
    </li>
     <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
            <c:if test="${pageNum == spage}">
                 <li class="page-item active disabled">
                 <a class="page-link" href="#">${pageNum}</a></li>
            </c:if>
            <c:if test="${pageNum != spage}">
                <li class="page-item"><a class="page-link" href='BoardListAction.bo?page=${pageNum}'>${pageNum}</a></li>
            </c:if>
        </c:forEach>
    
    <c:if test="${endPage != maxPage }">
    <a class="page-link" href='BoardListAction.bo?page=${endPage+1}'>></a>
        </c:if>
  </ul>
</nav>

 	 <div>
 		<button type="button" class="btn btn-primary" onclick="changeForm(1)"><i class="fas fa-pencil-alt"></i>&nbsp;글쓰기</button>
	 </div>
</div>

 <!--  검색 부분 -->

	<div id="searchForm" class="mt-3">
        <form>
        <div class="form-row justify-content-center">
            <select name="opt" class="form-control" style="width:7.5rem">
                <option value="0" selected>제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>
            <input type="text" size="20" name="condition" class="form-control" style="width:10rem"/>&nbsp; 
            <button type="submit" class="btn btn-primary">검색</button>
             </div> 
        </form> 
      </div> 
      
</div>


	
</body>
</html>