<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String pathJS = "js/";
	String pathCSS = "css/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>configurações da Praça</title>
</head>
<body>

		<label>Selecione a praça que deseja editar</label>
	    <select onchange="loadPraca();" onclick="loadPraca();" id="select_praca_for_config">
	        <c:forEach items="${pracas}" var="pc">
	            <option value="${pc.id}">${pc.nome}</option>
	        </c:forEach>
	    </select>
	    <input type="hidden" name="cidd" id="cidd" value="${cid}" />
	    <p id="msg_status_pracas_tab">
	        &nbsp;
	    </p>
	    <div id="tab_ConfigPracas">
	    </div>
</body>
</html>