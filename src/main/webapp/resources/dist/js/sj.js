var id = 0;

var joinCheckService =(function(){
    
    async function checkForm(focus){
        var formGroup = focus.parent().parent();
        var pwCheck = formGroup.find("#pw2");
        var pw =formGroup.find("#pw");
        var focusID = focus.attr("id");
        try{
            if(focusID === "id"){
            let checkArg = focus.attr("id");
            let res = await checkRexID(focus);
            let res2 = await checkDuplicateID(res,checkArg);
            await designForm(focus,res2);
            return;
            }
            if(focusID === "nickname"){
                let res= await checkRexNickName(focus);
                return await checkDuplicateNickName(res,callback);
            }
            if(focusID === "pw"){
                return await checkPW(focus,pwCheck);
            }
            if(focusID === "pw2"){
                return await checkPW2(focus,pw);
            }
            if(focusID === "email"){
                let res = await checkRexEmail(focus);
            }
        } catch (e){
            //return "메롱";
            //return e.message;
            focus.siblings("label").text(e.message);
        }
    }

    var checkRexID = function(focus){
         var reg = /[^a-z0-9]/gi; //영어 숫자만 가능

        if(reg.test(focus.val())){
            focus.val(focus.val().replace(reg , ""));
            throw new Error("영어와 숫자로만 입력해주세요");
        } 
        if(4<=focus.val().length && focus.val().length<=12 ){
        	return focus.val();
        } 
          	 	
        else {
        	focus.parent().removeClass().addClass("form-group danger-form");
    		focus.siblings("i").removeClass().addClass("fas fa-times-circle timesIcon");
    		throw new Error("아이디를 입력해주세요 (영어+숫자조합 4~12자))");
            
        }  

    };

    var checkRexNickName = function(focus){
        //특수문자 사용불가
        var reg = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
            if(reg.test(focus.val())){
                focus.val(focus.val().replace(reg , ""));
                throw new Error("특수문자는 사용하실 수 없습니다");
            }
            if(2<=focus.val().length && focus.val().length<=8){
                return focus.val();
            }
            else{
                throw new Error("닉네임 입력해주세요 (2~8자)");
                }
    }


    var checkPW = function(focus, pwCheck){
         if(8<=focus.val().length && focus.val().length <=16){
            
         console.log(pwCheck.val().length);
            if(pwCheck.val().length>0){
                 if(focus.val()!=pwCheck.val()){
                       throw new Error("비밀번호가 일치하지 않습니다");
                    }
                 if(focus.val() == pwCheck.val()){
                     focus.siblings("label").text("비밀번호가 일치합니다.")
                }
            }
            else{
                focus.siblings("label").text("사용 가능한 비밀번호입니다");
            }
         }else{
                throw new Error("비밀번호를 입력해주세요 (8~16자)");
         }
    }
        
    var checkPW2 = function(focus,pw){
        if(focus.val() != pw.val()){
            throw new Error("비밀번호가 일치하지 않습니다");
        }
        else{
            focus.siblings("label").text("비밀번호가 일치합니다");
        }
    }

    var checkRexEmail =  function(focus){
    var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
    if(!reg.test(focus.val())){
       throw new Error("이메일의 형식에 맞게 작성해주세요");
    }
    
    else {
       // throw new Error("이메일을 입력해주세요");
        return focus.val();
    }
    }
/*    var successFunc= function(result){
    	return console.log("메롱");
    }*/
        
    var checkDuplicateID= function(focus,checkArg){
   
        var promise = $.ajax({
            type:'post',
            url: 'MemberJoinCheckAction.do',
            dataType:"json",
            data:{"val":focus,"checkArg":checkArg},
        });
        
        return promise.then(function(result){
        	//console.log("result",result);
        	return result.result.value;
        });
        
        
    }
    
    var designForm = function(focus,res2){
    	if(res2 === 0 ){
        	focus.parent().removeClass().addClass("form-group danger-form");
    		focus.siblings("i").removeClass().addClass("fas fa-times-circle timesIcon");
    		focus.siblings("label").text("이미 사용중인 아이디입니다.");
    	}
    	if(res2 === 1){
        	focus.parent().removeClass().addClass("form-group danger-form");
    		focus.siblings("i").removeClass().addClass("fas fa-times-circle timesIcon");
    		focus.siblings("label").text("사용 가능한 아이디입니다");
    	}
    };
    
    return{
        checkForm:checkForm,
    };
    
    })();
