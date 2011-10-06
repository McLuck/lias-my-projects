<%@include file="../include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Praca</title>
<script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
<script type="text/javascript" src="<%=pathJS%>jquery.tools.min.js"></script>

<link rel="stylesheet" href="<%=pathCSS%>support.css">
<script type="text/javascript">
      	
		function verificaTeste(e, nCaract){
			/* nCaract = document.getElementById("teste"); */
			if(nCaract.value == "  , "){
				nCaract.value = "";
			}
			if (!e) var e = window.event
			if (e.keyCode) code = e.keyCode;
			else if (e.which) code = e.which;
			
			if(nCaract.value.length<2){
				if(code<65 || code > 90){
					return false;
				}
			}
			
					
			switch(nCaract.value.length){
				case 2: nCaract.value += ", ";
					return true;
				case 3: nCaract.value += " ";
					return true;
			}
			
			return true;
		}
		
		</script>
</head>
<body>
	<div id="screen_dados_praca">
		<form action="" method="POST" id="form_dados_praca"
			name="form_dados_praca">
			<input type="hidden" value="${cid}" name="cid" id="cidd" />
			<fieldset
				style="width: 620px; padding-left: 10px; padding-right: 10px">
				<legend>Dados da Praça</legend>
				<div style="float: left;">
					<label>Código:</label>
					<form:input path="praca.id" id="prcid" size="4" maxlength="4"
						cssStyle="width:50px; " readonly="true" />
				</div>

				<div style="display: inline-block; float: right;">
					<label>Nome:</label>
					<form:input path="praca.nome" onkeypress="changer(this, event);"
						cssStyle="margin-right: 5px; width:545px;" size="30" id="nome"
						maxlength="30" />

					<%-- <label>Localização:</label>
	                    <form:input cssStyle="margin-right: 5px;width:250px;" path="praca.localizacoes" onkeypress="changer(this, event);" id="localizacoes" size="30" maxlength="60" /> --%>
				</div>
				<br />
				<div style="float: left; margin-right: 5px;">
					<label>CNPJ:</label>
					<form:input cssStyle="margin-right: 5px;width: 194px;"
						path="praca.cnpj" size="15" onkeypress="changer(this, event);"
						id="cnpj" maxlength="15" />
				</div>


				<div style="display: inline-block; float: right;">
					<label>Distância CCA:</label>
					<form:input path="praca.distanciaCCA"
						cssStyle="margin-right: 5px;width: 194px;"
						onkeypress="changer(this, event);" size="10" id="distanciaCCA"
						maxlength="15" />
				</div>


				<div style="float: left; display: inline-block;">
					<label>Tráfego Estimado:</label>
					<form:input path="praca.trafegoEstimado"
						onkeypress="changer(this, event);" size="6"
						cssStyle="margin-right: 5px;width:194px;" id="trafegoEstimado"
						maxlength="6" />
				</div>

				<div style="display: block; clear: both;">
					<label>Descrição:</label>
					<form:textarea path="praca.descricao"
						onkeypress="changer(this, event);" id="descricao" rows="2"
						cssStyle="margin-right: 5px;width: 610px;height: 50px;" cols="90"></form:textarea>
				</div>



				<div style="display: inline-block; float: left;">
					<label>Sentido1:</label>
					<form:input path="praca.prcSent1"
						cssStyle="margin-right: 5px; width: 250px;"
						onkeypress="return verificaTeste(event, this);" onkeyup="changer(this, event);" id="sentido1" maxlength="60" />
				</div>

				<div style="display: inline-block;">
					<label>Sentido2:</label>
					<form:input path="praca.prcSent2"
						cssStyle="margin-right: 5px; width: 250px;" onkeypress="return verificaTeste(event, this);"
						onkeyup="changer(this, event);" id="sentido2" maxlength="60" />
				</div>

				<div style="float: right; margin-right: 20px;">
					<!-- <img alt="Cancelar Edição" title="Cancelar Edição" src="images/back.png" width="20px" height="20px" border="0px" style="padding-right: 5px;" onclick="closePraca();" /> -->
					<img alt="Salvar" title="Salvar" style="padding-top: 13px;" src="images/save.png" width="20px"
						height="20px" border="0px" onclick="autoSave();" />
				</div>

			</fieldset>
		</form>
		<p align="center" style="color: red;" id="msg_status">&nbsp;</p>
	</div>
</body>
</html>
