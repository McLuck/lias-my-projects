<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	long now = new java.util.Date().getTime();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery.js?n=<%=now%>"></script>
<script type="text/javascript" src="js/globaljs.js?n=<%=now%>"></script>

<script type="text/javascript" src="js/jquery.dataTables.js?n=<%=now%>"></script>
<script type="text/javascript" src="js/jquery.toastmessage.js?n=<%=now%>"></script>

<link rel="stylesheet" href="css/demo_page.css?n=<%=now%>">
<link rel="stylesheet" href="css/demo_table.css?n=<%=now%>">
<link rel="stylesheet" href="css/support.css?n=<%=now%>">

<script src="js/ui/jquery.ui.core.js?n=<%=now%>"></script>
<script src="js/desktop_tratamento.js?n=<%=now%>"></script>

<link rel="stylesheet"
	href="css/themes/base/jquery.ui.core.css?n=<%=now%>">
<link rel="stylesheet"
	href="css/themes/base/jquery.ui.theme.css?n=<%=now%>">
<link rel="stylesheet"
	href="css/themes/base/jquery.ui.allplugins.css?n=<%=now%>">
<link rel="stylesheet"
	href="css/themes/base/jquery.ui.theme.css?n=<%=now%>">
<link rel="stylesheet" href="css/themes/def1/icones.css?n=<%=now%>">

<link rel="stylesheet" href="css/jquery.toastmessage.css?n=<%=now%>">


<script src="js/jquery-ui-1.8.5.min.js?n=<%=now%>"></script>
<script src="js/jquery.meio.mask.js?n=<%=now%>"></script>
<script src="js/main.js?n=<%=now%>"></script>

<style type="text/css">
.divhorizontal {
	width: 887px;
	clear: both;
	/* border: 1px solid #C0C0C0; */
	margin-bottom: 5px;
}

.divvertical { /* border: 1px solid #C0C0C0; */
	height: 170px;
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
	width: 227px;
	float: left;
	height: 156px;
}

#tudo {
	width: 238px;
	width: 890px;
}

button {
	text-transform: capitalize;
	font-size: 11px;
	color: #111111;
	border: 1px solid #333;
	background-color: #CCC;
	height: 22px;
	vertical-align: middle;
	font-weight: bold;
	margin: 1px 4px 1px 4px;
	margin-right: 1px;
}

.divvertical thead th {
	display: none;
}

a {
	text-decoration: none;
}

table.listaPracasTable {
	border: 0px;
}

#listaPracasTable {
	border: 0px;
}
</style>
<script type="text/javascript">
	var trtemp = null;
	
	var NOVO_REGISTRO = false;
	var idLocal=1;
	var idpista=1;
	
	function toast(){
		/* $.notify({
			title: 'The title',
			message: 'simple example message!'
			}); */
			
		$().toastmessage('showSuccessToast', "Teste Toast!");
	}
	
	function limparTodosDados(){
		
	}
	
	function limparFormPraca(){
		$("#form_dados_praca").each(function(){
		        $(this).val("");
		});
		limparPistas();
		limparLocais();
	}
	
	function verificadorDescricao(ele){
		var val = $(ele).val();
		if(val.length==30){
			$().toastmessage('showWarningToast', "A descrição deve possuir entre 3 e 30 caracteres.");
			return false;
		}
		return true;
	}
	
	function tableToJson(table) {
		var data = []; // first row needs to be headers var headers = [];
		for (var i=0; i<table.rows[0].cells.length; i++) {
			headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
		}
		// go through cells
		for (var i=1; i<table.rows.length; i++) {
			var tableRow = table.rows[i]; var rowData = {};
			for (var j=0; j<tableRow.cells.length; j++) {
				rowData[ headers[j] ] = tableRow.cells[j].innerHTML;
			} 
			data.push(rowData);
		}
		return data; 
	}
	
	function testJsonFromTable(){
		
	}
	
	function addLinhaLocalizacao(cod, desc, sentidos){
		try{
			if(cod.replace(/ /g,'')=='' || desc.replace(/ /g,'')==''){
				$().toastmessage('showWarningToast', "Os dados informados são inválidados. A Localização não foi adicionada!");
				return;
			}else if(isNaN(parseInt(cod))){
				$().toastmessage('showWarningToast', "O código deve ser numérico. A Localização não foi adicionada!");
				return;
			}else if(desc.length<3){
				$().toastmessage('showWarningToast', "A descrição deve possuir entre 3 e 30 caracteres.");
				return;
			}
			if($("#sentidos00").html()==""){
				$().toastmessage('showWarningToast', "Os dados informados são inválidados. A Localização não foi adicionada!");
				return;
			}
			
			if(sentidos.length==0){
				$().toastmessage('showWarningToast', "Nenhum sentido foi informado. A Localização não foi adicionada!");
				return;
			}
			//Pegar sentidos
			//var sentidos = $("#sentidos00").val();
			var novo = "<tr id='tr_loc_#ID#' onclick='onClickInitEditLocal(#ID#);' onmouseover='closeAll(event);' class='#classe#'><td width='92' id='td_loc_lb_numero#ID#'>#numero#</td><td width='498' id='td_loc_lb_desc#ID#'>#descricao#</td><td width='199' id='labelSentidosPraca#ID#'>#siglas#</td></tr><tr style='display: none;' id='edit_loc_#ID#'onmouseover='viewIconsLocais(#ID#);'onmouseout='hideIconsLocais(#ID#);' class='#classe#2'><form id='formLocal_edt#ID#'name='formLocal_edt#ID#' action='#'onsubmit='return false;'><td width='92'><input maxlength='1' type='text'name='cod_local' placeholder='0' style='width: 96px;'id='cod_local#ID#' value='#numero#' size='16' /></td><td width='498px'><input type='text' name='desc_loc'style='width: 498px;' id='desc_loc#ID#' value='#descricao#'size='76' maxlength='30' placeholder='Localização 0' /></td><td width='199' colspan='2'><select id='sentidos#ID#' class='multiselect' name='sentidos'size='4' style='width: 160px; height: 40px; float: left;'></select><div style='float: left;'><div onclick='add(#ID#);'class='novo-documento16 icone-horizontal'title='Adicionar novo sentido'></div><div onclick='remove(#ID#);'class='del-documento16 icone-horizontal'title='Remover sentido selecionado'></div></div><div id='novoSentido#ID#' style='display: none;'title='Adicionar novo sentido'><label>Sigla:</label> <input type='text' id='sigla#ID#'name='sigla' maxlength='2' onkeyup='digita(#ID#);' /><br /><label>Sentido:</label> <input type='text'id='descc#ID#' name='descc' maxlength='28' /></div></td></form></tr>";
			var classe = (idLocal % 2 == 0)?"even":"odd";
			novo = novo.replace(/#ID#/gi, idLocal);
			novo = novo.replace(/#numero#/gi, cod);
			novo = novo.replace(/#descricao#/gi, desc);		
			novo = novo.replace(/#classe#/gi, classe);		
			$("#listaLocais tbody").append(novo);
			
			//sentidos
			var str = "";
			var first = false;
			for(var i = 0;i < sentidos.length;i++){
				var taux = "<option value='"+$(this).val()+"'>"+$(this).text()+"</option>";
			}
			$("#sentidos00 option").each(function(){
				var taux = "<option value='"+$(this).val()+"'>"+$(this).text()+"</option>";
				$("#sentidos"+idLocal).append(taux);
				if(first==false){
					first = true;
				}else{
					str+= ", "
				}
		        str += $(this).val();
			});
			$("#labelSentidosPraca"+idLocal).html(str);
			
			//Limpar o form de novos registros
			$("#formLocal_edt00").each(function(){
				this.reset();
			});
			
			$("#sentidos00").html("");
			
			idLocal++;
			$().toastmessage('showSuccessToast', "Localização foi adicionada com sucesso!");	
			hideNewLocal();
		}catch(e){
			$().toastmessage('showErrorToast', "Houve um erro na operação. A Localização não foi adicionada!");	
		}
	}
	
	function salvarLocal(){
		try{
			var cod = $("#cod_local00").val();
			var desc = $("#desc_loc00").val();
			if(cod.replace(/ /g,'')=='' || desc.replace(/ /g,'')==''){
				$().toastmessage('showWarningToast', "Os dados informados são inválidados. A Localização não foi adicionada!");
				return;
			}else if(isNaN(parseInt(cod))){
				$().toastmessage('showWarningToast', "O código deve ser numérico. A Localização não foi adicionada!");
				return;
			}else if(desc.length<3){
				$().toastmessage('showWarningToast', "A descrição deve possuir entre 3 e 30 caracteres.");
				return;
			}
			if($("#sentidos00").html()==""){
				$().toastmessage('showWarningToast', "Os dados informados são inválidados. A Localização não foi adicionada!");
				return;
			}
			if($("#sentidos00 option").length==0){
				$().toastmessage('showWarningToast', "Nenhum sentido foi informado. A Localização não foi adicionada!");
				return;
			}
			//Pegar sentidos
			//var sentidos = $("#sentidos00").val();
			var novo = "<tr id='tr_loc_#ID#' onclick='onClickInitEditLocal(#ID#);' onmouseover='closeAll(event);' class='#classe#'><td width='92' id='td_loc_lb_numero#ID#'>#numero#</td><td width='498' id='td_loc_lb_desc#ID#'>#descricao#</td><td width='199' id='labelSentidosPraca#ID#'>#siglas#</td></tr><tr style='display: none;' id='edit_loc_#ID#'onmouseover='viewIconsLocais(#ID#);'onmouseout='hideIconsLocais(#ID#);' class='#classe#2'><form id='formLocal_edt#ID#'name='formLocal_edt#ID#' action='#'onsubmit='return false;'><td width='92'><input maxlength='1' type='text'name='cod_local' placeholder='0' style='width: 96px;'id='cod_local#ID#' value='#numero#' size='16' /></td><td width='498px'><input type='text' name='desc_loc'style='width: 498px;' id='desc_loc#ID#' value='#descricao#'size='76' maxlength='30' placeholder='Localização 0' /></td><td width='199' colspan='2'><select id='sentidos#ID#' class='multiselect' name='sentidos'size='4' style='width: 160px; height: 40px; float: left;'></select><div style='float: left;'><div onclick='add(#ID#);'class='novo-documento16 icone-horizontal'title='Adicionar novo sentido'></div><div onclick='remove(#ID#);'class='del-documento16 icone-horizontal'title='Remover sentido selecionado'></div></div><div id='novoSentido#ID#' style='display: none;'title='Adicionar novo sentido'><label>Sigla:</label> <input type='text' id='sigla#ID#'name='sigla' maxlength='2' onkeyup='digita(#ID#);' /><br /><label>Sentido:</label> <input type='text'id='descc#ID#' name='descc' maxlength='28' /></div></td></form></tr>";
			var classe = (idLocal % 2 == 0)?"even":"odd";
			novo = novo.replace(/#ID#/gi, idLocal);
			novo = novo.replace(/#numero#/gi, cod);
			novo = novo.replace(/#descricao#/gi, desc);		
			novo = novo.replace(/#classe#/gi, classe);		
			$("#listaLocais tbody").append(novo);
			
			//sentidos
			var str = "";
			var first = false;
			$("#sentidos00 option").each(function(){
				var taux = "<option value='"+$(this).val()+"'>"+$(this).text()+"</option>";
				$("#sentidos"+idLocal).append(taux);
				if(first==false){
					first = true;
				}else{
					str+= ", "
				}
		        str += $(this).val();
			});
			$("#labelSentidosPraca"+idLocal).html(str);
			
			//Limpar o form de novos registros
			$("#formLocal_edt00").each(function(){
				this.reset();
			});
			
			$("#sentidos00").html("");
			
			idLocal++;
			$().toastmessage('showSuccessToast', "Localização foi adicionada com sucesso!");	
			hideNewLocal();
		}catch(e){
			$().toastmessage('showErrorToast', "Houve um erro na operação. A Localização não foi adicionada!");	
		}
	}
	
	function removeLocal(id){
		$("#listaLocais tbody tr").each(function(){
			if($(this).attr("id")=="tr_loc_"+id || $(this).attr("id")=="edit_loc_"+id){
				$(this).remove();
			}
		});		
		hideNewPista();
	}
	
	function limparPistas(){
		$("#tablePistas tbody tr").each(function(){
			if($(this).attr("id")!="trNewPista" && $(this).attr("id")!="trLabelNewPista"){
				$(this).remove();	
			}
		});
	}
	
	function verificarTable1(){
		alert($("#tableLocais tbody tr").length);
	}
	
	function verificarTable2(){
		alert($("#tableLocais tbody").html())
	}

	function limparLocais(){
		//tableLocais
		$("#tableLocais tbody tr").each(function(){
			if($(this).attr("id")!="trNewLocal" && $(this).attr("id")!="trLabelNovaLocal"){
				$(this).remove();	
			}
		});
	}

	
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
			params += "&cmd=alter&dominio=pista&pistaid="+id+"&cid="+getCid()+"&pracaid="+$("#prcId").val();
			var url = "gerenciarPracasCompleta.htm";
			//Faz alteracao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					//window.location.reload(false);
					openListPistas($("#prcId").val());
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
			var params = "cmd=del&dominio=pista&pistaid="+id+"&cid="+getCid()+"&pracaid="+$("#prcId").val();
			var url = "gerenciarPracasCompleta.htm";
			//Faz exclusao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					//window.location.reload(false);
					openListPistas($("#prcId").val());
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
		$("#edit_loc_"+id).show();
		//document.getElementById("edit_loc_"+id).style.display = "table-row";
		$("#iconsEdit_loc_tit").show();
		//document.getElementById("iconsEdit_loc_tit").style.display = "table-row";
		$("#tr_loc_"+id).hide();
		//document.getElementById("tr_loc_"+id).style.display = "none";
		
	}
	var tempIDLOCALIZACAO = null;
	var tempIDPISTA = null;
	function onClickFimEditLocal(){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		alterLabelLocalizacoes(id);
		$("#tr_loc_"+id).show();
		//document.getElementById("tr_loc_"+id).style.display = "table-row";
		$("#edit_loc_"+id).hide();
		//document.getElementById("edit_loc_"+id).style.display = "none";
		$("#iconsEdit_loc_tit").hide();
		//document.getElementById("iconsEdit_loc_tit").style.display = "none";
		trtemp2 = null;
		tempIDLOCALIZACAO = null;
	}
	
	function alterLabelLocalizacoes(id){
		var cod = $("#cod_local"+id).val();
		var desc = $("#desc_loc"+id).val();
		$("#td_loc_lb_numero"+id).html(cod);
		$("#td_loc_lb_desc"+id).html(desc);
	}
	
	
	function alterarLocal(){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		if(CONFIRMA_ALTERACAO()){
			var params = $("#formLocal_edt"+id).serialize();
			params += "&cmd=alter&dominio=local&localid="+id+"&cid="+getCid()+"&pracaid="+$("#prcId").val();
			
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
					//window.location.reload(false);
					openListLocais($("#prcId").val());
				}
			});
		}
	}
	function novoLocal(pracaid){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
			var params = $("#formLocal_edt00").serialize();
			params += "&cmd=novo3&dominio=local&pracaid="+pracaid+"&cid="+getCid()+"&pracaid="+$("#prcId").val();

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
					//window.location.reload(false);
					openListLocais($("#prcId").val());
				}
			});
	}
	function novoPista(){
			var params = $("#formPista_edt_000").serialize();
			params += "&cmd=novo4&dominio=pista&cid="+getCid()+"&pracaid="+$("#prcId").val();
			
			var url = "gerenciarPracasCompleta.htm";
			//Faz alteracao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					//window.location.reload(false);
					openListPistas($("#prcId").val());
				}
			});
	}
	function getCid(){
		return $("#cid").val();
	}
	function apagarLocal(){
		var id = 0;
		if(tempIDLOCALIZACAO!=null){
			id = tempIDLOCALIZACAO;
		}
		if(CONFIRMA_EXCLUSAO_E_DEPENDENCIAS()){
			removeLocal(id);	
			$().toastmessage('showNoticeToast', "A localização e suas dependencias foram removidas.");
			//Remocao do AJAX - Agora tudo e feito no JS e so depois enviado ao servidor
			var params = "cmd=del&dominio=local&localid="+id+"&cid="+getCid()+"&pracaid="+$("#prcId").val();
			var url = "gerenciarPracasCompleta.htm";
			//Faz exclusao do registro
			$.ajax({
				url : url,
				data : params,
				type : "post",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					//window.location.reload(false);
					openListLocais($("#prcId").val());
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
		try{
			event.stopPropagation();
		}catch(e){}
		try{
			event.stopImmediatePropagation();	
		}catch(e){
			
		}
		if(visivelNewLocal){
			hideNewLocal();
			return;
		}
		/* if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		} */
		hideNewPista();
		closeAll(event);
		document.getElementById("trNewLocal").style.display = "table-row";
		visivelNewLocal =true;
	}
	var visivelNewLocal =false;
	var visivelNewPista =false;
	function hideNewLocal(){
		var codLoc = $("#cod_local00").val();
		var descLoc = $("#desc_loc00").val();
		 if(codLoc!="" || descLoc!=""){
			return;
		} 
		document.getElementById("trNewLocal").style.display = "none";
		visivelNewLocal = false;
	}
	
	function showNewPista(event){
		try{
			event.stopPropagation();
		}catch(e){}
		try{
			event.stopImmediatePropagation();	
		}catch(e){}
		if(visivelNewPista){
			hideNewPista();
			return;
		}
		/* if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		} */
		if($("#tableLocais tbody tr").length==0){
			$().toastmessage('showErrorToast', "Não é possível criar pistas sem ter alguma localização cadastrada na praça!");
			return;
		}
		hideNewLocal();
		closeAll(event);
		document.getElementById("trNewPista").style.display = "table-row";
		visivelNewPista = true;
	}
	function hideNewPista(){
		if(!visivelNewPista){
			return;
		}
		var codPista = $("#cod_pst000").val();
		var nomePista = $("#nomeMaquina000").val();
		var ipMaqui = $("#ipMaquina000").val();
		
		if(codPista!="" || nomePista!="" || ipMaqui!=""){
			return;
		} 
		document.getElementById("trNewPista").style.display = "none";
		visivelNewPista=false;
	}
	function closeAll(event){
		/* if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		} */
		/* hideNewPista();
		hideNewLocal(); */
	}
	
	function closeAllNews(event){
		hideNewPista();
		hideNewLocal();
	}
	
	function ignoreClick(event){
		try{
			event.stopPropagation();
		}catch(e){}
		try{
			event.stopImmediatePropagation();
		}catch(e){}
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
			$('#cnpj').setMask();
		}catch(Ex){}
		try{
			oTable = $('#listaPracasTable').dataTable({
				"sScrollY": "145px",
				"sScrollX": "225px",
				"bScrollCollapse": false,
				"bPaginate": false,
				"bFilter": false,
				"bSearchable":false,
				"bInfo":false,
				"bAutoWidth": true
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
		
		document.getElementById("listaPracasTable").style.width = "207px";
		document.getElementById("listaPracasTable").style.border = "0px";
		
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
	
	function sairCNPJ(){
		var cnpj = $("#cnpj").val();
		cnpj = cnpj.replace(/\./g,'');
		cnpj = cnpj.replace(/\-/g,'');
		cnpj = cnpj.replace(/\//g,"");
		
		if(!valida_cnpj(cnpj)){
			document.getElementById("cnpj").style.backgroundColor = "#FF0000";
		}else{
			document.getElementById("cnpj").style.backgroundColor = "white";
		}
	}
</script>


<!-- HTML5 Shim, IE8 and bellow recognize HTML5 elements -->
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!-- Modernizr -->
<script src="js/modernizr-1.5.min.js?n=<%=now%>"></script>
<!-- Webforms2 -->
<script src="webforms2/webforms2-p.js?n=<%=now%>"></script>
<!-- jQuery and jQuery UI -->
<link rel="stylesheet"
	href="ui-themes/aristo/jquery.ui.all.css?n=<%=now%>">

<!-- jQuery Numeric Spinner -->
<link rel="stylesheet"
	href="components/spinner/ui.spinner.css?n=<%=now%>">
<script src="components/spinner/ui.spinner.js?n=<%=now%>"></script>

<!-- jQuery Placehol -->
<script
	src="components/placeholder/jquery.placehold-0.2.min.js?n=<%=now%>"></script>

<!-- Demo page layout -->
<!-- <link rel="stylesheet" href="css/html5forms.layout.css"> -->
<script src="js/html5forms.js?n=<%=now%>"></script>
<script src="js/html5forms.fallback.js?n=<%=now%>"></script>
<title>Praça</title>

<script type="text/javascript">
	function addPracaList(codigo, praca){
		var row = "<tr id='tr__"+codigo+"' onclick='openFormPraca("+codigo+");'><td style='word-wrap: break-word;'>";
		row += praca;
		row += "</td></tr>";
		$("#listaPracasTable tbody").append(row);
	}
	
	function openFormPraca(codigo){
		try{
			salvarDadosPraca();
		}catch(e){}
		$("#listaPracasTable tbody tr").each(function(index, Element){
			$(this).removeClass("row_selected");
		});
		var idtr = "#tr__"+codigo;
		$(idtr).addClass("row_selected");
		
		$("#dadospracaContent").html("<p>Carregando...</p>");
		$.ajax({
			url : 'gerenciarPracasCompleta.htm?cmd=dadospraca&pracaid='+codigo,
			success : function(data) {
				$('#dadospracaContent').html(data);
				openListLocais(codigo);
				zebraFunctionInterceptor();
			}
		});
	}
	
	function openListLocais(codigo){
		$.ajax({
			url : 'gerenciarPracasCompleta.htm?cmd=listalocal&pracaid='+codigo,
			success : function(listalocais) {
				$('#listaLocais').html(listalocais);
				openListPistas(codigo);
				zebraFunctionInterceptor();
			}
		});
	}
	
	function openListPistas(codigo){
		$.ajax({
			url : 'gerenciarPracasCompleta.htm?cmd=listapista&pracaid='+codigo,
			success : function(listapistas) {
				$('#listaPistas').html(listapistas);
				zebraFunctionInterceptor();
			}
		});
	}
	
	function zebraFunctionInterceptor(){
		$("tr:odd").removeClass("odd2");
		$("tr:odd").removeClass("even2");
		$("tr:even").removeClass("even2");
		$("tr:even").removeClass("odd2");

		$("tr:odd").addClass("odd2");
		//$("tr:even").addClass("even2");
	}
	
	 $(document).ready(function() {
		 <c:forEach items="${pracas}" var="pc">
		 		addPracaList(${pc.id}, '${pc.nome}');
		 </c:forEach>
		
		 <c:if test="${pracaid!=null&&pracaid>0}">
		 		openFormPraca(${pracaid});
		 </c:if>
		 zebraFunctionInterceptor();
	 });
	 
	 function getFormPracaData(){
		 return $("#formprc").serialize();
	 }
	 
	 function salvarDadosPraca(){
		 try{
			 if(!validarDadosPraca()){
				 return;
			 }	 
		 }catch(e){
			 return;
		 }
		 
		 var params = "cmd=alter&dominio=praca&cid="+getCid()+"&pracaid="+$("#prcId").val()+"&"+getFormPracaData();
		 $.ajax({
				url : 'gerenciarPracasCompleta.htm',
				data: params,
				contentType: "application/x-www-form-urlencoded;charset=ISO-8859-1",
				success : function(data) {
					$().toastmessage('showSuccessToast', "Dados da praça foram salvos com sucesso!");
				}
		});
	 }
	 
	 function validarDadosPraca(){
		 var msg = "";
		 if($("#prcNum").val().length==0 || $("#prcNum").val().length>3 || !(!isNaN(parseFloat($("#prcId").val())) && isFinite($("#prcId").val()))){
			 msg += "\n Número da praça não é inválido. Número deve ser maior que zero e menor que 999.";
		 }
		 
		 if($("#nomepraca").val().length==0 || $("#nomepraca").val().length<3){
			 msg += "\n Nome da praça é mandatório. Este nome irá sair em relatórios e outras partes importantes do sistema.";
		 }
		 
		 if($("#nomepraca").val().length==0 || $("#nomepraca").val().length<3){
			 msg += "\n Nome da praça é mandatório. Este nome irá sair em relatórios e outras partes importantes do sistema.";
		 }
		 
		 if(msg!=""){
			 msg = "Alguns erros impedem que a praça seja salva. Por favor faça as correções antes de prosseguir:"+msg;
			 $().toastmessage('showErrorToast', msg);
			 return false;
		 }
		 return true;
	 }
	 
	 $(window).unload(function() {
		 salvarDadosPraca();
	 });
	 
	 var menuVisivel = false;
	 function clickMenuPraca(){
		 if(!menuVisivel){
			 $("#menuPracas").show("fast");
			 menuVisivel = true;
		 }else{
			 $("#menuPracas").hide("fast");
			 menuVisivel = false;
		 }
	 }
</script>
</head>
<body>
<!-- onclick="closeAllNews(event);" -->
	<input type="hidden" id="cid" name="cid" value="${cid}" />

	<div id="tudo">
		<%
			int i = 0;
		%>
		
		<fieldset style="height: 154px; width: 228px;float: left;margin-top: 6px;">
			<div class="divvertical" id="listaPraca" style="height: 217; overflow: auto;">
					<legend>Praças</legend>
					<table id="listaPracasTable" class="display" style="width: 100px;">
						<tbody>
							
						</tbody>
					</table>
			</div>
		</fieldset>



		
		<div id="dadospracaContent">
		
		</div>
		
		<c:if test="${isnovo==null}">
			<div class="divhorizontal" id="listaLocais" style="z-index: 31;">
				
			</div>

	
			<c:if test="${local==null}">
				<div class="divhorizontal" id="listaPistas">
					
				</div>
			</c:if>
		</c:if>
	</div>
	
</body>
</html>