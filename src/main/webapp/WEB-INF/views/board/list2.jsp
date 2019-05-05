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
            <h1>Data Tables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Data Tables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Hover Data Table</h3>
					
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>#번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>수정일</th>
                </tr>
                </thead>
                <tbody>
               	<c:forEach items="${list}" var="board">
               	<tr>
               	<td><c:out value="${board.bno}"/></td>
               	<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
               	<td><c:out value="${board.writer}"/></td>
               	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.dt}"/></td>
               	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.udt_dt}"/></td>
               	</tr>
               	</c:forEach>
                </tbody>
              </table>
               <!-- /.card-body -->
              	</div>
              	  <nav aria-label="...">
              <button type="button" id="regBtn" class="btn pull-left">글쓰기</button>
              <button type="button" id="regBtn" class="btn pull-right">글쓰기</button>
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item paginate_button previous"><a class="page-link" href="${pageMaker.startPage-1 }">&laquo;</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }" >
							<li class="page-item paginate_button"><a class="page-link ${pageMaker.cri.pageNum ==num ? 'active': '' }" href="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item paginate_button"><a class="page-link" href="${pageMaker.endPage+1 }">&raquo;</a></li>
						</c:if>
					</ul>
				</nav>
             <!-- /.card -->
              	 </div>
              </div>
          <!-- /.row -->
          </div>
	</section>

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
   
   <form id="actionForm" data-oper="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.12345}"/>
	<input type="hidden" name="amount" value="${pageMaker.cri.12345}"/>
   </form>
   
  <%@ include file="../includes/footer.jsp" %>
<script>
/*     
	$(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });  
  */
  
  
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
		
		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	 });
	 
  });
</script>
