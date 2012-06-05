<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../jsdefault.jsp" flush="true" />
<script type="text/javascript">
	function salvarOnly(){
		$("#cmd2").val("savePraca");
		$("#formprc").submit();
	}

	function salvarIrLocal(){
		$("#cmd2").val("savePracaAndGo");
		$("#formprc").submit();
	}
</script>
</head>
<body>
	<form name="formprc" id="formprc" action="gerenciarPracasCompleta.htm?salvarPracaFromForm">
		<fieldset style="width: 620px; padding-left: 10px; padding-right: 10px; height: 160px;">
			<legend>Dados da praça</legend>
			<div>
				<label>Código:</label> 
				<input type="text" id="prcNum" size="4" maxlength="3" placeholder="000" name="numeroPraca" value="${praca.numeroPraca}" style="width: 50px;" />
				<input type="hidden" id="prcId" name="id" value="${praca.id}" />
				<input type="hidden" id="cmd2" name="cmd2" value="save" />				
			</div>
		
			<div style="float: left;">
				<label>Nome:</label>
				<input type="text" name="nome" onkeypress="changer(this, event);" placeholder="Nome da praça" style="margin-right: 5px; width:290px;" size="30" id="nomepraca" maxlength="30" value="${praca.nome}" />
			</div>
			<div style="float: left; margin-right: 5px; float: right;">
				<label>CNPJ:</label>
				<input type="text" name="cnpj" onkeypress="changer(this, event);" placeholder="00.000.000/0000-00" style="margin-right: 5px;width: 290px;" size="15" id="cnpjpraca" maxlength="18" value="${praca.cnpj}" />
			</div>
		
			<br />
			<div style="float: left; display: inline-block;">
				<label>Tráfego estimado:</label>
				<input type="text" name="trafegoEstimado" onkeypress="changer(this, event);" placeholder="0000" style="margin-right: 5px;width:290px" size="6" id="trafegopraca" maxlength="6" value="${praca.trafegoEstimado}" />
			</div>
			<div style="display: inline-block; float: right; padding-right: 5px;">
				<label>Distância CCA:</label>
				<input type="text" name="distanciaCCA" onkeypress="changer(this, event);" placeholder="0000" style="margin-right: 5px;width: 290px;" size="10" id="distccapraca" maxlength="15" value="${praca.distanciaCCA}" />
			</div>
			<div style="float: right; margin-right: 4px; text-align: center; background-color: #eee; font-family: Verdana; font-size: 11px">
				<a href="#">Salvar</a>
			</div>
		</fieldset>
	</form>
</body>
</html>