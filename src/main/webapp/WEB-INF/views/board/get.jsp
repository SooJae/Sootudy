<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
 --%>
<%@ include file="../includes/header.jsp" %>
<style>

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
              <div class="card-body getbody">
                  <!-- text input -->
                  <div class="form-group">
                    <label>Title</label>
                    <input type="text" class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
                  </div>
                  <!-- textarea -->
                  <div class="form-group">
                    <label>Textarea</label>
                    <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>
                  <!-- textarea는 value가 없다. -->
                  </div>
                  <div class="form-group">
                    <label>Writer</label>
                    <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly"/>
                  </div>
                  <sec:authentication property="principal" var="pinfo"/>
                  	<sec:authorize access="isAuthenticated()">
                  		<c:if test="${pinfo.username eq board.writer}">
	                  		<button data-oper="modify" class="btn btn-default "> Modify </button>
	                  	</c:if>
	                </sec:authorize>
	                  <button data-oper="list" class="btn btn-info"> List </button>
                  
               <form id="operForm" action="/boad/modify" method="get">
				  <input type='hidden' id='bname' name='bname' value='<c:out value="${board.bname}"/>'>
				  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				  <input type='hidden' name='page' value='<c:out value="${cri.page}"/>'>
				  <input type='hidden' name='perPageNum' value='<c:out value="${cri.perPageNum}"/>'>
				  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
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
        
        
          <div class="row">
          <!-- right column -->
          <div class="col-md-12">
            <!-- general form elements disabled -->
            <div class="card card-secondary">
              <div class="card-header">
                <i class="fa fa-comments fa-fw"></i>Reply
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              
              <sec:authentication property="principal" var="pinfo"/>
	              <sec:authorize access="isAuthenticated()"> 
	             	 <c:choose>
             			 <c:when test="${pinfo.username ne null}">
				              <!-- 수정해야됌 -->
				              <form role="form" id="replyForm" action="/board/modify" method="post">
				              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				                  <!-- text input -->
				                  <div class="form-group">
				                    <label>댓글 쓰기</label>
				                    <input type="text" class="form-control" placeholder="Enter ..." name="replyText">
				                  </div>
				                  <div class="form-group">
				                    <label>댓글자</label>
				                    <input class="form-control" name="writer" value='<c:out value="${pinfo.username}"/>' readonly="readonly"/>
				                   <%--  <input class="form-control" name="writer" value='<c:out value="${pinfo.member.userName}"/>' readonly="readonly"/> --%>
				                  </div>
				                  <!-- <div class="form-group">
				                    <label>댓글날짜</label>
				                    <input type="text" class="form-control" placeholder="Enter ..." name="replyDate">
				                  </div> -->
				                	<button type="submit" data-oper="replyWrite" class="btn btn-info" id="replyButton"> 댓글쓰기 </button>
				                </form>
                			</c:when>
			               	<c:otherwise>
			             	   <p>로그인을 해주세요</p>
			                </c:otherwise>
               		</c:choose>
                 </sec:authorize>
				        <ul class="chat">
				
				        </ul>
				        <!-- ./ end ul -->
                
                
<!--                  <ul class="chat">
                 	<li class="left clearfix" data-rno="12">
	                 	<div>
	                 		<div class="header">
	                 			<strong class="primary-font">user00</strong>
	                 			<small class="pull-right text-muted">2019-01-01 13: 13</small>
	                 		</div>
	                 		<p>Good Job!</p>
	                 	</div>
                 	</li>
                 </ul> -->
                 
                 
					
					<div class="card-footer2"></div>
			</div>
              <!-- /.card-body -->
				
						
						

            </div>
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
        
        
        
        
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
    

    
    
    
    
    
    
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/dist/js/reply.js"></script>

<script charset="UTF-8">

$(function(){
	var bnoValue ='<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page){
		replyService.getList({bno:bnoValue,page:page||1}, 
			function(replyCnt, list){
				console.log("replyCnt"+replyCnt);
				console.log("list:"+list);
				console.log(list);
				
				if(page==-1){
					page = Math.ceil(replyCnt/5.0);
					console.log(page);
					showList(page);
					return;
				}
			
			var str="";
				
				if(list ==null || list.length==0){
					replyUL.html("");
					
					return;
				}
				
				for(var i = 0, len = list.length||0; i<len; i++){
					str+="<li class='left clearfix' data-rno='"+list[i].rno+"' style='border-bottom:1px solid gray; margin-top:20px; margin-left: <c:out value='"+${20*list[i].replyDepth}+"'/>px;'>";
					str+="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str+="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small>";
/* 					str+="<small class='pull-right text-muted replyDelete'><a href='#'>삭제&nbsp;</a></small></div>"; */
					str+="<sec:authentication property='principal' var='pinfo'/><sec:authorize access='isAuthenticated()'><c:if test='${pinfo.username eq board.writer}'>";
					str+="<a href='#'><small class='pull-right text-muted replyDelete'>삭제&nbsp;</small></a></div></c:if></sec:authorize>";
					str+="<p>"+list[i].replyText+"</p></div></li>";
				}
				replyUL.html(str);
				
				showReplyPage(replyCnt);
		}); // end function
	}
	
	var page = 1;
	var displayPageNum = 5;
	var replyPageFooter = $(".card-footer2");
	
	function showReplyPage(replyCnt){
		
		var endPage = Math.ceil(page / parseFloat(displayPageNum) ) * displayPageNum;
		var startPage = (endPage -displayPageNum) +1;
		
	/* 	 var prev = startPage != 1;
	     var next = false; */
	      
	     var realEnd = Math.ceil(replyCnt/10.0);
	     
	     if(realEnd < endPage ){
	    	 endPage = realEnd;
	     }
	    var prev = startPage > 1;
		var next = (endPage * 10) < replyCnt;
	     
	    /*  
	    if(endPage * displayPageNum >= replyCnt){
	        endPage = Math.ceil(replyCnt/parseFloat(displayPageNum));
	      }
	      if(endPage * displayPageNum < replyCnt){
      	    next = true;
	      }  
	     */
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
	      
	      replyPageFooter.html(str);
	      
	}
	
	replyPageFooter.on("click","li a", function(e){
	       e.preventDefault();
	       console.log("page click");
	       
	       var targetPage = $(this).attr("href");
	       
	       console.log("targetPageNum: " + targetPage);
	       
	       page = targetPage;
	       
	       showList(page);
	     });     
	
	
		var operForm = $("#operForm"); 
		var replyForm = $("#replyForm");
	  
	 
	  $(".getbody").find("button").on("click",function(e){
			e.preventDefault();
			
			//replyForm.remove();
			

			
			document.body.appendChild(operForm[0]);
			
			var operation = $(this).data("oper");
			
			if(operation === "modify"){
				operForm.attr("action","/board/modify");
				//document.body.appendChild(operForm[0]);
			} else if(operation ==="list"){
			    operForm.find("#bno").remove();
			    operForm.attr("action","/board/list");
			   //document.body.appendChild(operForm[0]);
			    
			}

			 operForm.submit();
			 
	  });
	  
	 	var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
	  
		//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
	   $("#replyButton").on("click",function(e){
			 e.preventDefault();
			 operForm.remove(); 
			 
			 var replyer = null;
			 <sec:authorize access="isAuthenticated()">
			 replyer = '<sec:authentication property="principal.username"/>';
			 </sec:authorize>	
		 	
			 var reply = {
					replyText: replyForm.find("input[name='replyText']").val(),
			 		replyer : replyer,
			 		bno:bnoValue
			 };
			 replyService.add(reply,function(result){
				
				 replyForm.find("input[name='replyText']").val("");
				 replyForm.find("input[name='replyer']").val("");
				 
				 
				 alert(result);
				 
				 showList(1);
				 //showList(-1);
				 
			 });
		 
	  }); 
	   
	   $(".chat").on("click",".replyDelete",function(e){
		   e.preventDefault();
		   var rno = $(this).parent().parent().parent().parent().data("rno");
		   var replyer = $(this).parent().parent().find(".primary-font").text();
		   

		   
		   console.log("RNO:"+rno);
		   console.log("Replyer:"+replyer);
		   
		   if(!replyer){
				alert("로그인 후 삭제가 가능합니다.");
				return;
		   }
		   
		   var originalReplyer=null;
		   
 			<sec:authorize access="isAuthenticated()">
			originalReplyer = '<sec:authentication property="principal.username"/>';
			</sec:authorize> 
			
			
			if(replyer != originalReplyer){
				return;
			}
			
		   replyService.remove(rno, originalReplyer, function(result){
			  
				alert(result);
				showList(page);
		   });
		   
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
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<img src='/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{
		             
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span> "+ attach.fileName+"</span><br/>";
		           str += "<img src='/resources/img/attach.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		       
		     });//end getjson
	   })();
	   
	   $(".uploadResult").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      //download 
		      self.location ="/download?fileName="+path
		    }
		    
		    
		  });
		  
		  function showImage(fileCallPath){
			    
		    
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  }
		  $(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 1000);
		  }); 
});
</script>


<!-- 
<script type="text/javascript">
	var bnoValue='<c:out value="${board.bno}"/>';
	
 	replyService.add(
			{bno:bnoValue, replytext:"JS Test", replyer:"tester"}
			,
			function(result){
				alert("RESULT:"+result);
			});  
			
		
	replyService.getList({bno:bnoValue,page:1}, function(list){
	 		list.forEach(function(i){
				console.log(i);
				}
			); 
		});
			
	replyService.remove(22, function(count){
			console.log(count);
			if(count === "success"){
				alert("REMOVED");
			}
		}, function(err){
			alert("ERROR...");
		});
		
	replyService.update({
			rno : 24,
			bno : bnoValue,
			replytext : "Modified Reply..."
		}, function(result){
			alert("수정완료");
		});
	replyService.get(10,function(data){
		console.log(data);
	});
		
		
</script> 
-->

