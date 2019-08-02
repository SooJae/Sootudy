console.log("study module...");
//
var studyService=(function(){
	
	function add(reply,callback,error){
		console.log("reply......");

	$.ajax({
		type:'post',
		url:'/replies/new',
		data:JSON.stringify(reply),
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
	
	function getList(page, callback, error){
		
		var page =page||1;
		
		$.getJSON("/study/list/"+page+".json",
				function(data){
					if(callback){
						callback(data.total, data.list);
					}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function remove(rno, replyer, callback, error){
		$.ajax({
			type:'delete',
			url:'/replies/'+rno,
			data:JSON.stringify({rno:rno, replyer:replyer}),
			contentType:"application/json; charset=utf-8",
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				} 
			}
		});
	}
	
	function update(reply, callback, error){
		
		console.log("RNO: "+reply.rno);
		
		$.ajax({
			type:'put',
			url :'/replies/'+reply.rno,
			data:JSON.stringify(reply),
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
	
	function get(rno, callback, error){
		$.get("/replies/"+rno+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime()-timeValue;
		
		var dateObj = new Date(timeValue);
		
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				( dd > 9 ? '' : '0') + dd ].join('');
	}
return{
	add: add,
	getList:getList,
	remove:remove,
	update:update,
	get:get,
	displayTime : displayTime
};
})();