<%-- 
    Document   : index
    Created on : 25/08/2011, 09:02:42
    Author     : lamancio
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/layout1.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/dock-example1.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/stack_menu.css">

<title>Administração SIGF</title>
<noscript>
	<style type="text/css">
#dock {
	top: -32px;
}

a.dock-item {
	position: relative;
	float: left;
	margin-right: 10px;
}

.dock-item span {
	display: block;
}
</style>
</noscript>
<script type="text/javascript">
	function verificaNovoCliente() {
		if (window
				.confirm("Você está prestes a criar uma nova Concessionária.\nIsto irá iniciar um novo registro no banco de dados antes de você começar a preencher os dados.\nTem certeza desta ação?")) {
			document.getElementById("contentFrame").setAttribute("src",
					"admNavegacao.htm");
		}
	}
</script>
</head>
<body>
	<p style="text-align: center;">
		<a target="contentFrame" href="inicial.html"><span>Início</span></a> <b>|</b>
		<a target="contentFrame" href="admNavegacao.htm?cmd=ccs"><span>Clientes</span></a> <b>|</b>
		<a target="contentFrame" href="javascript:verificaNovoCliente();"><span>Novo Cliente</span></a> <b>|</b> 
		<a target="contentFrame" href="bdModelController.htm"><span>Inserts</span></a>
	</p>


	<iframe src="inicial.html" style="border: none;background-color:transparent;" scrolling="no"
		height="900px" frameborder="0" width="999px" id="contentFrame"
		name="contentFrame" allowtransparency="true"> Seu navegador não suporta quadros </iframe>
</body>
</html>
