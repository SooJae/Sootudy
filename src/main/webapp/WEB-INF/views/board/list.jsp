<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>
<!-- <style>

.board-list-body div{
  padding:0;
}
</style> -->

<!--     <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Data Tables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Data Tables</li>
            </ol>
          </div>
        </div>
      </div>
    </section> -->


<!-- section -->
<section class="container board-list m-full" style="text-align:center;">
  <div class="row board-list-head white in-visible row-no-padding ">
    <div class="col-md-1">번호</div>
    <div class="col-md-1">추천</div>
    <div class="col-md-6">제목</div>
    <div class="col-md-2">닉네임</div>
    <div class="col-md-1">날짜</div>
    <div class="col-md-1">조회</div>
  </div>
<c:forEach items="${list}" var="board">
 <div class="row board-list-body white">
  <div class="col-md-1 in-visible"><c:out value="${board.bno}"/></div>
  <div class="col-2 col-md-1"><span class="badge badge-pill badge-secondary">${board.bno}</span></div>
  <div class="col-10 col-md-6 ellipsis title" style="text-align:left; padding-left:0"><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/> <c:if test="${board.reply_cnt ne 0}">&nbsp;[ <c:out value="${board.reply_cnt}"/> ]</c:if></a></div>
  <div class="col-6 col-md-2 ellipsis" id="nick"><a href="#"><c:out value="${board.writer}"/></a></div>
  <div class="col-3 col-md-1" id="date"><fmt:formatDate pattern="hh:mm" value="${board.udt_dt}"/></div>
  <div class="col-3 col-md-1" id="count"><c:out value="${board.reply_cnt}"/></div>
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
      <input type="hidden" name="page" value='<c:out value="${pageMaker.cri.page}"/>'/>
	    <input type="hidden" name="perPageNum" value='<c:out value="${pageMaker.cri.perPageNum}"/>'/>
      <button class="btn btn-primary">검색</button>
     </div> 
  </form> 
</div> 
<!-- /search -->

<form id='actionForm' action="/board/list" method='get'>
  <%--  <input type="hidden" name="bname" value='<c:out value="${pageMaker.cri.bname}"/>'/> --%>
   <input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
   <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
   <input type="hidden" name="page" value='<c:out value="${pageMaker.cri.page}"/>'/>
   <input type="hidden" name="perPageNum" value='<c:out value="${pageMaker.cri.perPageNum}"/>'/>
</form>

<!-- navigation -->
<div class="row justify-content-between mt-3" >
  <div>
  <button type="button" class="btn btn-outline-danger" onclick="changeForm(2)" style="font-color:red"><i class="fas fa-sun"></i>인기글</button>
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

       <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
               처리가 완료되었습니다.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
   

   
  <%@ include file="../includes/footer.jsp" %>
 
<!--  <script>
 $(document).ready(function(){
     $('#sidebarCollapse').on('click', function(){
         $('#sidebar').addClass('active');
         $('.overlay').fadeIn();
     });
     $('.overlay').on('click',function(){
         $('#sidebar').removeClass('active');
         $('.overlay').fadeOut();
     });
 });
 </script> -->
 
 
<script>
  
  $(function(){
   var result = '<c:out value="${result}"/>';
   
   checkModal(result);
   
   history.replaceState({},null,null);
   
   function checkModal(result) {
     if(result ==='' || history.state){
       return;
     }
     if(result){
      // $(".modal-body").html("게시글 "+parseInt(result)+ "번이 등록되었습니다.");
       $(".modal-body").html(result);
     }
     $("#myModal").modal("show");
   }
   
   $("#regBtn").on("click", function(){
     self.location = "/board/register";
   });
   
   var actionForm = $("#actionForm");
   
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
   
   var searchForm =$("#searchForm");
   $("#searchForm button").on("click",function(e){
     e.preventDefault();
     
     if(!searchForm.find("option:selected").val()){
       alert("검색종류를 입력하세요");
       return false();
     }
     if(!searchForm.find("input[name='keyword']").val()){
       alert("키워드를 입력하세요");
       return false;
     }
     searchForm.find("input[name='page']").val("1");
     searchForm.submit();
     
   });
  });
</script>
