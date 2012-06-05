<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>Pistas</legend>
		<table width="105%" class="display" id="tablePistas">
			<thead>
				<tr>
					<th width="50">Código</th>
					<th width="100">Localização</th>
					<th width="70">Sentido</th>
					<th width="70">Tipo</th>
					<th width="160">Nome Máquina</th>
					<th width="134">IP Máquina
						<div id="iconsEditPISTA" style="display: none; width: 60px; float: right;">
							<img alt="Cancelar" title="Cancelar" src="images/cancelar1.png" style="width: 15px; height: 15px; border: 0px; margin: 0px;" onclick="onClickFimEditPista();" /> 
							<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px; border: 0px; margin: 0px;" onclick="alterarPista();" /> 
							<img alt="Apagar" title="Apagar" src="images/remove.png" style="width: 15px; height: 15px; border: 0px; margin: 0px;" onclick="apagarPista();" />
						</div>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr id="trLabelNewPista" onclick="showNewPista(event);">
					<td colspan="6" style="text-align: right; color: #0000FF; font-weight: bold; text-decoration: underline;">
						+
					</td>
				</tr>
				<tr class="even2" id="trNewPista" style="display: none;" onclick="ignoreClick(event);">
					<form action="#" onsubmit="return false" name="formPista_edt_000" id="formPista_edt_000">
						<td width="50"><input type="text" maxlength="2" placeholder="0" nextinput="desc_loc_pista000" name="cod_pst" id="cod_pst000" size="20" style="width: 54px;" />
						</td>
						<td width="100">
							<select name="localid" onchange="carregarSentidosDoLocal('000');" onclick="carregarSentidosDoLocal('000');" id="desc_loc_pista000" style="width: 120px;">
								<c:forEach var="lz" items="${locais}">
									<option value="${lz.id}">${lz.descricao}</option>
								</c:forEach>
							</select>
						</td>
						<td width="70">
							<select name="sentido_pst" id="sentido_pst_000" style="width: 90px;">
							</select>
						</td>
						<td width="70">
							<select name="tipo" id="tipo${lcs.id}" style="width: 94px;">
									<c:forEach items="${tipospista}" var="tppt">
										<option value="${tppt.id}">${tppt.nome}</option>
									</c:forEach>
							</select>
						</td>
						<td width="160"><input maxlength="30" type="text" name="nomeMaquina" onkeypress="proximoCampo(this, event, 'ipMaquina000');" placeholder="P1CV00" id="nomeMaquina000" style="width: 177px;" size="23" />
						</td>
						<td width="134">
							<!-- onkeypress="return ( maskIP(event,this) );" --> 
							<input type="text" placeholder="00.00.00.00" name="ipMaquina" style="width: 130px; float: left;" id="ipMaquina000" size="15" maxlength="15" onkeypress="return ( maskIP(event,this) );" onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';" onfocus="this.style.backgroundColor='transparent';" /> 
							<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; float: right; height: 15px; border: 0px;" onclick="novoPista();" />
						</td>
					</form>
				</tr>
				<c:forEach items="${pistas}" var="lcs">
					<c:if test="${lcs!=null}">
						<tr id="tr_pst_${lcs.id}" onclick="onClickInitEditPista(${lcs.id});" onmouseover="closeAll(event);">
							<td width="50">${lcs.numeroPista}</td>
							<td width="100">${lcs.localizacao.descricao}</td>
							<td width="70">${lcs.sentido}</td>
							<td width="70">${lcs.tipoStr}</td>
							<td width="160">${lcs.nomeMaquina}</td>
							<td width="134">${lcs.ipMaquina}</td>
						</tr>
						<tr style="display: none;" id="edit_pst_${lcs.id}" onclick="ignoreClick(event);" onmouseover="viewIcons(${lcs.id});" onmouseout="hideIcons(${lcs.id});">
							<form action="#" onsubmit="return false" name="formPista_edt_${lcs.id}" id="formPista_edt_${lcs.id}">
								<td width="50">
									<input type="text" name="cod_pst" placeholder="0" maxlength="2" id="cod_pst" value="${lcs.numeroPista}" size="20" style="width: 54px;" />
								</td>
								<td width="100">
									<select onclick="addEventChangeLocal(${lcs.id});" name="localid" id="desc_loc_pista${lcs.id}" style="width: 120px;">
										<c:forEach var="lz" items="${locais}">
											<option value="${lz.id}"
												<c:if test="${lz.id==lcs.localizacao.id}">selected="selected"</c:if>>${lz.descricao}</option>
										</c:forEach>
									</select>
								</td>
								<td width="70">
									<select name="sentido_pst" id="sentido_pst_${lcs.id}" style="width: 90px;">
									</select>
								</td>

								<td width="70">
									<select name="tipo" id="tipo${lcs.id}" style="width: 94px;">
										<c:forEach items="${tipospista}" var="tppt">
											<option
												<c:if test="${lcs.tipo==tppt.id}">selected="selected"</c:if>
												value="${tppt.id}">${tppt.nome}</option>
										</c:forEach>
									</select>
								</td>
								<td width="160"><input type="text" name="nomeMaquina" placeholder="P1CV00" id="nomeMaquina${lcs.id}" style="width: 177px;" value="${lcs.nomeMaquina}" size="23" />
								</td>
								<td width="134">
									<input type="text" placeholder="00.00.00.00" name="ipMaquina" style="width: 140px;" id="ipMaquina${pts.id}" size="15" value="${lcs.ipMaquina}" maxlength="15" onkeypress="return ( maskIP(event,this) );" onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';" onfocus="this.style.backgroundColor='transparent';" />
								</td>
							</form>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html>