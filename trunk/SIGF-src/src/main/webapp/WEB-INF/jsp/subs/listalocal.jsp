<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="#" name="formlcz" id="formlcz">
				<fieldset>
					<legend>Localizações</legend>
					<table width="100%" class="display" id="tableLocais">
						<thead>
							<tr>
								<th width="92">Código</th>
								<th width="403">Descrição</th>
								<th width="199">Sentido
									<div id="iconsEdit_loc_tit" style="display: none; width: 60px; float: right;">
										<!-- <img alt="Cancelar" title="Cancelar"
											src="images/cancelar1.png"
											style="width: 15px; height: 15px; border: 0px;"
											onclick="onClickFimEditLocal();" /> --> 
											
											<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px; border: 0px;" onclick="onClickFimEditLocal();" /> 
											<img alt="Apagar" title="Apagar" src="images/remove.png" style="width: 15px; height: 15px; border: 0px;" onclick="apagarLocal();" />
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr id="trLabelNovaLocal" >
								<td onclick="showNewLocal(event);" style="text-align: right; color: #0000FF; text-decoration: underline; font-weight: bold;" colspan="3">
									+
								</td>
							</tr>
							<c:forEach items="${praca.localizacoes}" var="lcs">
								<c:if test="${lcs!=null}">
									<tr id="tr_loc_${lcs.id}" onclick="onClickInitEditLocal(${lcs.id});" onmouseover="closeAll(event);">
										<td width="92">${lcs.numero}</td>
										<td width="498">${lcs.descricao}</td>
										<td width="199" id="labelSentidosPraca${lcs.id}">
											${lcs.siglas}</td>
									</tr>
									<tr style="display: none;" id="edit_loc_${lcs.id}" onmouseover="viewIconsLocais(${lcs.id});" onmouseout="hideIconsLocais(${lcs.id});">
										<form id="formLocal_edt${lcs.id}" name="formLocal_edt${lcs.id}" action="#" onsubmit="return false;">
										<td width="92"><input maxlength="1" type="text" name="cod_local" placeholder="0" style="width: 96px;" id="cod_local${lcs.id}" value="${lcs.numero}" size="16" />
										</td>
										<td width="498px"><input type="text" name="desc_loc" style="width: 498px;" id="desc_loc" value="${lcs.descricao}" size="76" maxlength="30" placeholder="Localização 0" />
										</td>
										<td width="199" colspan="2">
										
											<select id="sentidos${lcs.id}" class="multiselect" name="sentidos" size="4" style="width: 160px; height: 40px; float: left;">
													<c:forEach items="${lcs.sentidos}" var="std">
														<c:if test="${std!=null}">
															<option value="${std.sigla}">${std.sentido}</option>
														</c:if>
													</c:forEach>
											</select>
											<div style="float: left;">
												<div onclick="add(${lcs.id});" class="novo-documento16 icone-horizontal" title="Adicionar novo sentido"></div>
												<div onclick="remove(${lcs.id});" class="del-documento16 icone-horizontal" title="Remover sentido selecionado"></div>
											</div>

											<div id="novoSentido${lcs.id}" style="display: none;" title="Adicionar novo sentido">
												<label>Sigla:</label> <input type="text" id="sigla${lcs.id}" name="sigla" maxlength="2" onkeyup="digita(${lcs.id});" /><br />
												<label>Sentido:</label> <input type="text" id="descc${lcs.id}" name="descc" maxlength="28" />
											</div>
										</td>
										</form>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="even2" style="display: none;" onclick="ignoreClick(event);" id="trNewLocal">
								<form id="formLocal_edt00" name="formLocal_edt00" action="#" onsubmit="return false;">
									<td width="92">
										<input maxlength="1" type="text" name="cod_local" placeholder="0" style="width: 96px;" id="cod_local00" size="16" />
									</td>	
									<td width="498px"><input type="text" name="desc_loc" style="width: 498px;" maxlength="30" onkeypress="verificadorDescricao(this);" placeholder="Localização 0" id="desc_loc00" size="76" />
									</td>
									<td width="199">
										<select id="sentidos00" class="multiselect" name="sentidos" size="4" style="width: 160px; height: 40px; float: left;">
										</select>
									
										<div style="float: left;">
											<div onclick="add('00');" class="novo-documento16 icone-horizontal" title="Adicionar novo sentido"></div>
											<div onclick="remove('00');" class="del-documento16 icone-horizontal" title="Remover sentido selecionado"></div>
										</div> 
										<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px; border: 0px;" onclick="salvarLocal()" />
										<%-- novoLocal(${praca.id}); --%>

										<div id="novoSentido00" style="display: none;" title="Adicionar novo sentido">
											<label>Sigla:</label> <input type="text" id="sigla00" name="sigla00" maxlength="2" onkeyup="digita('00');" /><br />
											<label>Sentido:</label> <input type="text" id="descc00" name="descc00" maxlength="28" />
										</div>
									</td>
								</form>
							</tr>
						</tfoot>
					</table>
				</fieldset>
</form>
</body>
</html>