<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>


<h4><c:out value="${exception.getMessage() }"></c:out></h4>

<ul>
  <c:forEach items="${exception.getStackTrace()}" var="stack">
    <li><c:out value="${stack }"></c:out></li>
    </c:forEach>
</ul>


<%@ include file="../includes/footer.jsp" %>