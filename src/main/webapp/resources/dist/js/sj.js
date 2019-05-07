//let instance = null;
let obj = {id :"아이디",nm:"닉네임",email:"이메일"};
class Form{
	constructor(focus){
		this.focus=focus;
/*		if(!instance){
			instance = this;
		}
		return instance;*/
	}
	success(){
		this.focus.parent().removeClass().addClass("form-group success-form");
		this.focus.siblings("i").removeClass().addClass("fas fa-check-circle checkIcon");
	}
	fail(){
		this.focus.parent().removeClass().addClass("form-group danger-form");
		this.focus.siblings("i").removeClass().addClass("fas fa-times-circle timesIcon");
	}
}

class SelectForm extends Form{
	constructor(focus){
		super(focus);
	}
	
	selectSuccess(){
		this.focus.siblings("label").text("사용 가능한 "+obj[this.focus.attr("id")]+"입니다");
		super.success();
	}
	
	selectFail() {
		this.focus.siblings("label").text("이미 사용중인 "+obj[this.focus.attr("id")]+"입니다.");
		super.fail();
	}
}


let joinCheckService =(function(){
    
	
    let checkForm =  async (focus)=>{
    	let f = new Form(focus);
        let formGroup = focus.parent().parent();
        let pwCheck = formGroup.find("#pw2");
        let pw =formGroup.find("#pw");
        let focusID = focus.attr("id");
        
        try{
            if(focusID === "id"){
	            let res = await checkRexID(focus);
	            let res2 = await checkDuplication(res,focusID);
	            return await designForm(focus,res2);
            }
            if(focusID === "nm"){
                let res= await checkRexNickName(focus);
                let res2= await checkDuplication(res,focusID);
                return await designForm(focus,res2);
            }
            if(focusID === "pw"){
                let res = await checkPW(pw,pwCheck);
            }
            if(focusID === "pw2"){
                return await checkPW2(pwCheck,pw);
            }
            if(focusID === "email"){
                let res = await checkRexEmail(focus);
                let res2 = await checkDuplication(res,focusID);
                return await designForm(focus,res2);
            }
        } catch (e){
        	f.fail();
            focus.siblings("label").text(e.message);
        }
    }

    let checkRexID = focus=>{
         let reg = /[^a-z0-9]/gi; //영어 숫자만 가능

        if(reg.test(focus.val())){
            focus.val(focus.val().replace(reg , ""));
            throw new Error("영어와 숫자로만 입력해주세요");
        } 
        if(4<=focus.val().length && focus.val().length<=12 ){
        	return focus.val();
        } 
          	 	
        else {
    		throw new Error("아이디를 입력해주세요 (영어+숫자조합 4~12자))");
            
        }  

    };

    let checkRexNickName = focus=>{
        //특수문자 사용불가
        let reg = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
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


    let checkPW = (focus, pwCheck)=>{
         if(8<=focus.val().length && focus.val().length <=16){
            
            if(pwCheck.val().length>0){
                 if(focus.val()!=pwCheck.val()){
                	 pwCheck.parent().removeClass().addClass("form-group danger-form");
                	 pwCheck.siblings("i").removeClass().addClass("fas fa-times-circle timesIcon");
                	 pwCheck.siblings("label").text("비밀번호가 일치하지 않습니다.")
                  }
                 if(focus.val() == pwCheck.val()){
             		focus.parent().removeClass().addClass("form-group success-form");
            		focus.siblings("i").removeClass().addClass("fas fa-check-circle checkIcon");
            		
                     /*focus.siblings("label").text("비밀번호가 일치합니다.");*/
             		pwCheck.parent().removeClass().addClass("form-group success-form");
             		pwCheck.siblings("i").removeClass().addClass("fas fa-check-circle checkIcon");
                    pwCheck.siblings("label").text("비밀번호가 일치합니다.");
                }
            }
            else{
            	focus.parent().removeClass().addClass("form-group success-form");
        		focus.siblings("i").removeClass().addClass("fas fa-check-circle checkIcon");
                focus.siblings("label").text("사용 가능한 비밀번호입니다");
            }
         }else{

                throw new Error("비밀번호를 입력해주세요 (8~16자)");
         }
    }
        
    let checkPW2 = (focus,pw)=>{
        if(focus.val() != pw.val()){
    		focus.parent().removeClass().addClass("form-group danger-form");
    		focus.siblings("i").removeClass().addClass("fas fa-times-circle timesIcon");
    		
            throw new Error("비밀번호가 일치하지 않습니다");
        }
        else{
    		focus.parent().removeClass().addClass("form-group success-form");
    		focus.siblings("i").removeClass().addClass("fas fa-check-circle checkIcon");
    		
            focus.siblings("label").text("비밀번호가 일치합니다");
        }
    }

    let checkRexEmail =  focus => {
    let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	    if(!reg.test(focus.val())){
	       throw new Error("이메일의 형식에 맞게 작성해주세요");
	    }
	    else {
	        return focus.val();
	    }
    }
        
    let checkDuplication= (focus,checkArg)=>{
    	let data ={"val" : focus,
    				"checkArg" : checkArg};
    	console.log(focus,checkArg);
        let promise = $.ajax({
            type:'POST',
            contentType:"application/json; charset=utf-8",
            url: '/member/check',
            data:JSON.stringify(data),
            dataType: "json"
        });
        
        return promise.then(function(result){
        	return result;
        });
        
        
    }
    
    let designForm = (focus,res2)=>{
    	var f2 = new SelectForm(focus);
    	if(res2 == 0 ){
    		f2.selectFail();
    	}
    	if(res2 == 1){
    		f2.selectSuccess();
    	}
    };
    
    return{
        checkForm:checkForm,
    };
    
    })();
