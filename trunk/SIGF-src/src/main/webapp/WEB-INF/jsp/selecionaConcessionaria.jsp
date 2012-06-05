<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lista Concessionarias</title>
</head>
<body>
	<ul>
		<c:forEach items="${concs}" var="c">
		    	<li id="li_concs_${c.id}">
		    		<a href="index.jsp?cid=${c.id}&cnome=${c.nome}">${c.nome}</a>
		    		-
		    		<a href="concessionaria.htm?cid=${c.id}&cmd=clone">(clonar)</a>
		    	</li>
	   	</c:forEach>
   	</ul>
</body>
</html>