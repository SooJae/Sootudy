console.log("study module...");
//
var studyChatService=(function(){
	
	
	function join(study,callback,error){

		$.ajax({
			type:'post',
			url:'/study/enter/'+study.sno,
			data:JSON.stringify(study),
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
	
	function getMessage(sno,callback, error){
		
		
		$.getJSON("/study/chat/"+sno+".json",
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
	
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime()-timeValue;
		
		var dateObj = new Date(timeValue);
		
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; //getMonth() is zero-based
			var dd = dateObj.getDate();
			var h = dateObj.getHours();
			var m = dateObj.getMinutes();
			
			return [ (mm > 9 ? '' : '0') + mm, '/',
				( dd > 9 ? '' : '0') + dd, (h > 9 ? '' : '0'),' ', h,':', (m > 9 ? '' : '0'), m ].join('');
	}
return{
	getMessage:getMessage,
	displayTime : displayTime,
	join : join
};
})();