<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp" %>



  <section class="board-list study-get t-full" style="width:90%">
<!-- <section> -->
    <div class="wrapper row" style="margin:0;">
      <div class="hold-transition sidebar-mini layout-fixed col-lg-3" style="padding:0;">
        <!-- TO DO List -->
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              <i class="fas fa-tasks ml-2 mr-1"></i>
              To Do
            </h3>

            <!-- <div class="card-tools">
              <ul class="pagination pagination-sm">
                <li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
                <li class="page-item"><a href="#" class="page-link">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
              </ul>
            </div> -->
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <ul class="todo-list" data-widget="todo-list">


                <!-- todo text -->
              <li>
                <div class="custom-control custom-checkbox d-inline ml-2">
                  <input type="checkbox" class="custom-control-input" name="todo-check" id="customCheck" value="안녕" disabled>
                  <label class="custom-control-label" for="customCheck"></label>
                </div>

                <span class="text">Make the theme responsive</span>
                <small class="badge badge-info"><i class="far fa-clock"></i> 4 hours</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
                <div class="custom-control custom-checkbox d-inline ml-2">
                  <input type="checkbox" class="custom-control-input" name="todo-check" id="customCheck2" value="안녕2"
                    disabled>
                  <label class="custom-control-label" for="customCheck2"></label>
                </div>
                <span class="text">Let theme shine like a star</span>
                <small class="badge badge-warning"><i class="far fa-clock"></i> 1 day</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
                <div class="custom-control custom-checkbox d-inline ml-2">
                  <input type="checkbox" class="custom-control-input" name="todo-check" id="customCheck3" value="안녕3"
                    disabled>
                  <label class="custom-control-label" for="customCheck3"></label>
                </div>
                <span class="text">Let theme shine like a star</span>
                <small class="badge badge-success"><i class="far fa-clock"></i> 3 days</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
            </ul>
          </div>
          <!-- /.card-body -->
          <div class="card-footer clearfix">
              <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="할일을 적어주세요" name="todo-value">
                   <div class="input-group-append">
                   <button type="button" data-oper="todoWrite" class="btn btn-primary btns"><i class="fas fa-pencil-alt"></i>쓰기</button>
                   </div>
                </div>

            <button type="button" id="check-button" class="btn btn-info float-right"><i class="fas fa-check"></i>체크</button>
          </div>
        </div>
        <!-- /.card -->
      </div>


      <div class="col-lg-9 custom-chat">
        
        <section class="content t-full">
        
        
        <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title"> <c:out value="${study.title}"/></h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
             <div id="chat-card">
	              <div class="card-body">
	                <div class="chart">
	                  <canvas id="barChart" style="height:230px; min-height:230px"></canvas>
	                </div>
	              </div>
	              <!-- /.card-body -->
	               <div class="card-footer">
	                 <div class="input-group justify-content-end">
	                 <input type="hidden" name="sno" value='<c:out value="${study.sno}"/>' >
	                     <button type="button" class="send btn btn-primary" id="join-chat">스터디 채팅 참여</button>
	                 </div>
	              </div>
              <!-- /.card-footer-->
              </div>
            </div>
            <!-- /.card -->
        
        <%-- 
            <!-- DIRECT CHAT -->
            <div class="card card-primary direct-chat direct-chat-primary ">
              <div class="card-header" style="text-align:center;">
                <h3 class="card-title" ><c:out value="${study.title}"/></h3>

                <div class="card-tools">
                  <span data-toggle="tooltip" title="3 New Messages" class="badge bg-danger">3</span>
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Contacts"
                          data-widget="chat-pane-toggle">
                    <i class="fas fa-comments"></i></button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <c:out value="${study.content}"/>

              <!-- /.card-footer-->
              
              </div>
            </div>
            <!--/.direct-chat -->
            
             --%>
            
          </section>
          <!-- /.col -->

        </div>
          <!-- Default box -->
          <!-- <div class="card">
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
                    <th style="width: 25%">
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="study">
                    <td>
                      <a>
                        스프링 공부
                      </a>
                      <br />
                      <small>
                        개설일 01.01.2019
                      </small>
                    </td>
                    <td>
                      3/10
                    </td>
                    <td class="project_progress">
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-green" role="progressbar" aria-volumenow="57" aria-volumemin="0"
                          aria-volumemax="100" style="width: 57%">
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
                      <br />
                      <small>
                        Created 01.01.2019
                      </small>
                    </td>
                    <td>
                      0/30
                    </td>
                    <td class="project_progress">
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-green" role="progressbar" aria-volumenow="47" aria-volumemin="0"
                          aria-volumemax="100" style="width: 47%">
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
                      <br />
                      <small>
                        Created 01.01.2019
                      </small>
                    </td>
                    <td>

                      50/100
                    </td>
                    <td class="project_progress">
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-green" role="progressbar" aria-volumenow="77" aria-volumemin="0"
                          aria-volumemax="100" style="width: 77%">
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
                  </tr>
                </tbody>
              </table>
            </div>
            /.card-body
          </div>
          /.card
 -->

          <!-- /.content -->


      </div>
   </section>
<script type="text/javascript" src="/resources/dist/js/custom_chart.js"></script>
<script type="text/javascript" src="/resources/dist/js/study.js"></script>
<script>
    //ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
      var csrfHeaderName="${_csrf.headerName}";
      var csrfTokenValue="${_csrf.token}";
      $(document).ajaxSend(function(e, xhr, options){
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      }); 
      
      var sno ='<c:out value="${study.sno}"/>';
      var member='<c:out value="${study.member}"/>'
      
      $(".btns").on("click",function(e){
          e.preventDefault();
          
          var operation = $(this).data("oper");
          if(operation === "todoWrite"){
        	  todoVal = $("input[name='todo-value']").val();
              var todo = {
                      sno:sno,
                      todo:todo,
                      writer:writer
                  };  
             	  console.log(todoVal);
          } 

        });
      
      var study = {
    		  sno:sno,
    		  member:member
    		  }
    
      $("#join-chat").on("click",function(e){
    	  e.preventDefault();
    	  
    	  studyService.join(study,function(result){
    		  
    		  
    		  
    		  var chatForm_str = '<div class="direct-chat-messages chat-box" id="custom-chat" onscroll="custom_chat_scroll()"> </div>';
              chatForm_str += '<div class="card-footer"><div class="input-group"><input type="text" name="message" onkeydown="if (event.keyCode == 13) sendMsg()" class="form-control">';
              chatForm_str += '<span class="input-group-append"><button class="send btn btn-primary" type="submit" onclick ="sendMsg()">쓰기</button></span></div></div>';
         
         
          $("#chat-card").html(chatForm_str);
    		  
    	  },alert("채팅방에 입장할 수 없습니다."));
    	 
    	  
    	  
    	  
    	 
      });

      

        	for(i =0; i<4; i++){
        		  var str = "";
        		      str+='<li><div class="custom-control custom-checkbox d-inline ml-2">';
        		      str+='<input type="checkbox" class="custom-control-input" name="todo-check" id="customCheck'+[i]+'" value="안녕" disabled>';
        		      str+='<label class="custom-control-label" for="customCheck'+[i]+'"></label></div>';
        		      str+='<span class="text">Make the theme responsive</span>';
        		      str+=' <small class="badge badge-info"><i class="far fa-clock"></i> 4 hours</small>';
        		      str+=' <div class="tools"><i class="fas fa-edit"></i><i class="fas fa-trash-o"></i> </div></li>';
        		      
        	 $(".todo-list").append(str);
        	}
        	
        	

        	
        	
            var todoCheck = {
                    sno:sno,
                };  
        	
        	
          $("input:checkbox[name='todo-check']").on("click", function (e) {

            if ($(this).is(":checked")) {
              $(this).prop("checked", true);
              $(this).parent().parent().attr("class", "done");
              //$(this)
            } else {
              $(this).prop("checked", false);
              $(this).parent().parent().removeAttr("class");
            }
            // $(this).attr("checked",true);

          });

          // $("button").on("click",function(){
          //   $("ul li").each(function(index,item){
          //     $(item).addClass("done");
          //   })
          // });

          $("#check-button").on("click", function (e) {
            if ($("#check-button").hasClass("active")) {
              $(this).removeClass("active");
              $(this).html(` <i class="fas fa-check"></i> 체크`);
              $("ul li input[name='todo-check']").each(function (i, check) {
                $(check).attr("disabled", "disabled");
              });
            } else {
              $(this).addClass("active");
              $(this).html(`<i class="fas fa-check"></i> 완료`);
              $("ul li input[name='todo-check']").each(function (i, check) {
                $(check).removeAttr("disabled");
              });
            }
          });

</script>

<%@ include file="../includes/footer.jsp" %>
