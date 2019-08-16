<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %> 


<!DOCTYPE HTML>
<html>
<head>
    <title> SpringBoot & AWS S3</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script
        src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>
    S3 이미지 업로더
</h1>
<div class="col-md-12">
    <div class="col-md-2">
        <form>
            <div class="form-group">
                <label for="img">파일 업로드</label>
                <input type="file" id="img">
            </div>
            <button type="button" class="btn btn-primary" id="btn-save">저장</button>
        </form>
    </div>
    <div class="col-md-10">
        <p><strong>결과 이미지입니다.</strong></p>
        <img src="" id="result-image">
    </div>
</div>


<script>
//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";
$(document).ajaxSend(function(e, xhr, options){
  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
}); 

    $('#btn-save').on('click', uploadImage);

    function uploadImage() {
        var file = $('#img')[0].files[0];
        var formData = new FormData();
        formData.append('data', file);

        $.ajax({
            type: 'POST',
            url: '/uploadAjaxCert',
            data: formData,
            processData: false,
            contentType: false
        }).done(function (data) {
            $('#result-image').attr("src", data);
        }).fail(function (error) {
            alert(error);
        })
    }
</script>
</body>
</html>




<%@ include file="includes/footer.jsp" %>