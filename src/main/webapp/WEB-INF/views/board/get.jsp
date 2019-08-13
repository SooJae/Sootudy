<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
.card-header{
 border :1px solid rgba(0,0,0,.125);
 margin-top: 10px;
}

.card-body{
 border : 1px solid rgba(0,0,0,.125);
}

</style>
    <!-- Content Header (Page header) -->
   <%--  <section class="content-header">
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
    </section> --%>
<section>
<div class="container board-whole m-full white">
 	<div class="container board-detail getbody">
<!-- 			<div class="row board-head in-visible row-no-padding"> -->
			<div class="row board-detail-head pb-3 pt-3">
				<div class="col-12 col-md-12"><h3><c:out value="${board.title}"/></h3></div>
			</div>
			<div class="row board-detail-headbt">
				<div class="col-6 col-md-2" style="font-weigth:bold; text-alingh:left;"><i class="fas fa-user-circle"></i><c:out value="${board.writer}"/></div>
				<div class="col-6 col-md-4"><i class="far fa-clock"></i> <fmt:formatDate value="${board.udt_dt}" type="both" pattern="MM-dd hh:mm"/></div>
				<div class="col-md-2"></div> 
				<div class="col-9 col-md-2 " style="text-align:right"><i class="far fa-eye"></i><c:out value="${board.v_cnt}"/></div>
				<div class="col-3 col-md-2"><i class="fas fa-fire"></i><c:out value="${board.like_cnt}"/></div>
			</div>
			<div class="row board-detail-body" style="min-height:300px;">
				<div class="board-content">
				<c:out value="${board.content}"/>
				</div>
			</div>
<!-- 			<form id="likeForm" action="/board/like" method="post"> -->
			<div class="row vote-btn p-3">
				<form id="likeForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
					<button type="button" id="likeButton" class="btn btn-primary btn-lg" style="margin: 0 auto;" ><i class="fas fa-fire"></i> 추천 <span class="badge badge-light" id="likeCount"></span></button> 
			</div>
			<div class="row board-detail-bottom p-1">
				<div>
				 <button type="button" class="btn btn-outline-dark btn-sm btns"  data-oper="list"><i class="fas fa-clipboard-list"></i>&nbsp;목록</button> 
				</div>
				
				<div class="ml-auto">
					<sec:authentication property="principal" var="pinfo"/>
	                  	<sec:authorize access="isAuthenticated()">
		                  	<c:if test="${pinfo.username eq board.writer}">
								<button type="button" class="btn btn-outline-dark btn-sm btns" data-oper="modify"><i class="far fa-edit"></i>&nbsp;수정</button>
								<button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#deleteModal"><i class="far fa-trash-alt"></i>&nbsp;삭제</button>
							</c:if>
		                </sec:authorize>
				</div>
			</div>
			
			
			
			
                  
         <form id="operForm" action="/board/modify" method="get" >
       	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<%--   <input type='hidden' id='bname' name='bname' value='<c:out value="${board.bname}"/>'> --%>
				  <input type='hidden' name='writer' value='<c:out value="${board.writer}"/>'>
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
        <!--   </div> -->
          <!--/.col (right) -->
        <!-- </div> -->
        <!-- /.row -->
        
	  <div class="row">
		  <div class="col-lg-12">
		    <!-- <div class="card card-secondary"> -->
			<div class="container board-whole m-full white">
		      <div class="card-header"><i class="fas fa-file-alt"></i> 첨부 파일</div>
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
            <div class="container board-whole m-full white">
              <div class="card-header">
                <i class="fa fa-comments fa-fw"></i> 댓글
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              
              <sec:authentication property="principal" var="pinfo"/>
	              <sec:authorize access="isAuthenticated()"> 
	             	 <c:choose>
             			 <c:when test="${pinfo.username ne null}">
				              <form role="form" id="replyForm" method="post" onsubmit="return false;">
<%-- 				              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
<%-- 		                    <input type="hidden" name="writer" value='<c:out value="${pinfo.member.nm}"/>' /> --%>
				                  <!-- text input -->
				                  <div class="input-group mb-3">
				                    <input type="text" class="form-control" placeholder="댓글을 입력하세요" name="reply" onkeydown = "if (event.keyCode == 13)
                        document.getElementById('replyButton').click()">
				                     <div class="input-group-append">
				                     <button type="button" data-oper="replyWrite" class="btn btn-sm btn-primary" id="replyButton"><i class="fas fa-pencil-alt"></i> 쓰기</button>
				                     </div>
				                  </div>
				                    <%-- <input class="form-control" name="writer" value='<c:out value="${pinfo.username}"/>' readonly="readonly"/> --%>
				                	
				                </form>
                			</c:when>
			               	<c:otherwise>
			             	   <p>로그인을 해주세요</p>
			                </c:otherwise>
               		</c:choose>
                 </sec:authorize>
				        <ul class="chat"></ul>
				        <!-- ./ end ul -->
                
					<div class="card-footer2"></div>
			</div>
              <!-- /.card-body -->

            </div>
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
        
        
        
        
<!--       </div> -->
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
    

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger btns" data-oper= "remove">삭제</button>
      </div>
    </div>
  </div>
</div>
    
    
    
    
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/dist/js/reply.js"></script>
<script type="text/javascript" src="/resources/dist/js/board_like.js"></script>

<script charset="UTF-8">

$(function(){
	var bnoValue ='<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");

	//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
	 	var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		}); 
	
	showList(1);
	showLikes();
	
	
	 $(".btns").on("click",function(e){
			e.preventDefault();
			
			replyForm.remove();
			likeForm.remove();
			

			//operForm을 담아서 보냄
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === "modify"){
				operForm.attr("action","/board/modify");
				document.body.appendChild(operForm[0]);
			} else if(operation ==="list"){
			    operForm.find("#bno").remove();
			    operForm.attr("action","/board/list");
			    document.body.appendChild(operForm[0]);
			} else if(operation === "remove"){
				operForm.attr("method","post");
				operForm.attr("action","/board/remove");
				document.body.appendChild(operForm[0]);
			}

			 operForm.submit();
			 
	  });
	
	function showLikes(){
		var likeCount=$("#likeCount");
		
		
		boardLikeService.getLike(bnoValue,function(result){
		var str=null;
		str+= result;
		likeCount.html(str);
		
		});
		
	}
	
	function showList(page){
		replyService.getList({bno:bnoValue,page:page||1}, 
			function(replyCnt, list){
				
				if(page==-1){
					page = Math.ceil(replyCnt/5.0);
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
					str+="<small class='pull-right text-muted'> &nbsp;"+replyService.displayTime(list[i].reply_udt_dt)+"</small>";
					str+="<sec:authentication property='principal' var='pinfo'/><sec:authorize access='isAuthenticated()'><c:if test='${pinfo.username eq board.writer}'>";
					str+="<a href='#'><small class='pull-right text-muted replyDelete'>&nbsp; 삭제</small></a></div></c:if></sec:authorize>";
					str+="<p>"+list[i].reply+"</p></div></li>";
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
	     
	     if(realEnd < endPage ) {
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
	      } */
	     
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
		var likeForm = $("#likeForm");
	  
	 
		
		
		$("#likeButton").on("click",function(e){
			e.preventDefault();
			operForm.remove(); 
			//replyForm.remove();
				 var id = null;
			 <sec:authorize access="isAuthenticated()">
			 	id = '<sec:authentication property="principal.username"/>';
			 </sec:authorize>
			 <sec:authorize access="isAnonymous()">
				 customAlert("fail","로그인을 하신 후에 추천이 가능합니다");
				 return false;
			 </sec:authorize>
			
			var like = {
					bno:bnoValue,
					id : id 
			}
			
			boardLikeService.like(like,function(result){
				showLikes();
			});
				
			
		});
	   $("#replyButton").on("click",function(e){
			 e.preventDefault();
			 likeForm.remove();
			 operForm.remove(); 
			 
			 var replyer = null;
			 <sec:authorize access="isAuthenticated()">
			 replyer = '<sec:authentication property="principal.username"/>';
			 </sec:authorize>	
		 	
			 var reply = replyForm.find("input[name='reply']").val();
			 if(reply == ""){
				 customAlert("fail","댓글 내용을 입력해주세요");
				 return false;
	   }
			 
			 
			 var reply = {
					reply: reply,
			 		replyer : replyer,
			 		bno:bnoValue
			 };
			 replyService.add(reply,function(result){
				
				 replyForm.find("input[name='reply']").val("");
				 
				 
				 
				 showList(1);
				 
			 });
		 
	  }); 
	   
	   $(".chat").on("click",".replyDelete",function(e){
			   e.preventDefault();
			   var rno = $(this).parent().parent().parent().parent().data("rno");
			   var replyer = $(this).parent().parent().find(".primary-font").text();
			   
			   if(!replyer){
				   customAlert("fail","로그인 후 삭제가 가능합니다");
					return;
			   }
			   
			   var originalReplyer=null;
			   
		 			<sec:authorize access="isAuthenticated()">
					 originalReplyer = '<sec:authentication property="principal.username"/>';
					</sec:authorize> 
				
				
					if(replyer != originalReplyer){
						customAlert("fail","해당 댓글을 작성한 사용자가 아닙니다");
						return;
					}
			
				   replyService.remove(rno, originalReplyer, function(result){
			  
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



