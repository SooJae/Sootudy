console.log("todo module...");
//
var studyTodoService=(function(){
	
	function check(sno, todo, callback, error){
console.log(todo+"todo");
		$.ajax({
			type:'put',
			url :'/todo/'+sno,
			//Set은 Array.from()으로 받아야 한다.
			data:JSON.stringify(Array.from(todo)),
//			data:JSON.stringify(todo),
			contentType:"application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}
	function checkBox(){
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
       }
	
	function add(todo,callback,error){
	console.log("todo add......");

	$.ajax({
		type:'post',
		url:'/todo/new',
		data:JSON.stringify(todo),
		contentType : "application/json; charset=utf-8",
		success:function(result, status, xhr){
			if(callback){
				callback(result);
			}
		},
		error : function(xhr, status, err){
			if(error){
				error(err);
				}
			}
		});
	}
	
	function getList(sno, callback, error){
		
		
		$.getJSON("/todo/list/"+sno+".json",
				function(data){
					if(callback){
						callback(data);
					}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
//	
//	function remove(rno, replyer, callback, error){
//		$.ajax({
//			type:'delete',
//			url:'/replies/'+rno,
//			data:JSON.stringify({rno:rno, replyer:replyer}),
//			contentType:"application/json; charset=utf-8",
//			success: function(deleteResult, status, xhr){
//				if(callback){
//					callback(deleteResult);
//				}
//			},
//			error: function(xhr, status, err){
//				if(error){
//					error(err);
//				} 
//			}
//		});
//	}
//	
//	function update(reply, callback, error){
//		
//		console.log("RNO: "+reply.rno);
//		
//		$.ajax({
//			type:'put',
//			url :'/replies/'+reply.rno,
//			data:JSON.stringify(reply),
//			contentType:"application/json; charset=utf-8",
//			success : function(result,status,xhr){
//				if(callback){
//					callback(result);
//				}
//			},
//			error : function(xhr,status,err){
//				if(error){
//					error(err);
//				}
//			}
//		});
//	}
//	
//	function get(rno, callback, error){
//		$.get("/replies/"+rno+".json",function(result){
//			if(callback){
//				callback(result);
//			}
//		}).fail(function(xhr,status,err){
//			if(error){
//				error();
//			}
//		});
//	}
//	
	function displayTime(timeValue){
		var today = new Date();
		
		Date.prototype.getYearYY = function(){
			 var temp = this.getYear();
			 return temp >= 100 ? temp-100 : temp;
			}
		
//		만기 - 현재시간
		var gap = timeValue-today.getTime();
		
		var dateObj = new Date(timeValue);
		
		var gapObj = new Date(gap);
		//하루 이내일시
		if(gap <= 0){
			return "기한 만료";
		} else{
			if(gap < (1000 * 60* 60 * 24)){
				var hh = dateObj.getHours();
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();
				
				var gh = gapObj.getHours();
				var gm = gapObj.getMinutes();
				var gs = gapObj.getSeconds();
				
				//한시간 이내일시
				if(gap < (1000 * 60 * 60)){
					return gm+"분";
				} else {
					return gh+"시간";
				}
				
			} else {
				var yy = dateObj.getYearYY();
				var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
				var dd = dateObj.getDate();
				
				return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					( dd > 9 ? '' : '0') + dd ].join('');
			}
		}
	}
return{
	check:check,
	add: add,
	getList:getList,
	checkBox:checkBox,
//	remove:remove,
//	update:update,
//	get:get,
	displayTime : displayTime
};
})();