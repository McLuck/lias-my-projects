
<%@include file="include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="<%=pathCSS%>themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=pathCSS%>support.css">
<link rel="stylesheet" href="<%=pathCSS%>vtabs.css">

<script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
<script type="text/javascript" src="<%=pathJS%>ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="<%=pathJS%>ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="<%=pathJS%>ui/jquery.ui.tabs.js"></script>


<script type="text/javascript" src="<%=pathJS%>concessionaria.js"></script>
<script type="text/javascript" src="<%=pathJS%>jquery.dataTables.js"></script>
<link href="<%=pathCSS%>jquery-ui_1.8.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="<%=pathJS%>jquery-ui.min_1.8.js"></script>



<script type="text/javascript">
            $(function() {
                $("#vtabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-tabs-nav');
                $("#vtabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
		
            });
        </script>
<title>Operacional</title>
<script>
    $(document).ready(function() {
        loadFrameMeioPagamentos(${cid});
        $("#accordion").accordion({ autoHeight: false });
    });
</script>
</head>
<body>

	<div id="accordion">
		<h3>
			<a href="#" onclick="loadFrameMeioPagamentos(${cid});">Meios de
				Pagamento</a>
		</h3>
		<div id="detalhe_meio_pagamento_frame"></div>




		<h3>
			<a href="#" onclick="loadConfigurationForArrecadacao(${cid});">Arrecadação</a>
		</h3>
		<div id="detalhe_arrecadacao_frame"></div>






		<h3>
			<a href="#" onclick="loadConfigurationForMalote(${cid});">Malotes</a>
		</h3>
		<div id="detalhe_malote_frame"></div>

	</div>




	<div id="screen_config_mp"
		style="border: solid 1px #0063DC; display: none; background-color: #F2F3FF; width: 350px; z-index: 30; position: absolute;">
		<form id="form_config_mp" name="form_config_mp" method="POST"
			onsubmit="return false;">
			<input type="hidden" name="id" id="id_mp_config" />
			<fieldset>
				<legend>Configuração</legend>
				<div id="config_mp_equip">
					<div style="width: 50%; float: left;">
						Marca: <input type="text" name="marca"
							id="config_marca_visa_vale_pedagio" />
					</div>

					<div style="width: 49%; float: right;">
						Modelo: <input type="text" name="modelo"
							id="config_modelo_visa_vale_pedagio" />
					</div>
				</div>

				<div id="config_mp_contato">
					<fieldset>
						<legend>Contato</legend>
						Nome:<br /> <input type="text" name="nome"
							id="nome_contato_config_visa_vale_pedagio" /> <br /> Email:<br />
						<input type="text" name="email"
							id="email_contato_config_visa_vale_pedagio" /> <br /> Telefone:<br />
						<input type="text" name="telefone"
							id="nome_contato_config_visa_vale_pedagio" /> <br />
					</fieldset>
				</div>
				
				<input type="image" src="images/salvar_img.png" style="width: 60px;height: 20px;padding-top: 16px;display: inline;" onclick="closeConfigMP();" />
				<!-- <input type="image" onclick="salvarConfigMP();" alt="Salvar" title="Salvar" style="width: 30px; height: 30px; text-align: right; float: right;" src="images/check.png" /> -->
				<!-- <button onclick="salvarConfigMP();">Salvar</button> -->
				<input type="image" onclick="closeConfigMP();" alt="Fechar" title="Fechar" style="width: 30px; height: 30px; text-align: right; float: right;" src="images/back.png" />
				<!-- <button onclick="closeConfigMP();">Fechar</button> -->
			</fieldset>
		</form>
	</div>
	<div style="text-align: right">
		<input type="image" src="images/salvar_img.png" style="width: 60px;height: 20px;padding-top: 16px;display: inline;" onclick="saveAllOperacional(${cid});" />
		
		<%-- <input type="image" onclick="saveAllOperacional(${cid});" alt="Salvar" title="Salvar" style="width: 40px; height: 40px; text-align: right; float: right;" src="images/check.png" /> --%>
		<%-- <button value="Salvar" onclick="saveAllOperacional(${cid});">Salvar</button> --%>
	</div>

</body>
</html>