<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Iniciar Edição de INI para Concessionária</title>
<link href="css/jquery-ui_1.8.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui_1.8.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/jquery-ui-1.8.5.min.js"></script>
<script>
	var closed = true;
	function carregarDados() {
		$("#mainFrameDiv").html("<p>Aguarde, por favor...</p>");
		$.ajax({
			url : 'concessionaria.htm?cmd=listaConcessionaria',
			success : function(data) {
				$('#mainFrameDiv').html(data);
				$("#mainFrameDiv").dialog({ title: "Seleção de Concessionária", close: function(event, ui) { closed=true; }, minWidth: 400 });
				closed = false;
			}
		});
	}
	$(document).ready(function() {
		carregarDados();
	});
</script>
<style type="text/css">
	ul {
		margin: 0;
		padding: 0;
	}
	ul li {
		list-style-type: circle;
		margin: 1px;
		padding: 0px;
		cursor: pointer;
		font-size: 13px;
	}
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<div id="mainFrameDiv"></div>
</body>
</html>