<%@include file="../include.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="stylesheet" href="css/thickbox.css">
<style type="text/css">
#TB_window { position: absolute; background: #ffffff; z-index: 102; color:#000000; display:none; border: 4px solid #525252; text-align:left; top:36%; left:50%; }
.display tr td a {
	text-decoration: none;
	font-family: Verdana;
	font-size: 12px;
	color: black;
}
</style>
</head>
<body>


	<table id="pistaslista" style="width: 890px;" class="display">
		<thead style="font-weight: normal;">
			<tr>
				<th width="50px"><label style="font-weight: normal;">Código</label>
				</th>
				<th width="80px"><label style="font-weight: normal;">Sentido</label>
				</th>
				<th width="100px"><label style="font-weight: normal;">Localização</label>
				</th>
				<th width="80px"><label style="font-weight: normal;">Tipo</label>
				</th>
				<th width="150px"><label style="font-weight: normal;">Nome
						da Máquina</label>
				</th>
				<th width="150px"><label style="font-weight: normal;">IP
						da Máquina</label>
				</th>
			</tr>
		</thead>
		<%
			int i = 0;
		%>
		<c:forEach items="${pistas}" var="pts">
			<c:if test="${pts!=null}">
				<%
					i++;
				%>
				<tr id="pista_table_content_${pts.id}"
					<%if(i%2==0)out.print("class='even'");else out.print("class='odd'");%>>
					
					<td width="50px">
						<a href="#TB_inline?height=50&width=980&inlineId=divform_edit_${pts.id}" class="thickbox">${pts.id}</a>
					</td>
					
					<td width="80px">${pts.sentido}</td>
					<td width="100px">${pts.idLocalizacao}</td>
					<td width="80px">${pts.tipoStr}</td>
					<td width="150px">${pts.nomeMaquina}</td>
					<td width="150px">${pts.ipMaquina}</td>
				</tr>
			</c:if>
		</c:forEach>
		<tr>
			<form onsubmit="return false;" id="form_pista_new" method="post">
				<input type="hidden" name="idPraca" value="${pracaid}" /> <input
					type="hidden" name="pracaid" value="${pracaid}" />
				<td><input type="text" style="width: 50px;" readonly name="id" onkeyup="runScript('_new', event);"
					size="3" value="0" /></td>
				<td><select name="sentido" style="width: 80px;" onkeyup="runScript('_new', event);">
						<option>${siglaS1}</option>
						<option>${siglaS2}</option>
						<option>${siglaS3}</option>
				</select></td>
				<td><input type="text" style="width: 100px;"
					id="idLocalizacao_input_new" name="idLocalizacao" size="6" onkeyup="runScript('_new', event);" /></td>
				<td><select name="tipo" style="width: 80px;" onkeyup="runScript('_new', event);">
						<c:forEach items="${tipospista}" var="tppt">
							<option value="${tppt.id}">${tppt.nome}</option>
						</c:forEach>
				</select></td>
				<td><input type="text" style="width: 150px;"
					onkeyup="runScript('_new', event);" id="nomeMaquina_new" name="nomeMaquina" size="10" /></td>
					
				<td width="150px"><input type="text" id="ipMaquina_new"
					style="width: 150px; float: left; margin-right: 4px;"
					name="ipMaquina" size="15" maxlength="15" onkeyup="runScript('_new', event);"
					onkeypress="return ( maskIP(event,this) );"
					onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';"
					onfocus="this.style.backgroundColor='transparent';" /></td>
			</form>
		</tr>
	</table>

	
	
		<c:forEach items="${pistas}" var="pts">
			<div style="display: none;" id="divform_edit_${pts.id}">
				<form onsubmit="return false;" id="form_pista${pts.id}" method="post">
					<table style="width: 890px" class="display">
						<thead>
							<tr>
								<th style="width: 80px;">Código</th>
								<th style="width: 80px;">Praça</th>
								<th style="width: 50px;">Sentido</th>
								<th style="width: 80px;">Tipo</th>
								<th style="width: 150px;">Nome Máquina</th>
								<th style="width: 150px;">IP Máquina</th>
							</tr>
						</thead>
						<tr class='odd'>
							<td style="width: 80px;"><input type="text" readonly name="id" size="3"
								onkeyup="runScript(${pts.id}, event);" style="width: 50px;"
								value="${pts.id}" /></td>
							<td width="80px"><select name="sentido" style="width: 80px;"
								onkeyup="runScript(${pts.id}, event);">
									<option value="${siglaS1}">${siglaS1}</option>
									<option value="${siglaS2}">${siglaS2}</option>
									<option value="${siglaS3}">${siglaS3}</option>
							</select></td>
							<td width="50px"><input type="text" style="width: 100px;"
								name="idLocalizacao" onkeyup="runScript(${pts.id}, event);"
								id="idLocalizacao_input${pts.id}" size="6"
								value="${pts.idLocalizacao}" /></td>
							<td width="80px"><select name="tipo" id="tipo%{pts.id}"
								style="width: 80px;" onkeyup="runScript(${pts.id}, event);">
									<c:forEach items="${tipospista}" var="tppt">
										<option value="${tppt.id}">${tppt.nome}</option>
									</c:forEach>
							</select></td>
							<td><input type="text" onkeyup="runScript(${pts.id}, event);"
								style="width: 150px;" name="nomeMaquina" id="nomeMaquina${pts.id}"
								size="10" value="${pts.nomeMaquina}" /></td>
							<td width="150px"><input type="text"
								onkeyup="runScript(${pts.id}, event);" name="ipMaquina"
								style="width: 150px;" id="ipMaquina${pts.id}" size="15"
								value="${pts.ipMaquina}" maxlength="15"
								onkeypress="return ( maskIP(event,this) );"
								onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';"
								onfocus="this.style.backgroundColor='transparent';" /></td>
						</tr>
					</table>
				</form>
			</div>
		</c:forEach>
</body>
</html>
