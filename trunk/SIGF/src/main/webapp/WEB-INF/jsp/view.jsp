<%@include file="include_1.jsp" %>

${message}

<c:forEach items="${lista}" var="str">
    <p>${str}</p>
</c:forEach>
<%@include file="footer.jsp" %>