var pre_diffHeight = 0;
      var bottom_flag = true;
      var custom_chat_scroll = function(){
    	  //채팅창 크기
              var objDiv = document.getElementById("custom-chat");
       
              if((objDiv.scrollTop + objDiv.clientHeight) == objDiv.scrollHeight){
                      // 채팅창 전체높이 + 스크롤높이가 스크롤 전체높이와 같다면
                      // 이는 스크롤이 바닥을 향해있다는것이므로
                      // 스크롤 바닥을 유지하도록 플래그 설정
                      bottom_flag = true;
              }

       if(pre_diffHeight > objDiv.scrollTop + objDiv.clientHeight ){
                      // 스크롤이 한번이라도 바닥이 아닌 위로 상승하는 액션이 발생할 경우
                      // 스크롤 바닥유지 플래그 해제
                      bottom_flag = false;  
       }
              //
              pre_diffHeight = objDiv.scrollTop + objDiv.clientHeight
      };

      
      function updated() {
          // 변화가 발생할때마다 수행되는 영역

          var objDiv = document.getElementById("custom-chat");
          if(bottom_flag){
              // 채팅창 스크롤 바닥 유지
              objDiv.scrollTop = objDiv.scrollHeight;
          }
      }