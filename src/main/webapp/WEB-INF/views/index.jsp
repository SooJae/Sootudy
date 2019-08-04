<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript" src="/resources/dist/js/webSocket.js"></script>

<!-- <div class="ml-5">
  <div id="connect-container" class="ui centered grid">
        <div class="row">
            <button id="connect" onclick="connect();" class="ui green button ">Connect</button>
            <button id="disconnect" disabled="disabled" onclick="disconnect();" class="ui red button">Disconnect</button>
        </div>
        <div class="row">
            <textarea id="message" style="width: 350px" class="ui input" placeholder="Message to Echo"></textarea>
        </div>
        <div class="row">
            <button id="echo" onclick="echo();" disabled="disabled" class="ui button">Echo message</button>
        </div>
    </div>
    <div id="console-container">
        <h3>Logging</h3>
        <div id="logging"></div>
    </div>
</div> -->

<body>

<div class="jumbotron">
    <h1>chat room</h1>
</div>

<div class="container">

    <div class="col-sm-12 col-md-12">
        <textarea cols="80" rows="15" id="chatArea" class="form-control"></textarea>
    </div>
    <div class="col-sm-12 col-md-12">
        <input type="text" id="chatInput" class="form-control"/>
        <input type="button" id="sendBtn" value="전송" class="btn btn-primary btn-small"/>
    </div>

</div>
</body>
</html>



<%@ include file="includes/footer.jsp" %>