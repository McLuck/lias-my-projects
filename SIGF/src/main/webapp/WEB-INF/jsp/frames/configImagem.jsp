<%@include file="../include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<%=pathJS%>concessionaria.js" type="text/javascript"></script>
<script src="<%=pathJS%>jquery.js"></script>
<style type="text/css">
	#ipserverinput{
		width: 100px;
	}
</style>

</head>
<body>
	<fieldset>
		<legend>Tipos de aquisição de imagens das pistas:</legend>
		<p id="msg_status_configImag1" style="color: red;"></p>
		<table width="100%" border="1">
			<thead>
				<tr>
					<th>Tipo de Pista</th>
					<th>VAS</th>
					<th>VES</th>
					<th>VAES</th>
					<th>OCR</th>
					<th>VBS</th>
				</tr>
			</thead>

			<form action="" onsubmit="return false;" method="POST"
				name="form_pts_img_adq" id="form_pts_img_adq">
				<c:forEach items="${confimg.tipoPista}" var="pts">
					<tr>
						<td>${pts.nome}</td>
						<td><input type="checkbox"
							${pts.imgVASStr} name="imgVAS${pts.id}" class="chb_form" />
						</td>
						<td><input type="checkbox"
							${pts.imgVESStr} name="imgVES${pts.id}" class="chb_form" />
						</td>
						<td><input type="checkbox"
							${pts.imgVAESStr} name="imgVAES${pts.id}" class="chb_form" />
						</td>
						<td><input type="checkbox"
							${pts.imgOCRStr} name="imgOCR${pts.id}" class="chb_form" />
						</td>
						<td><input type="checkbox"
							${pts.imgVBSStr} name="imgVBS${pts.id}" class="chb_form" />
						</td>
					</tr>
				</c:forEach>
			</form>
		</table>
	</fieldset>

	<form action="" onsubmit="return false;" id="form_cnfig_img_">
		<fieldset>
			<legend>Armazenamento</legend>
			<div style="width: 32%; float: left;">
				Servidor:<br />
				<form:select path="confimg.server">
					<form:option value="1" label="Aplicações" />
					<form:option value="2" label="Dedicado de imagens" />
				</form:select>

			</div>
			<div style="width: 32%; float: left;">
				IP:<br />
				<form:input path="confimg.ipServer" id="ipserverinput" cssStyle="width:10px" />
			</div>
			<div style="width: 32%; float: left;">
				Qual será a estrutura dos diretórios na qual serão armazenadas as
				imagens?<br />
				<form:select path="confimg.estruturaDiretorio">
					<form:option value="0" label="aaaamm\ddhh" />
					<form:option value="1" label="aaaa\mm\dd\hh" />
				</form:select>
			</div>

			<div style="width: 99%; clear: both;">
				<form:checkbox path="confimg.concatenaCodigoUrl"
					label="Código da praça será concatenado na URL da imagem?" />
				<br />
				<form:checkbox path="confimg.ordemExibicaCrescente"
					label="Ordem para exibição das imagens na pista em ordem crescente:" />
				<br />
				<form:checkbox path="confimg.transacaoCorrecaoImg"
					label="Habilitar transação de imagens na correção da transação:" />
				<br />
			</div>

		</fieldset>
	</form>
	<fieldset>
		<legend>Transações</legend>
		<div style="width: 50%; float: left;">
			<table border="0">
				<thead>
					<tr>
						<th>Transação</th>
						<th>Adquirir?</th>
					</tr>
				</thead>

				<form method="POST" action="" id="form_capt_por_tipo"
					name="form_capt_por_tipo" onsubmit="return false;">
					<c:forEach items="${confimg.tiposTransacoes}" var="tt">
						<tr>
							<td>${tt.nome}</td>
							<td><input type="checkbox"
								${tt.adqrImagStr} name="adquireImagem${tt.id}"
								id="adquireImagem${tt.id}" value="true" /></td>
						</tr>
					</c:forEach>
				</form>
			</table>
		</div>
		<div style="float: left;">
			Quantidade a ser adquirida:<br />
			<form:input path="confimg.qtdAdquirida" />
		</div>
	</fieldset>
	<div style="text-align: right;">
		<button onclick="saveAllImgConfig(${cid});" value="Salvar">Salvar</button>
	</div>
</body>
</html>
