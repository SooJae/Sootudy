<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../includes/header.jsp" %>
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


   <!-- Content Header (Page header) -->

 <!-- Main content -->
 <!--  breadcrumb -->
<section class="container board-list m-full">
        <div class="container-fluid">
            <div class="text-center">
              <h1>게시글 등록</h1>
            </div>
        </div>
</section>
 
 <section>
 <div class="container board-whole m-full white">
 <div class="container board-detail getbody" style="padding : 0px;">
  <!-- section : 본문역할 -->
  <div class="board-detail-body" style="border-top: 1px solid lightgray;">
    <form method="post" role="form" action="/board/register">
	      <div class="form-group">
	       <input class="form-control" type="text" maxlength="100" name="title" placeholder="글 제목을 입력하세요">
	      </div>
	      <div class="form-group">
	       <textarea class="form-control" rows="20" placeholder="내용을 입력해주세요" name="content"></textarea>
	      </div>
	         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	         <input type="hidden" name="writer" value='<sec:authentication property="principal.username"/>'>
	         <%-- <input type="hidden" name="bname" value="${pageMaker.cri.bname}"/> --%>
           <div style="text-align:right"> 
           <button type="button" id="list" class="btn btn-secondary btn-lg mt-2">취소</button>
           <button type="submit" class="btn btn-primary btn-lg mt-2">글 쓰기</button>
           </div>
	        
    </form>
  </div>
</div>
 
        <div class="row">
	      	<div class="col-lg-12">
	      		<div class="card m-full white">
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
    </section>
    <!-- section -->
    
    <%@ include file="../includes/footer.jsp" %>
<script>
$(function(){
	var formObj = $("form[role='form']");
	
	$("#list").on("click", function(e){
         self.location="list";
	});
	  
	  $("button[type='submit']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    
		if(!$("input[name='title']").val()){
			customAlert("fail","제목을 입력해주세요");
			return false;
		}else if(!$("textarea[name='content']").val()){
			customAlert("fail","내용을 입력해주세요");
			return false;
		}
	    
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
		
		/* var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}"; */
		
		//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
	    var csrfHeaderName="${_csrf.headerName}";
	    var csrfTokenValue="${_csrf.token}";
	    $(document).ajaxSend(function(e, xhr, options){
	      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    }); 
		
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
				/* beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				}, */
				data: formData,
				type: 'POST',
				dataType:'json',
				success: function(result){
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
			/* 	beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				}, */
				
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

