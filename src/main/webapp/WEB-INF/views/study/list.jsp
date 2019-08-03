<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>


<!--  breadcrumb -->
  <section class="container board-list m-full p-0">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>게시판</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">홈</a></li>
                <li class="breadcrumb-item active">스터디</li>
              </ol>
            </div>
          </div>
        </div>
      </section> 

<section class="container board-list m-full p-0">

<!--  -->





    <!-- Main content -->
    <div class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-body table-responsive-md p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 45%">
                                         스터디 명
                      </th>
                      <th style="width: 2%">
                                           인원
                      </th>
                      <th>
                                           진행 률
                      </th>
                      <th style="width: 10%">
                      </th>
                  </tr>
              </thead>
              <tbody class="study-body">
              
          <c:forEach items="${list}" var="study">     
                <tr>
              <td>
                     <a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a> 
                  <br/>
                  <small>
                      개설일 <fmt:formatDate pattern="YY-MM-dd" value="${board.udt_dt}"/>
                  </small>
              </td>
              <td>
                  3/10
              </td>
              <td class="project_progress">
                  <div class="progress progress-sm">
                      <div class="progress-bar bg-green" role="progressbar" aria-volumenow="57" aria-volumemin="0" aria-volumemax="100" style="width: 57%">
                      </div>
                  </div>
                  <small>
                      57% Complete
                  </small>
              </td>
              <td class="project-actions text-right">
                <a class="btn btn-info btn-sm" href="#">
                    <i class="fas fa-pencil-alt">
                    </i>
                    Edit
                </a>
            </td>
              </tr>
              </c:forEach>
              </tbody>
          </table>
          
          <!-- navigation -->
	<%-- 	<div class="row justify-content-between mt-3" >
		  <div>
		    <form id="bestForm">
		      <input type="hidden" name="filter_mode" value="<c:out value="${pageMaker.cri.filter_mode}"/>"/>
		      <c:choose>
		        <c:when test="${pageMaker.cri.filter_mode ne 'best'}">
		          <button type="button" class="btn btn-outline-danger" id="best" style="font-color:red"><i class="fas fa-sun"></i>인기글</button>
		        </c:when>
		        <c:otherwise>
		          <button type="button" class="btn btn-danger" id="best" style="font-color:red"><i class="fas fa-sun"></i>인기글</button>
		        </c:otherwise>
		      </c:choose>
		      
		    </form>
		  </div> --%>
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
          
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </div>
    <!-- /.content -->



                 <!--  <tr>
                      <td>
                          <a>
                              스프링 공부
                          </a>
                          <br/>
                          <small>
                              개설일 01.01.2019
                          </small>
                      </td>
                      <td>
                          3/10
                      </td>
                      <td class="project_progress">
                          <div class="progress progress-sm">
                              <div class="progress-bar bg-green" role="progressbar" aria-volumenow="57" aria-volumemin="0" aria-volumemax="100" style="width: 57%">
                              </div>
                          </div>
                          <small>
                              57% Complete
                          </small>
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              보기
                          </a>
                          <a class="btn btn-info btn-sm" href="#">
                              <i class="fas fa-pencil-alt">
                              </i>
                              수정
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
                              <i class="fas fa-trash">
                              </i>
                              삭제
                          </a>
                      </td>
                  </tr>
                  
                  
                  
                  <tr>
                      <td>
                          <a>
                              AdminLTE v3
                          </a>
                          <br/>
                          <small>
                              Created 01.01.2019
                          </small>
                      </td>
                      <td>
                            0/30
                      </td>
                      <td class="project_progress">
                          <div class="progress progress-sm">
                              <div class="progress-bar bg-green" role="progressbar" aria-volumenow="47" aria-volumemin="0" aria-volumemax="100" style="width: 47%">
                              </div>
                          </div>
                          <small>
                              47% Complete
                          </small>
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="#">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <a>
                              AdminLTE v3
                          </a>
                          <br/>
                          <small>
                              Created 01.01.2019
                          </small>
                      </td>
                      <td>
                      
                        50/100
                      </td>
                      <td class="project_progress">
                          <div class="progress progress-sm">
                              <div class="progress-bar bg-green" role="progressbar" aria-volumenow="77" aria-volumemin="0" aria-volumemax="100" style="width: 77%">
                              </div>
                          </div>
                          <small>
                              77% Complete
                          </small>
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="#">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                      </td>
                  </tr> -->



</section>

<script type="text/javascript" src="/resources/dist/js/study.js"></script>

<script charset="UTF-8">

let studyTable = $(".study-body");

$(function(){
	


var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";
$(document).ajaxSend(function(e, xhr, options){
  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
}); 


  $("#regBtn").on("click", function(){
    self.location = "/board/register";
  });
  
  var actionForm = $("#actionForm");
  var bestForm = $("#bestForm");
  
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
  
  $("#best").on("click", function(e){
    e.preventDefault();
    
   // if(bestForm.find("input[value='best']")){
   if(bestForm.find("input[name='filter_mode']").val()==""){
      bestForm.find("input").attr("value","best");
      $(this).attr("class","btn btn-danger");
   }else{
     bestForm.find("input").attr("value","");
     $(this).attr("class","btn btn-outline-danger");
   }
    //}
    //else{
    //}
    
    /* else if(bestForm.find("input[name='filter_mode']").val("best")){
          console.log("메롱");
     }  */
   bestForm.submit();
  });
  var searchForm =$("#searchForm");
  $("#searchForm button").on("click",function(e){
    e.preventDefault();
    
    if(!searchForm.find("option:selected").val()){
      customAlert("fail","검색어 종류를 입력해주세요");
//       alert("검색종류를 입력하세요");
//       return false();
    }
    if(!searchForm.find("input[name='keyword']").val()){
      customAlert("fail","키워드를 입력해주세요");
    }
    searchForm.find("input[name='page']").val("1");
    searchForm.submit();
    
  });

});
</script>
<%@ include file="../includes/footer.jsp" %>