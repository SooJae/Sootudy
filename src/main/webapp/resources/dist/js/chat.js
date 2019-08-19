var chatService=(function(){
	
	function add(room_name,callback,error){

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
	
	function cnt(room,callback,error){

	$.ajax({
		type:'post',
		url:'/chat/room/cnt',
//		data:JSON.stringify(room),
		data:JSON.stringify(room),
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
	
	function getCnt(bno,callback, error){
		

		$.ajax({
			type:'post',
			url:'/chat/room/getCnt',
			data:JSON.stringify({roomId:roomId}),
			contentType:"application/json; charset=utf-8",
			//dataType:"text",
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
	cnt:cnt,
	getCnt:getCnt,
	displayTime : displayTime
};
})();