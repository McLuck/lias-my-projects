<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/thickbox.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.js"></script>
</head>
<c:forEach items="${pracas}" var="pc">
	<tr>
		<td><a title="Configurar Praças"
			href="configPracas.htm?cid=3&keepThis=true&TB_iframe=true&height=600&width=1024"
			id="link_" class="thickbox" style="z-index: 200;">
				${pc.description} </a></td>
	</tr>
</c:forEach>