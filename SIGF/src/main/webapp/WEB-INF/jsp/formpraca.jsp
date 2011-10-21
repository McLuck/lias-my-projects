<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/globaljs.js"></script>

<script type="text/javascript" src="js/jquery.dataTables.js"></script>

<link rel="stylesheet" href="css/demo_page.css">
<link rel="stylesheet" href="css/demo_table.css">
<link rel="stylesheet" href="css/support.css">

<script src="js/ui/jquery.ui.core.js"></script>
<script src="js/desktop_tratamento.js"></script>

<link rel="stylesheet" href="css/themes/base/jquery.ui.core.css">
<link rel="stylesheet" href="css/themes/base/jquery.ui.theme.css">
<link rel="stylesheet" href="css/themes/base/jquery.ui.allplugins.css">
<link rel="stylesheet" href="css/themes/base/jquery.ui.theme.css">
<link rel="stylesheet" href="css/themes/def1/icones.css">


<script src="js/jquery-ui-1.8.5.min.js"></script>

<style type="text/css">
.divhorizontal {
	width: 887px;
	clear: both;
	/* border: 1px solid #C0C0C0; */
	margin-bottom: 5px;
}

.ui-dialog .ui-dialog-buttonpane button {
	margin-top: 0px;
	height: 25px;
}
.divvertical {
	/* border: 1px solid #C0C0C0; */
	height: 244px;
	margin: 5px;
}

#listaPraca {
	width: 699px;
	float: left;
	margin-left: 0px;
	margin-rigth: 10px;
	margin-top: 0px;
}

#listaPraca {
	width: 238px;
	float: left;
}

#tudo {
	width: 238px;
	width: 890px;
}

#listaPracasTable_wrapper .dataTables_scrollBody{
	width: 225px;
	height: 205px;
}
button{
    text-transform:capitalize;
    font-size: 11px;
    color: #111111;
    border: 1px solid #333;
    background-color: #CCC;
    height: 22px;
    vertical-align: middle;
    font-weight: bold;
    margin:1px 4px 1px 4px;
    margin-right: 1px;
}
.divvertical thead th{
	display:none;
}
a{
	text-decoration: none;
}
</style>
<script type="text/javascript">
	var trtemp = null;
	function onClickInitEditPista(id){
		if(tempIDPISTA!=null){
			onClickFimEditPista();
		}
		tempIDPISTA = id;
		try{
			if(trtemp!=null){
				onClickFimEditPista(trtemp);
			}
		}catch(e){}
		trtemp = id;
		document.getElementById("edit_pst_"+id).style.display = "table-row";
		document.getElementById("iconsEditPISTA").style.display = "table-row";
		document.getElementById("tr_pst_"+id).style.display = "none";
		addEventChangeLocal(id);
	}
	function onClickFimEditPista(){
		var id = tempIDPISTA;
		if(tempIDPISTA==null){
			return;
		}
		document.getElementById("tr_pst_"+id).style.display = "table-row";
		document.getElementById("edit_pst_"+id).style.display = "none";
		document.getElementById("iconsEditPISTA").style.display = "none";
		tempIDPISTA = null;
		trtemp = null;
	}
	var temp = null;
	function viewIcons(id){
		try{
			if(temp!=null){
				$(temp).hide();
			}
		}catch(E){}
		temp = $("#iconsEdit"+id);
		$(temp).show();
	}
	function hideIcons(id){
		try{
			if(temp!=null){
				$(temp).hide();
			}
		}catch(E){}
		temp = $("#iconsEdit"+id);
		$(temp).hide();
	}
	
	function alterarPista(){
		var id = tempIDPISTA;
		if(tempIDPISTA==null){
			return;
		}else{
			id = tempIDPISTA;
		}
		if(CONFIRMA_ALTERACAO()){
			var params = $("#formPista_edt_"+id).serialize();
			params += "&cmd=alter&dominio=pista&pistaid="+id+"&cid="+getCid();
			var url = "gerenciarPracasCompleta.htm";
			//Faz alteracao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					window.location.reload(false);
				}
			});
		}
	}
	
	function apagarPista(){
		var id = tempIDPISTA;
		if(tempIDPISTA==null){
			return;
		}else{
			id = tempIDPISTA;
		}
		if(CONFIRMA_EXCLUSAO()){
			var params = "cmd=del&dominio=pista&pistaid="+id+"&cid="+getCid();
			var url = "gerenciarPracasCompleta.htm";
			//Faz exclusao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					window.location.reload(false);
				}
			});
		}
	}
	
	
	//LOCAIS
	var temp2 = null;
	function viewIconsLocais(id){
		try{
			if(temp2!=null){
				$(temp2).hide();
			}
		}catch(E){}
		temp2 = $("#iconsEdit_loc"+id);
		$(temp2).show();
	}
	function hideIconsLocais(id){
		try{
			if(temp2!=null){
				$(temp2).hide();
			}
		}catch(E){}
		temp2 = $("#iconsEdit_loc"+id);
		$(temp2).hide();
	}
	
	
	var trtemp2 = null;
	function onClickInitEditLocal(id){
		if(tempIDLOCALIZACAO!=null){
			onClickFimEditLocal();
		}
		tempIDLOCALIZACAO = id;
		try{
			if(trtemp2!=null){
				onClickFimEditLocal(trtemp2);
			}
		}catch(e){}
		trtemp2 = id;
		document.getElementById("edit_loc_"+id).style.display = "table-row";
		document.getElementById("iconsEdit_loc_tit").style.display = "table-row";
		document.getElementById("tr_loc_"+id).style.display = "none";
	}
	var tempIDLOCALIZACAO = null;
	var tempIDPISTA = null;
	function onClickFimEditLocal(){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		document.getElementById("tr_loc_"+id).style.display = "table-row";
		document.getElementById("edit_loc_"+id).style.display = "none";
		document.getElementById("iconsEdit_loc_tit").style.display = "none";
		trtemp2 = null;
		tempIDLOCALIZACAO = null;
	}
	
	
	function alterarLocal(){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		if(CONFIRMA_ALTERACAO()){
			var params = $("#formLocal_edt"+id).serialize();
			params += "&cmd=alter&dominio=local&localid="+id+"&cid="+getCid();
			
			//Prepara os sentidos cadastrados para serem enviados
			//Envia um arrays de siglas e cada sigla sera a chave de sua descricao
			$("#sentidos"+id +" option").each(function () {
		        params += "&sigla="+$(this).val();
		        params += "&"+$(this).val()+"="+$(this).text();
		    });
			
			var url = "gerenciarPracasCompleta.htm";
			//Faz alteracao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					window.location.reload(false);
				}
			});
		}
	}
	function novoLocal(pracaid){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		if(CONFIRMA_ALTERACAO()){
			var params = $("#formLocal_edt00").serialize();
			params += "&cmd=novo3&dominio=local&pracaid="+pracaid+"&cid="+getCid();

			//Prepara os sentidos cadastrados para serem enviados
			//Envia um arrays de siglas e cada sigla sera a chave de sua descricao
			$("#sentidos00 option").each(function () {
		        params += "&sigla="+$(this).val();
		        params += "&"+$(this).val()+"="+$(this).text();
		    });
			
			var url = "gerenciarPracasCompleta.htm";
			//Faz alteracao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					window.location.reload(false);
				}
			});
		}
	}
	function novoPista(){
		if(CONFIRMA_ALTERACAO()){
			var params = $("#formPista_edt_000").serialize();
			params += "&cmd=novo4&dominio=pista&cid="+getCid();
			
			var url = "gerenciarPracasCompleta.htm";
			//Faz alteracao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					window.location.reload(false);
				}
			});
		}
	}
	function getCid(){
		return $("#cid").val();
	}
	function apagarLocal(){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		if(CONFIRMA_EXCLUSAO()){
			var params = "cmd=del&dominio=local&localid="+id+"&cid="+getCid();
			var url = "gerenciarPracasCompleta.htm";
			//Faz exclusao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					window.location.reload(false);
				}
			});
		}
	}
	
	function verificaTeste(e, nCaract){
		/* nCaract = document.getElementById("teste"); */
		if(nCaract.value == "  , "){
			nCaract.value = "";
		}
		if (!e) var e = window.event
		if (e.keyCode) code = e.keyCode;
		else if (e.which) code = e.which;
		
		if(nCaract.value.length<2){
			if(code<65 || code > 90 && (code<97 && code > 122)){
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
	
	function goFormPraca(pracaid){
		var cid = $("#cid").val();
		var url = "gerenciarPracasCompleta.htm?cid="+cid+"&pracaid="+pracaid;
		location.href = url;
	}
	
	function showNewLocal(event){
		if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		}
		closeAll(event);
		document.getElementById("trNewLocal").style.display = "table-row";
		document.getElementById("trLabelNovaLocal").style.display = "none";
	}
	function hideNewLocal(){
		var codLoc = $("#cod_local00").val();
		var descLoc = $("#desc_loc00").val();
		if(codLoc!="" || descLoc!=""){
			return;
		}
		document.getElementById("trNewLocal").style.display = "none";
		document.getElementById("trLabelNovaLocal").style.display = "table-row";
	}
	
	
	function showNewPista(event){
		if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		}
		closeAll(event);
		document.getElementById("trNewPista").style.display = "table-row";
		document.getElementById("trLabelNewPista").style.display = "none";
	}
	function hideNewPista(){
		var codPista = $("#cod_pst000").val();
		var nomePista = $("#nomeMaquina000").val();
		var ipMaqui = $("#ipMaquina000").val();
		
		if(codPista!="" || nomePista!="" || ipMaqui!=""){
			return;
		}
		document.getElementById("trNewPista").style.display = "none";
		document.getElementById("trLabelNewPista").style.display = "table-row";
	}
	function closeAll(event){
		if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		}
		hideNewPista();
		hideNewLocal();
	}
	
	
	
	function criarNovaPraca(){
		var param = "cmd=novo";
		var cid = $("#cid").val();
		param += "&cid="+cid;
		location.href = "gerenciarPracasCompleta.htm?"+param;
	}
	
	function goURL(url, parameters){
		location.href = url+"?"+parameters;	
	}
	
	function pracaSubmit(){
		$("#form_dados_praca").submit();
	}
	
	var oTable;
	var giRedraw = false;
	
	$(document).ready( function () {
		try{
			oTable = $('#listaPracasTable').dataTable({
				"sScrollY": "199px",
				"sScrollX": "225px",
				"bScrollCollapse": true,
				"bPaginate": false,
				"bFilter": false,
				"bSearchable":false,
				"bInfo":false,
				"bAutoWidth": false
			});
			
			oTable.fnSort([[0,'asc']]);
			
			/* Add a click handler to the rows - this could be used as a callback */
			$("#listaPracasTable").click(function(event) {
				$(oTable.fnSettings().aoData).each(function (){
					$(this.nTr).removeClass('row_selected');
				});
				$(event.target.parentNode).addClass('row_selected');
			});
			//new AutoFill( oTable );
		}catch(e){}
		
	} );
	
	/* Get the rows which are currently selected */
	function fnGetSelected( oTableLocal ){
		var aReturn = new Array();
		var aTrs = oTableLocal.fnGetNodes();
		
		for ( var i=0 ; i<aTrs.length ; i++ )
		{
			if ( $(aTrs[i]).hasClass('row_selected') )
			{
				aReturn.push( aTrs[i] );
			}
		}
		return aReturn;
	}
</script>


		<!-- HTML5 Shim, IE8 and bellow recognize HTML5 elements -->
		<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->		
		<!-- Modernizr -->
		<script src="js/modernizr-1.5.min.js"></script>
		<!-- Webforms2 -->
		<script src="webforms2/webforms2-p.js"></script>	
		<!-- jQuery and jQuery UI -->
		<link rel="stylesheet" href="ui-themes/aristo/jquery.ui.all.css"> 
		
		<!-- jQuery Numeric Spinner -->	
		<link rel="stylesheet" href="components/spinner/ui.spinner.css"> 
		<script src="components/spinner/ui.spinner.js"></script>
		
		<!-- jQuery Placehol -->
		<script src="components/placeholder/jquery.placehold-0.2.min.js"></script>
	
		<!-- Demo page layout -->
		<!-- <link rel="stylesheet" href="css/html5forms.layout.css"> -->
		<script src="js/html5forms.js"></script>
		<script src="js/html5forms.fallback.js"></script>	
<title>Praça</title>
</head>
<body>
<input type="hidden" id="cid" name="cid" value="${cid}" />

	<div id="tudo">
<%
	int i=0;
%>
		<div class="divvertical" id="listaPraca" style="height: 217;">
			<fieldset style="height: 224px; width: 225px;">
				<legend>Praças</legend>
				<table id="listaPracasTable" class="display" style="width: 225px;">
					<thead>
						<th></th>
					</thead>
					<tbody>
						<c:forEach items="${pracas}" var="pc">
							<c:if test="${pc!=null}">
								<tr id="tr__${pc.id}" onclick="goFormPraca(${pc.id});"
									<c:if test="${pracaid!=null && pracaid == pc.id}">class="row_selected"</c:if>
								>
									<td width="225px" style="word-wrap: break-word;">${pc.description}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</fieldset>
		</div>



		<div class="divvertical" id="dadosPraca">

			<form action="gerenciarPracasCompleta.htm?dominio=praca&cmd=novo2" method="POST" id="form_dados_praca"
				name="form_dados_praca">
				<input type="hidden" value="${cid}" name="cid" id="cidd" />
				<input type="hidden" value="${praca.id}" name="id" id="id" />
				<fieldset
					style="width: 620px; padding-left: 10px; padding-right: 10px;height: 224px;">
					<legend>Dados da praça</legend>
					<div style="float: left;">
						<label>Código:</label>
						<input type="number" id="prcNum" size="4" maxlength="3" placeholder="000" name="numeroPraca" value="${praca.numeroPraca}" style="width: 50px;"/>
					</div>

					<div style="display: inline-block; float: right;">
						<label>Nome:</label>
						<form:input path="praca.nome" onkeypress="changer(this, event);" placeholder="000"
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
							id="cnpj" maxlength="15" placeholder="10.999.888/0001-11" />
					</div>


					<div style="display: inline-block; float: right;">
						<label>Distância CCA:</label>
						<form:input path="praca.distanciaCCA"
							cssStyle="margin-right: 5px;width: 194px;"
							onkeypress="changer(this, event);" size="10" id="distanciaCCA"
							maxlength="15" placeholder="000" />
					</div>


					<div style="float: left; display: inline-block;">
						<label>Tráfego estimado:</label>
						<form:input path="praca.trafegoEstimado"
							onkeypress="changer(this, event);" size="6"
							cssStyle="margin-right: 5px;width:194px;" id="trafegoEstimado"
							maxlength="6" placeholder="1500" />
					</div>
<%-- 
					<div style="display: block; clear: both;">
						<label>Descrição:</label>
						<form:textarea path="praca.descricao"
							onkeypress="changer(this, event);" id="descricao" rows="2"
							cssStyle="margin-right: 5px;width: 610px;height: 50px;" cols="90"></form:textarea>
					</div>



					<div style="display: inline-block; float: left;">
						<label>Sentido1:</label>
						<form:input path="praca.prcSent1"
							cssStyle="margin-right: 5px; width: 230px;"
							onkeypress="return verificaTeste(event, this);"
							onkeyup="changer(this, event);" placeholder="SENTIDO, Descrição" id="sentido1" maxlength="60" />
					</div>

					<div style="display: inline-block;">
						<label>Sentido2:</label>
						<form:input path="praca.prcSent2"
							cssStyle="margin-right: 5px; width: 230px;"
							onkeypress="return verificaTeste(event, this);"
							onkeyup="changer(this, event);" id="sentido2" maxlength="60" />
					</div>
 --%>
					<div style="float: right;margin-right: 4px;">
						<!-- <img alt="Cancelar Edição" title="Cancelar Edição" src="images/back.png" width="20px" height="20px" border="0px" style="padding-right: 5px;" onclick="closePraca();" /> -->
						<a href="gerenciarPracasCompleta.htm?cid=${cid}&cmd=novo">
							<input type="image" src="images/novo.png" style="width: 60px;height: 20px;padding-top: 16px;display: inline;" />
						</a>
						<input type="image" src="images/salvar_img.png" style="width: 60px;height: 20px;padding-top: 16px;display: inline;" onclick="pracaSubmit();" />
					</div>

				</fieldset>
			</form>
			<p align="center" style="color: red;" id="msg_status">&nbsp;</p>

		</div>
		
		
		
		
		<c:if test="${isnovo==null}">
				<%
					i = 0;
				%>
				<div class="divhorizontal" id="listaLocais">
					<fieldset>
						<legend>Localizações</legend>
						<table width="100%" class="display">
							<thead>
								<tr>
									<th width="92">Código</th>
									<th width="403">Descrição</th>
									<th width="199">Sentido</th>
									<th width="60px">
										<div id="iconsEdit_loc_tit" style="display: none; width: 60px;">
											<img alt="Cancelar" title="Cancelar" src="images/back.png" style="width: 15px; height: 15px; border: 0px;" onclick="onClickFimEditLocal();" />
											<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px;border: 0px;" onclick="alterarLocal();" />
											<img alt="Apagar" title="Apagar" src="images/remove.png" style="width: 15px; height: 15px;border: 0px;" onclick="apagarLocal();" />
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
		
								<c:forEach items="${praca.localizacoes}" var="lcs">
									<c:if test="${lcs!=null}">
										<tr id="tr_loc_${lcs.id}" onclick="onClickInitEditLocal(${lcs.id});" onmouseover="closeAll(event);"
											<%
												i++;
												out.print((i % 2 ==0)?"class='even'":"class='odd'");
											%>>
											<td width="92">${lcs.numero}</td>
											<td width="403">${lcs.descricao}</td>
											<td width="199" colspan="2" id="labelSentidosPraca${lcs.id}">
														<c:forEach items="${lcs.sentidos}" var="std">
															<c:if test="${std!=null}">
																${std.sigla} &nbsp;
															</c:if>
														</c:forEach>
											</td>
										</tr>
										<tr style="display: none;" id="edit_loc_${lcs.id}"  onmouseover="viewIconsLocais(${lcs.id});" onmouseout="hideIconsLocais(${lcs.id});"
											<%
												out.print((i % 2 ==0)?"class='even2'":"class='odd2'");
											%>>
											<form id="formLocal_edt${lcs.id}" name="formLocal_edt${lcs.id}" action="#" onsubmit="return false;">
												<td width="92">
													<input type="number" name="cod_local" placeholder="X" style="width: 85px;" id="cod_local${lcs.id}" value="${lcs.numero}" size="16" />
												</td>
													<td width="403">
														<input type="text" name="desc_loc" style="width: 400px;" id="desc_loc" value="${lcs.descricao}" size="76" maxlength="30" placeholder="Localização 0" />
													</td>
													<td width="199" colspan="2">
													
													<select id="sentidos${lcs.id}" class="multiselect" name="sentidos" size="4" style="width: 160px; height: 40px;float:left;">
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
														<label>Sigla:</label>
														<input type="text" id="sigla${lcs.id}" name="sigla" maxlength="2" onkeyup="digita(${lcs.id});" /><br />
														<label>Sentido:</label>
														<input type="text" id="descc${lcs.id}" name="descc" maxlength="28" />
													</div>
													
													<%-- <select name="sentido_loc" id="sentido_loc" style="width: 125px;">
															<option <c:if test="${lcs.sentido==siglaS1}">selected="selected"</c:if>>${siglaS1}</option>
															<option <c:if test="${lcs.sentido==siglaS2}">selected="selected"</c:if>>${siglaS2}</option>
															<option <c:if test="${lcs.sentido==siglaS3}">selected="selected"</c:if>>${siglaS3}</option>
													</select> --%>
													</td>
											</form>
										</tr>
									</c:if>
								</c:forEach>
								<tr id="trLabelNovaLocal">
									<td onmouseover="showNewLocal(event);" style="text-align: center; color: #0000FF; text-decoration: underline; font-weight: bold;" colspan="4">
										Nova Localização
									</td>
								</tr>
								<tr class="even2" style="display: none;" id="trNewLocal"  onmouseout="hideNewLocal();" >
									<form id="formLocal_edt00" name="formLocal_edt00" action="#" onsubmit="return false;">
										<td width="92">
											<input type="number" name="cod_local" placeholder="X" style="width: 85px;" id="cod_local00" size="16" />
										</td>	
										<td width="403">
											<input type="text" name="desc_loc" style="width: 400px;" maxlength="30" placeholder="Localização 0" id="desc_loc00" size="76" />
										</td>
										<td width="199">
														
													<select id="sentidos00" class="multiselect" name="sentidos" size="4" style="width: 160px; height: 40px;float:left;">
													</select>
													<div style="float: left;">
														<div onclick="add('00');" class="novo-documento16 icone-horizontal" title="Adicionar novo sentido"></div>
														<div onclick="remove('00');" class="del-documento16 icone-horizontal" title="Remover sentido selecionado"></div>
													</div>
												
													<div id="novoSentido00" style="display: none;" title="Adicionar novo sentido">
														<label>Sigla:</label>
														<input type="text" id="sigla00" name="sigla00" maxlength="2" onkeyup="digita('00');" /><br />
														<label>Sentido:</label>
														<input type="text" id="descc00" name="descc00" maxlength="28" />
													</div>
														
														<%-- <select name="sentido_loc" id="sentido_loc" style="width: 125px;">
																<option>${siglaS1}</option>
																<option>${siglaS2}</option>
																<option>${siglaS3}</option>
														</select> --%>
										</td>
										<td>
														<div id="iconsEdit_loc00">
															<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px;border: 0px;" onclick="novoLocal(${praca.id});" />
														</div>
										</td>
									</form>
								</tr>
							</tbody>
						</table>
		
					</fieldset>
				</div>
		
		
		
		
		
		
		
		
		
		
				<c:if test="${local==null}">
						<div class="divhorizontal" id="listaPistas">
						<fieldset>
							<legend>Pistas</legend>
							<table width="105%" class="display">
								<thead>
									<tr>
										<th width="50">Código</th>
										<th width="100">Localização</th>
										<th width="70">Sentido</th>
										<th width="70">Tipo</th>
										<th width="160">Nome Máquina</th>
										<th width="134">IP Máquina</th>
										<th width="60px;">
										
											<div id="iconsEditPISTA" style="display: none; width: 60px;">
												<img alt="Cancelar" title="Cancelar" src="images/back.png" style="width: 15px; height: 15px; border: 0px;margin: 0px;" onclick="onClickFimEditPista();" />
												<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px;border: 0px;margin: 0px;" onclick="alterarPista();" />
												<img alt="Apagar" title="Apagar" src="images/remove.png" style="width: 15px; height: 15px;border: 0px;margin: 0px;" onclick="apagarPista();" />
											</div>
											
										</th>
									</tr>
								</thead>
								<tbody>
			
									<c:forEach items="${pistas}" var="lcs">
										<c:if test="${lcs!=null}">
											<tr id="tr_pst_${lcs.id}" onclick="onClickInitEditPista(${lcs.id});" onmouseover="closeAll(event);"
												<%
													i++;
													out.print((i % 2 ==0)?"class='even'":"class='odd'");
												%>>
												<td width="50">${lcs.numeroPista}</td>
												<td width="100">${lcs.localizacao.descricao}</td>
												<td width="70">${lcs.sentido}</td>
												<td width="70">${lcs.tipoStr}</td>
												<td width="160">${lcs.nomeMaquina}</td>
												<td width="134" colspan="2">${lcs.ipMaquina}</td>
											</tr>
											
											
											<tr style="display: none;" id="edit_pst_${lcs.id}" onmouseover="viewIcons(${lcs.id});" onmouseout="hideIcons(${lcs.id});"
												<%
													out.print((i % 2 ==0)?"class='even2'":"class='odd2'");
												%>>
												<form sction="#" onsubmit="return false" name="formPista_edt_${lcs.id}" id="formPista_edt_${lcs.id}">
													<td width="50">
													<input type="number" name="cod_pst" placeholder="X"
														id="cod_pst" value="${lcs.numeroPista}" size="20" style="width: 50px;" />
													</td>
													
													
													<td width="100">
														<select onclick="addEventChangeLocal(${lcs.id});" name="localid" id="desc_loc_pista${lcs.id}" style="width: 100px;">
															<c:forEach var="lz" items="${locais}">
																<option value="${lz.id}" <c:if test="${lz.id==lcs.localizacao.id}">selected="selected"</c:if>>${lz.descricao}</option>
															</c:forEach>
														</select>
													</td>
													<td width="70">
														<select name="sentido_pst" id="sentido_pst_${lcs.id}" style="width: 70px;">
														</select>
													</td>
													
													<td width="70">
														<select name="tipo" id="tipo${lcs.id}" style="width: 94px;" onkeyup="runScript(${pts.id}, event);">
																<c:forEach items="${tipospista}" var="tppt">
																	<option <c:if test="${lcs.tipo==tppt.id}">selected="selected"</c:if> value="${tppt.id}">${tppt.nome}</option>
																</c:forEach>
														</select>
													</td>
													<td width="160">
													<input type="text" name="nomeMaquina" placeholder="P1CV00" id="nomeMaquina" style="width: 126px;"  value="${lcs.nomeMaquina}" size="23"/></td>
													<td width="134" colspan="2">
														<input type="text" placeholder="10.0.17.18"
															onkeyup="runScript(${pts.id}, event);" name="ipMaquina"
															style="width: 126px;;" id="ipMaquina${pts.id}" size="15"
															value="${lcs.ipMaquina}" maxlength="15"
															onkeypress="return ( maskIP(event,this) );"
															onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';"
															onfocus="this.style.backgroundColor='transparent';" />
													</td>
												</form>
											</tr>
										</c:if>
									</c:forEach>
									<tr id="trLabelNewPista" onmouseover="showNewPista(event);">
										<td colspan="7" style="text-align: center; color: #0000FF; font-weight: bold; text-decoration: underline;">
											Nova Pista
										</td>
									</tr>
									<tr class="even2" id="trNewPista" onmouseout="hideNewPista();" style="display: none;" >
										<form sction="#" onsubmit="return false" name="formPista_edt_000" id="formPista_edt_000">
													<td width="50">
														<input type="number" placeholder="X" nextinput="desc_loc_pista000" name="cod_pst" id="cod_pst000" size="20" style="width: 50px;" />
													</td>
													<td width="100">
														<select name="localid" onchange="carregarSentidosDoLocal('000');" onclick="carregarSentidosDoLocal('000');" id="desc_loc_pista000" style="width: 100px;"  >
															<c:forEach var="lz" items="${locais}">
																<option value="${lz.id}">${lz.descricao}</option>
															</c:forEach>
														</select>
													</td>
													<td width="70">
														<select name="sentido_pst" id="sentido_pst_000" style="width: 70px;">
														</select>
													</td>
													<td width="70">
														<select name="tipo" id="tipo${lcs.id}" style="width: 94px;" onkeyup="runScript(${pts.id}, event);">
																<c:forEach items="${tipospista}" var="tppt">
																	<option value="${tppt.id}">${tppt.nome}</option>
																</c:forEach>
														</select>
													</td>
													<td width="160">
														<input type="text" name="nomeMaquina" onkeypress="proximoCampo(this, event, 'ipMaquina000');" placeholder="P1CV00" id="nomeMaquina000" style="width: 126px;"  size="23"/>
													</td>
													<td width="134">
													<!-- onkeypress="return ( maskIP(event,this) );" -->
														<input type="text" placeholder="10.0.17.18"
															onkeyup="runScript(${pts.id}, event);" name="ipMaquina"
															style="width: 126px;;" id="ipMaquina000" size="15"
															maxlength="15" onkeypress="return ( maskIP(event,this) );"
															onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';"
															onfocus="this.style.backgroundColor='transparent';" />
													</td>
													<td>
														<div id="iconsEdit000">
															<img alt="Salvar" title="Salvar" src="images/check2.png" style="width: 15px; height: 15px;border: 0px;" onclick="novoPista();" />
														</div>
													</td>
												</form>	
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>
				</c:if>
		
			</div>
	</c:if>
</body>
</html>