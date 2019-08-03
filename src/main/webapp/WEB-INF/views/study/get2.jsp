<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp" %>


  <style>
    .todo-list {
      list-style: none;
      margin: 0;
      overflow: auto;
      padding: 0;
    }

    .todo-list>li {
      border-radius: 2px;
      background: #f8f9fa;
      border-left: 2px solid #e9ecef;
      color: #495057;
      margin-bottom: 2px;
      padding: 10px;
    }

    .todo-list>li:last-of-type {
      margin-bottom: 0;
    }

    .todo-list>li>input[type='checkbox'] {
      margin: 0 10px 0 5px;
    }

    .todo-list>li .text {
      display: inline-block;
      font-weight: 600;
      margin-left: 5px;
    }

    .todo-list>li .badge {
      font-size: .7rem;
      margin-left: 10px;
    }

    .todo-list>li .tools {
      color: #dc3545;
      display: none;
      float: right;
    }

    .todo-list>li .tools>.fa,
    .todo-list>li .tools>.fas,
    .todo-list>li .tools>.far,
    .todo-list>li .tools>.fab,
    .todo-list>li .tools>.glyphicon,
    .todo-list>li .tools>.ion {
      cursor: pointer;
      margin-right: 5px;
    }

    .todo-list>li:hover .tools {
      display: inline-block;
    }

    .todo-list>li.done {
      color: #697582;
    }

    .todo-list>li.done .text {
      font-weight: 500;
      text-decoration: line-through;
    }

    .todo-list>li.done .badge {
      background: #adb5bd !important;
    }

    .todo-list .primary {
      border-left-color: #007bff;
    }

    .todo-list .secondary {
      border-left-color: #6c757d;
    }

    .todo-list .success {
      border-left-color: #28a745;
    }

    .todo-list .info {
      border-left-color: #17a2b8;
    }

    .todo-list .warning {
      border-left-color: #ffc107;
    }

    .todo-list .danger {
      border-left-color: #dc3545;
    }

    .todo-list .light {
      border-left-color: #f8f9fa;
    }

    .todo-list .dark {
      border-left-color: #343a40;
    }

    .todo-list .navy {
      border-left-color: #001f3f;
    }

    .todo-list .olive {
      border-left-color: #3d9970;
    }

    .todo-list .lime {
      border-left-color: #01ff70;
    }

    .todo-list .fuchsia {
      border-left-color: #f012be;
    }

    .todo-list .maroon {
      border-left-color: #d81b60;
    }

    .todo-list .blue {
      border-left-color: #007bff;
    }

    .todo-list .indigo {
      border-left-color: #6610f2;
    }

    .todo-list .purple {
      border-left-color: #6f42c1;
    }

    .todo-list .pink {
      border-left-color: #e83e8c;
    }

    .todo-list .red {
      border-left-color: #dc3545;
    }

    .todo-list .orange {
      border-left-color: #fd7e14;
    }

    .todo-list .yellow {
      border-left-color: #ffc107;
    }

    .todo-list .green {
      border-left-color: #28a745;
    }

    .todo-list .teal {
      border-left-color: #20c997;
    }

    .todo-list .cyan {
      border-left-color: #17a2b8;
    }

    .todo-list .white {
      border-left-color: #ffffff;
    }

    .todo-list .gray {
      border-left-color: #6c757d;
    }

    .todo-list .gray-dark {
      border-left-color: #343a40;
    }

    .todo-list .handle {
      cursor: move;
      display: inline-block;
      margin: 0 5px;
    }
*{
  font-family:'Sans-serif';
}
  </style>

  <section class="board-list study-get m-full" style="width:90%">
<!-- <section> -->
    <div class="wrapper row" style="margin:0;">
      <div class="hold-transition sidebar-mini layout-fixed col-md-3" style="padding:0;">
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
              <li>
                <!-- checkbox -->
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo" id="todoCheck1">
                  <label for="todoCheck1"></label>
                </div>


                <!-- todo text -->
                <span class="text">자바 공부</span>
                <!-- Emphasis label -->
                <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small>
                <!-- General tools such as edit or delete-->
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
                <div class="custom-control custom-checkbox d-inline ml-2">
                  <input type="checkbox" class="custom-control-input" name="todo" id="customCheck" value="안녕" disabled>
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
                  <input type="checkbox" class="custom-control-input" name="todo" id="customCheck2" value="안녕2"
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
                  <input type="checkbox" class="custom-control-input" name="todo" id="customCheck3" value="안녕3"
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
              <li>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo5" id="todoCheck5">
                  <label for="todoCheck5"></label>
                </div>
                <span class="text">Check your messages and notifications</span>
                <small class="badge badge-primary"><i class="far fa-clock"></i> 1 week</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo6" id="todoCheck6">
                  <label for="todoCheck6"></label>
                </div>
                <span class="text">Let theme shine like a star</span>
                <small class="badge badge-secondary"><i class="far fa-clock"></i> 1 month</small>
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
                  <input type="text" class="form-control" placeholder="할일을 적어주세요" name="todo">
                   <div class="input-group-append">
                   <button type="button" data-oper="todoWrite" class="btn btn-primary" id="todoWrite"><i class="fas fa-pencil-alt"></i> 쓰기</button>
                   </div>
                </div>

            <button type="button" id="check-button" class="btn btn-info float-right"><i
                class="fas fa-check"></i>체크</button>
          </div>
        </div>
        <!-- /.card -->
      </div>


      <div class="col-md-9">
        <!--  breadcrumb -->
        <!-- <section class="container board-list m-full"> -->
        <div>
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
            <!-- /.card-body -->
          </div>
          <!-- /.card -->


          <!-- /.content -->

        </div>
      </div>

      <script>
        $(function () {

          $("input:checkbox[name='todo']").on("click", function (e) {

            if ($(this).is(":checked")) {
              $(this).prop("checked", true);
              $(this).parent().parent().attr("class", "done");
              console.log(this.value);
            } else {
              $(this).prop("checked", false);
              $(this).parent().parent().removeAttr("class");
              console.log("꽝", this.value);
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
              $("ul li input[name='todo']").each(function (i, check) {
                $(check).attr("disabled", "disabled");
              });
            } else {
              $(this).addClass("active");
              $(this).html(`<i class="fas fa-check"></i> 완료`);
              $("ul li input[name='todo']").each(function (i, check) {
                $(check).removeAttr("disabled");
              });
            }
          });

          $(".todo-list").append(` <li>
                            <div  class="icheck-primary d-inline ml-2">
                              <input type="checkbox" value="" name="todo2" id="todoCheck2" checked>
                              <label for="todoCheck2"></label>
                            </div>
                            <span class="text">Make the theme responsive</span>
                            <small class="badge badge-info"><i class="far fa-clock"></i> 4 hours</small>
                            <div class="tools">
                              <i class="fas fa-edit"></i>
                              <i class="fas fa-trash-o"></i>
                            </div>
                          </li>`);


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

