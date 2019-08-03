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
              
              
              </tbody>
          </table>
          
          <div class="study-bottom"></div>
          <!-- pagenation -->
          <div class="study-footer"></div>
          
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

showStudyList(1);

function showStudyList(page){
	studyService.getList(page||1, 
      function(studyTotal, list){
        if(page==-1){
          page = Math.ceil(studyTotal/5.0);
          showList(page);
          return;
        }
      
       var tbody="";
        
        if(list == null || list.length==0){
        	studyTable.html("");
          
          return;
        }
        
        for(var i = 0, len = list.length||0; i<len; i++){
        	
        	tbody +=`<tr>
        	    <td>
        	        <a href="`+ list[i].sno +`" class="move">
        	            `+list[i].title+`
        	        </a>
        	        <br/>
        	        <small>
        	            개설일 `+studyService.displayTime(list[i].dt)+`
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
        	    </tr>`;
        	
        }
        studyTable.html(tbody);
        
        showReplyPage(studyTotal);
    }); // end function
  }
  
  
var page = 1;
var displayPageNum = 5;
let studyPagenation= $(".study-footer");
function showReplyPage(studyTotal){
  
  var endPage = Math.ceil(page / parseFloat(displayPageNum) ) * displayPageNum;
  var startPage = (endPage - displayPageNum) +1;
  
   console.log("studyTotal"+studyTotal);
  var realEnd = Math.ceil(studyTotal/10.0);
  
  if(realEnd < endPage ) {
    endPage = realEnd;
  }
	 var prev = startPage > 1;
	 var next = (endPage * 10) < studyTotal;
  
   var str = "<ul class='pagination justify-content-center'>";
   
   if(prev){
     str+= "<li class='page-item'><a class='page-link' href='"+(startPage -1)+"'>&laquo;</a></li>";
   }
   
   for(var i = startPage ; i <= endPage; i++){

     var active = page == i? "active":"";
     
     str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
   }
   
   if(next){
     str+= "<li class='page-item'><a class='page-link' href='"+(endPage + 1)+"'>&raquo;</a></li>";
   }
   
   str += "</ul></div>";
   
   console.log(str);
   
   studyPagenation.html(str);
      
}

studyPagenation.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPage = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPage);
       
       page = targetPage;
       
       showList(page);
     });

$(".move").on("click", function(e){
    
    e.preventDefault();
    actionForm.append("<input type='hidden' name='sno' value='"+ $(this).attr("href")+"'>");
    actionForm.attr("action","/list/get");
    actionForm.submit();
  });

});
</script>
<%@ include file="../includes/footer.jsp" %>