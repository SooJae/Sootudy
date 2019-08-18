# Sootudy

Sootudy는 스터디 웹 사이트 입니다. 빼어날 수 (秀)에 Study를 합친 단어입니다.

# 개발 환경

## BACK-END
- JAVA
- JSP
- JSTL

## FRAMEWORK
- SPRING

## FRONT-END
- HTML
- JAVASCRIPT
- CSS
- JQUERY
- AJAX
- BootStrap

## DBMS
- MariaDB

## WEB SERVER
- APACHE TOMCAT 8.5

## Version Control
- git
- github

## build & deploy
- Jenkins
## notify
- Slack

## AWS
- EC2
- RDS(MariaDB)
- ~~S3~~ (S3 연결시 접속이 끊기는 현상이 발견되어 임시 중단하고, 게시물의 첨부 파일은 EC2에 올리도록 수정했습니다.)
- Router53
- AWS Certificate Manager(SSL 생성용입니다.)
- Elastic Load Balancer (http로 접속시 https로 redirect를 해주기 위해서 만들었습니다.)

# 동작방식
![structure](https://github.com/SooJae/Study/blob/master/portfolio/sootudy/img/structure.png)


# 서비스
## 전체 디자인
반응형 웹과 Font Awesome을 이용하여 꾸몄습니다. 가끔 반응형 디자인을 커스텀하거나 디자인을 바꾸고 싶은 부분은 직접 css를 이용하여 디자인을 했습니다. 

## 로그인 및 회원가입

### 유효성 검사 
keyup이벤트와 **Ajax**를 이용하여 실시간으로 중복여부 확인과 **정규식**과 **replace** 함수를 이용하여 특수문자 등 입력 시 바로 삭제가 되도록 만들었습니다. 하지만   
**keyup 이벤트 때문에 한글자씩 입력마다 DB를 호출함에 따라 DB 과부화와 비용이 증가했습니다.**  
**해결 방법 :** 디바운싱 개념을 이용하여 70ms이하로 keyup 이벤트 발생시 Ajax이 되지 않도록 했습니다.

## 게시판
게시판을 어떻게 하면 평범하지 않게 만들 수 있을지 많은 생각을 했습니다. 우선 디자인에 많은 신경을 썼습니다. 컴퓨터와 폰으로 접속할 시 각각 보이는 화면의 수정을 반복했고, 만족한 결과를 만들었습니다.    
또한 게시판에 추천 기능을 넣었습니다. 하나의 게시물에 하나의 아이디만 추천(복합키 이용)을 할 수 있고, 재 추천을 할 경우 취소되도록 만들었습니다.
게시판 리스트의 왼쪽 하단 '인기글' 버튼을 클릭하면 추천을 받은 게시물(현재 추천 1이상)만 나오도록 필터 기능을 넣었습니다.
댓글은 Path parameter를 이용하여 RestFul 하게 만들었습니다. 
검색과 첨부파일 기능도 넣었습니다.


## 스터디
스터디에는 WebSocket을 이용했습니다. Stomp와 SockJS라이브러리를 이용하여 스터디원들끼리 채팅이 가능하도록 만들었습니다.


## 채팅방
채팅방은 스터디의 채팅방과 비슷하게 Stomp를 이용한 것은 똑같지만, **아이디**가 필요없는 **익명 채팅방**을 만들었습니다.   
SessionStorage를 이용하여 아이디를 저장하여 채팅했다가 채팅방을 나가거나 세션이동시 자동으로 disconnect와 동시에 SessionStorage도 지우도록 만들었습니다.   
물론 이전 대화 목록도 불러오지 않도록 만들었습니다.
