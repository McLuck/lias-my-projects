<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Relatorios</title>
</head>
<body>
	<p id="msg_sts_divida">&nbsp;</p>
	<form action="#" onsubmit="return false" id="formDividaTermo"
		name="formDividaTermo">
		<fieldset>
			<legend>Termo de reconhecimento de dívida</legend>
			<form:checkbox path="conc.imprimirTermoDivida"
				label="Imprimir termo de reconhecimento de dívida individual"
				cssClass="SpecialCaseForLabel" />
			
			<label>Texto do termo de reconhecimento de dívida</label>
			<form:textarea path="conc.textoTermoDivida" id="textoTermoDivida" cols="100" rows="10" />
			<script language="javascript1.2">
				generate_wysiwyg('textoTermoDivida');
			</script>
		</fieldset>
	</form>
	<input type="image" src="images/check.png"
		style="width: 40px; height: 40px; float: right;" alt="Salvar"
		title="Salvar" onclick="saveDividas(${cid});" />
</body>
</html>