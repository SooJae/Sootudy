console.log("boardlike module...");
//
var boardLikeService=(function(){
	
	function like(like,callback,error){
		console.log("like......");

	$.ajax({
		type:'post',
		url:'/board/like',
		data:JSON.stringify(like),
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
	
	function getLike(bno,callback, error){
		
		console.log("getLike......");

		$.ajax({
			type:'post',
			url:'/board/getLike',
			data:JSON.stringify({bno:bno}),
			contentType:"application/json; charset=utf-8",
			dataType:"text",
			success:function(result, status, xhr){
				console.log("getLike22.res"+result);
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
		
		if(gap < (1000 * 60* 60 * 24)){
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi>9 ? '' : '0') +mi,
				':',(ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				( dd > 9 ? '' : '0') + dd ].join('');
		}
	}
return{
	like: like,
	getLike:getLike,
};
})();