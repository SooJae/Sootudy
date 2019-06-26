<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content:center;
	text-align:center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span{
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

<%@ include file="../includes/header.jsp" %>
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
                <form role="form" action="/board/register" method="post">
                  <!-- text input -->
                  <div class="form-group">
                <!--   <select class="custom-select" name="bname">
					  <option selected>게시물 유형</option>
					  <option value="free">자유</option>
					  <option value="info">정보</option>
					  <option value="qna">질문</option>
					</select> -->
					</div>
                  <div class="form-group">
                    <label>Title</label>
                    <input type="text" class="form-control" placeholder="Enter ..." name="title">
                  </div>
                  <!-- textarea -->
                  <div class="form-group">
                    <label>Textarea</label>
                    <textarea class="form-control" rows="3" placeholder="Enter ..." name="content"></textarea>
                  </div>
                  <div class="form-group">
                    <label>Writer</label>
                    <input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
                  </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  <%-- <input type="hidden" name="bname" value="${pageMaker.cri.bname}"/> --%>
                  <button type="submit" class="btn btn-default"> Submit Button</button>
                  <button type="reset" class="btn btn-default"> Reset Button</button>
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
	      		<div class="card card-warning">
	      			<div class="card-header">File Attach</div>
			      		<!-- /.card-heading -->
			      		<div class="card-body">
			      			<div class="form-group uploadDiv">
			      				<input type="file" name='uploadFile' multiple>
			      			</div>
			      			
			      			<div class="uploadResult">
			      				<ul>
			      				</ul>
			      			</div>
			      		</div>
	      		</div>
	      	</div>
	      	<!-- /.card-body -->
	      </div>  
        <!--/.card  -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
    
<script>
$(function(){
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
		var maxSize = 5242880; // 5MB
		
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
		
		//var cloneObj = $(".uploadDiv").clone();
		
		var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			
			//add filedate to formdata
			for(var i=0; i<files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url:'/uploadAjaxAction',
				processData: false,
				contentType: false,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
				type: 'POST',
				dataType:'json',
				success: function(result){
					console.log(result);
					showUploadResult(result);
				}
			});
		});
	
	
	  function showUploadResult(uploadResultArr){
		    
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    
		    var uploadUL = $(".uploadResult ul");
		    
		    var str ="";
		    
		    $(uploadResultArr).each(function(i, obj){
		    
				//image type
				
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
			var targetFile = $(this).data("file");
			var type = $(this).data("type");

			var targetLi = $(this).closest("li");
			
			$.ajax({
				url:'/deleteFile',
				data:{fileName:targetFile, type:type},
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				
				dataType:'text',
				type:'POST',
				success: function(result){
					alert(result);
					targetLi.remove();
				}
			});
		});
	  
});
</script>

<%@ include file="../includes/footer.jsp" %>