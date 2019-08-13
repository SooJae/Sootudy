console.log("todo module...");
//
var studyTodoService=(function(){
	
//	function check(tdno, callback, error){
//
//		$.ajax({
//			type:'put',
//			url :'/todo/check'+tdno,
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
//	function displayTime(timeValue){
//		var today = new Date();
//		
//		var gap = today.getTime()-timeValue;
//		
//		var dateObj = new Date(timeValue);
//		
//			var yy = dateObj.getFullYear();
//			var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
//			var dd = dateObj.getDate();
//			
//			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
//				( dd > 9 ? '' : '0') + dd ].join('');
//	}
return{
//	check:check,
	add: add,
	getList:getList,
//	remove:remove,
//	update:update,
//	get:get,
//	displayTime : displayTime
};
})();