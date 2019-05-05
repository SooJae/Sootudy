<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../includes/header.jsp" %>

<style>
.btn-circle {
    width: 30px;
    height: 30px;
    padding: 6px 0px;
    border-radius: 15px;
    text-align: center;
    font-size: 12px;
    line-height: 1.42857;
}

ul {padding :0}
ul > li { list-style: none } 

.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}


</style>


   <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>General Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">General Form</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- right column -->
          <div class="col-md-12">
            <!-- general form elements disabled -->
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">General Elements</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              
                  <!-- text input -->
                  <form role="form" action="/board/modify" method="post">
	                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                  <input type="hidden" name="bname" value="${pageMaker.cri.bname}"/>
	                  <input type='hidden' name="page" value='<c:out value="${cri.page}"/>'>
	                  <input type='hidden' name="perPageNum" value='<c:out value="${cri.perPageNum}"/>'>
	                  <input type='hidden' name="type" value='<c:out value="${cri.type}"/>'>
	                  <input type='hidden' name="keyword" value='<c:out value="${cri.keyword}"/>'>
	                  <div class="form-group">
	                    <label>Title</label>
	                    <input type="text" class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
	                  </div>
	                  
	                  <div class="form-group">
	                    <label>Title</label>
	                    <input type="text" class="form-control" name="title" value='<c:out value="${board.title}"/>'>
	                  </div>
	
	                  <!-- textarea -->
	                  <div class="form-group">
	                    <label>Textarea</label>
	                    <textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
	                  <!-- textarea는 value가 없다. -->
	                  </div>
	                  <div class="form-group">
	                    <label>Writer</label>
	                    <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly"></input>
	                  </div>
	                  <sec:authentication property="principal" var="pinfo"/>
	                  <sec:authorize access="isAuthenticated()">
		                  <c:if test="${pinfo.username eq board.writer}">
			                  <button type="submit" data-oper="modify" class="btn btn-default"> Modify</button>
			                  <button type="submit" data-oper="remove" class="btn btn-danger"> Remove </button>
		                  </c:if>
	                  </sec:authorize>
	                  
	                  <button type="submit" data-oper="list" class="btn btn-info"> List </button>
                  </form>
                  </div>
         	   <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
        
        
      	  <div class="row">
		  <div class="col-lg-12">
		    <div class="card card-secondary">
		
		      <div class="card-header">Files</div>
		      <!-- /.panel-heading -->
		      <div class="card-body">
		        
		        <div class='uploadResult'> 
		          <ul>
		          </ul>
		        </div>
		      </div>
		      <!--  end panel-body -->
		    </div>
		    <!--  end panel-body -->
		  </div>
		  <!-- end panel -->
	</div>
	<!-- /.row -->
        
        <div class='bigPictureWrapper'>
		  <div class='bigPicture'>
		  </div>
		</div>
        
        
        
        
      </div>
      
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
<%@ include file="../includes/footer.jsp" %>

<script>
	$(function(){
		var formObj = $("form");
		
		$("button").on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === "remove"){
				formObj.attr("action", "/board/remove");
			} else if(operation === "list"){
			/* 	self.location = "/board/list";
				return; */
				formObj.attr("action", "/board/list").attr("method","get");
				var pageTag = $("input[name='page']").clone();
				var perPageNumTag = $("input[name='perPageNum']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				
				formObj.append(pageTag);
				formObj.append(perPageNumTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
			
		});
		
		 (function(){
			   var bno = '<c:out value="${board.bno}"/>';
			   $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
			       console.log(arr);
			       var str = "";
			       $(arr).each(function(i, attach){
			           
			           //image type
			           if(attach.fileType){
			             var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
			             
			             str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
			             str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			             str += "<span> "+ attach.fileName+"</span>";
			             str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
			             str += "class='btn btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
			             str += "<img src='/display?fileName="+fileCallPath+"'>";
			             str += "</div>";
			             str +"</li>";
			           }else{
			               
			             str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
			             str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			             str += "<span> "+ attach.fileName+"</span><br/>";
			             str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
			             str += " class='btn btn-danger btn-circle'><i class='fa fa-times'></i></button><br>";
			             str += "<img src='/resources/img/attach.png'></a>";
			             str += "</div>";
			             str +"</li>";
			           }
			        });
			       
			       $(".uploadResult ul").html(str);
			       
			     });//end getjson
		   })();
		 
		  var formObj = $("form[role='form']");
		  
		  $("button[type='submit']").on("click", function(e){
		    
		    e.preventDefault();
		    
		    console.log("submit clicked");
		    
		    var str = "";
		    
		    $(".uploadResult ul li").each(function(i, obj){
		      
		      var jobj = $(obj);
		      
		      console.dir(jobj);
		      console.log("-------------------------");
		      console.log(jobj.data("filename"));
		      
		      
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		      
		    });
		    
		    console.log(str);
		    
		    formObj.append(str).submit();
		    
		  });
		 
		  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		  var maxSize = 5242880; //5MB
		  
		  function checkExtension(fileName, fileSize){
		    
		    if(fileSize >= maxSize){
		      alert("파일 사이즈 초과");
		      return false;
		    }
		    
		    if(regex.test(fileName)){
		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
		      return false;
		    }
		    return true;
		  }
		  var csrfHeaderName="${_csrf.headerName}";
		  var csrfTokenValue="${_csrf.token}";
		  
		  $("input[type='file']").change(function(e){

		    var formData = new FormData();
		    
		    var inputFile = $("input[name='uploadFile']");
		    
		    var files = inputFile[0].files;
		    
		    for(var i = 0; i < files.length; i++){

		      if(!checkExtension(files[i].name, files[i].size) ){
		        return false;
		      }
		      formData.append("uploadFile", files[i]);
		      
		    }
		    
		    $.ajax({
		      url: '/uploadAjaxAction',
		      processData: false, 
		      contentType: false,data: 
		      formData,type: 'POST',
		      beforeSend: function(xhr){
		    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      },
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
				  showUploadResult(result); //업로드 결과 처리 함수 

		      }
		    }); //$.ajax
		    
		  });  
		  
		  function showUploadResult(uploadResultArr){
			    
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    
		    var uploadUL = $(".uploadResult ul");
		    
		    var str ="";
		    
		    $(uploadResultArr).each(function(i, obj){
		    
				
				if(obj.image){
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				      
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}

		    });
		    
		    uploadUL.append(str);
		  }
		 
		 $(".uploadResult").on("click","button",function(e){
			//.uploadResult 밑의 button 을 누를시
			 console.log("delete file");
			 
			 if(confirm("Remove this file?")){
				 
				 var targetLi = $(this).closest("li");
				 targetLi.remove();
			 }
		 });
		
	});
</script>