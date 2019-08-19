var boardLikeService=(function(){
	
	function like(like,callback,error){

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
		

		$.ajax({
			type:'post',
			url:'/board/getLike',
			data:JSON.stringify({bno:bno}),
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
	
return{
	like: like,
	getLike:getLike,
};
})();