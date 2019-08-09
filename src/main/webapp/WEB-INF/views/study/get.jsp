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
                   <button type="button" data-oper="todoWrite" class="btn btn-primary btns"><i class="fas fa-pencil-alt"></i> 쓰기</button>
                   </div>
                </div>

            <button type="button" id="check-button" class="btn btn-info float-right"><i
                class="fas fa-check"></i>체크</button>
          </div>
        </div>
        <!-- /.card -->
      </div>


      <div class="col-lg-9 custom-chat">

        <!-- Main content -->
        <div class="content t-full">
        
           <!-- DIRECT CHAT -->
            <div class="card direct-chat direct-chat-primary">
              <div class="card-header">
                <h3 class="card-title"><i class="fas fa-comments"></i> 스터디 챗</h3>

                <div class="card-tools">
                  <span data-toggle="tooltip" title="3 New Messages" class="badge badge-primary">3</span>
                  <button type="button" class="btn btn-tool" data-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Contacts"
                          data-widget="chat-pane-toggle">
                    <i class="fas fa-comments"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages">
                  <!-- Message. Default to the left -->
                  <div class="direct-chat-msg">
                    <div class="direct-chat-infos clearfix">
                      <span class="direct-chat-name float-left">Alexander Pierce</span>
                      <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    
                    <!-- <img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image"> -->
                    
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      Is this template really for free? That's unbelievable!
                    </div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->

                  <!-- Message to the right -->
                  <div class="direct-chat-msg right">
                    <div class="direct-chat-infos clearfix">
                      <span class="direct-chat-name float-right">Sarah Bullock</span>
                      <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    <!-- <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image"> -->
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      You better believe it!
                    </div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->

                  <!-- Message. Default to the left -->
                  <div class="direct-chat-msg">
                    <div class="direct-chat-infos clearfix">
                      <span class="direct-chat-name float-left">Alexander Pierce</span>
                      <span class="direct-chat-timestamp float-right">23 Jan 5:37 pm</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    <!-- <img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image"> -->
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      Working with AdminLTE on a great new app! Wanna join?
                    </div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->

                  <!-- Message to the right -->
                  <div class="direct-chat-msg right">
                    <div class="direct-chat-infos clearfix">
                      <span class="direct-chat-name float-right">Sarah Bullock</span>
                      <span class="direct-chat-timestamp float-left">23 Jan 6:10 pm</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    <!-- <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image"> -->
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      I would love to.
                    </div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->

                </div>
                <!--/.direct-chat-messages-->

          
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <form action="#" method="post">
                  <div class="input-group">
                    <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                    <span class="input-group-append">
                      <button type="button" class="btn btn-primary">Send</button>
                    </span>
                  </div>
                </form>
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
      </div>
</div>
      <script>
  $(function () {
    //ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
      var csrfHeaderName="${_csrf.headerName}";
      var csrfTokenValue="${_csrf.token}";
      $(document).ajaxSend(function(e, xhr, options){
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      }); 
      
      $(".btns").on("click",function(e){
          e.preventDefault();
          
          var operation = $(this).data("oper");
          console.log(operation);
          if(operation === "todoWrite"){
        	  todoVal = $("input[name='todo-value']").val();
             	  console.log(todoVal);
          } 

        });
    
      var sno ='<c:out value="${study.sno}"/>';
      

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
        	
        	
        	var todo = {
        			  	sno:sno,
        			  	todo:todo,
        			};	
        	
        	
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

         


        });
        
        
        
        
        
        // $(".custom-checkbox").on("click", function(e){
        //   if($(this).prop("checked",false)) {
        //     $(this).attr("checked",true);
        //   } 
        //   else if ($(this).prop("checked",true)){
        //     $(".custom-checkbox").attr("checked","안녕");
        //   }
        // });

      </script>
    </div>
  </section>

<%@ include file="../includes/footer.jsp" %>

