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
<title>Insert title here</title>
<script src="js/jquery.js"></script>
</head>
<body>
	<%-- <label>Selecione a praça que deseja editar</label>
	<select onchange="loadPraca();" onclick="loadPraca();"
		id="select_praca_for_config">
		<option value="0">&nbsp;</option>
		<c:forEach items="${pracas}" var="pc">
			<option value="${pc.id}">${pc.nome}</option>
		</c:forEach>
	</select>
	<input type="hidden" name="cidd" id="cidd" value="${cid}" />

	<c:forEach items="${pracas}" var="pc">
		
		<iframe src="formConfigPracaCV.htm?pid=${pc.id}&cid=${cid}" style="border: none; display: none;"
					scrolling="no" height="600px" frameborder="0" width="700px"
					id="ifrm${pc.id}" class="frm_hide"	name="ifrm${pc.id}"> Seu navegador não suporta Frames </iframe>
	</c:forEach> --%>
	
	
	
	
	<ul>
    	<c:forEach items="${pracas}" var="pc">
	    	<li id="li_prc_prc${pc.id}">
	    		<a href="#" onclick="ogn_prc(${pc.id});">${pc.nome}</a>
	    	</li>
    	</c:forEach>
    </ul>
    <input type="hidden" name="cidd" id="cidd" value="${cid}" />
</body>
</html>