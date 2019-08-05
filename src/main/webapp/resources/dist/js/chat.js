var chatService=(function(){
	
	function add(room_name,callback,error){
		console.log("chat add......"+room_name);

		$.ajax({
			type:'post',
			url:'/chat/new',
			data:JSON.stringify({name:room_name}),
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
	
	function getList(callback, error){
		
		var bno = param.bno;
		var page =param.page||1;
		
		$.getJSON("/chat/room",
				function(data){
					if(callback){
						callback(data.reply_cnt, data.list);
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
	add: add,
	getList:getList,
	remove:remove,
	update:update,
	get:get,
	displayTime : displayTime
};
})();