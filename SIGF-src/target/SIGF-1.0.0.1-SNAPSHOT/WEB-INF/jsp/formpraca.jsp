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
	width: 238px;
	float: left;
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
	function novoPista(){
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
			/* var params = "cmd=del&dominio=local&localid="+id+"&cid="+getCid();
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
			}); */
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
		/* if (event.stopPropagation) {
		    event.stopPropagation();
		} else {
		    event.cancelBubble = true;
		} */
		hideNewPista();
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
		try{
			event.stopPropagation();
		}catch(e){}
		try{
			event.stopImmediatePropagation();	
		}catch(e){}
		
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
</head>
<body>
<!-- onclick="closeAllNews(event);" -->
	<input type="hidden" id="cid" name="cid" value="${cid}" />

	<div id="tudo">
		<%
			int i = 0;
		%>
		<div class="divvertical" id="listaPraca" style="height: 217;">
			<fieldset style="height: 160px; width: 225px;">
				<legend>Praças</legend>
				<table id="listaPracasTable" class="display" style="width: 100px;">
					<thead style="display: none; width: 100px; border: 0px;">
						<th style="display: none; width: 0px; border: 0px;"></th>
					</thead>
					<tbody>
						<c:forEach items="${pracas}" var="pc">
							<c:if test="${pc!=null}">
								<tr id="tr__${pc.id}" onclick="goFormPraca(${pc.id});"
									<c:if test="${pracaid!=null && pracaid == pc.id}">class="row_selected"</c:if>>
									<td style="word-wrap: break-word;">${pc.description}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</fieldset>
		</div>



		<div class="divvertical" id="dadosPraca">

			<form action="gerenciarPracasCompleta.htm?dominio=praca&cmd=novo2"
				method="POST" id="form_dados_praca" name="form_dados_praca">
				<input type="hidden" value="${cid}" name="cid" id="cidd" /> <input
					type="hidden" value="${praca.id}" name="id" id="id" />
				<fieldset
					style="width: 620px; padding-left: 10px; padding-right: 10px; height: 160px;">
					<legend>Dados da praça</legend>
					<div>
						<label>Código:</label> <input type="text" id="prcNum" size="4"
							maxlength="3" placeholder="000" name="numeroPraca"
							value="${praca.numeroPraca}" style="width: 50px;" />
					</div>

					<div style="float: left;">
						<label>Nome:</label>
						<form:input path="praca.nome" onkeypress="changer(this, event);"
							placeholder="Nome da praça"
							cssStyle="margin-right: 5px; width:290px;" size="30" id="nome"
							maxlength="30" />
					</div>
					<div style="float: left; margin-right: 5px; float: right;">
						<label>CNPJ:</label>
						<form:input cssStyle="margin-right: 5px;width: 290px;"
							path="praca.cnpj" size="15" onkeypress="changer(this, event);"
							id="cnpj" alt="cnpj" onblur="sairCNPJ();" maxlength="18"
							placeholder="00.000.000/0000-00" />
					</div>

					<br />
					<div style="float: left; display: inline-block;">
						<label>Tráfego estimado:</label>
						<form:input path="praca.trafegoEstimado"
							onkeypress="changer(this, event);" size="6"
							cssStyle="margin-right: 5px;width:290px;" id="trafegoEstimado"
							maxlength="6" placeholder="0000" />
					</div>
					<div
						style="display: inline-block; float: right; padding-right: 5px;">
						<label>Distância CCA:</label>
						<form:input path="praca.distanciaCCA"
							cssStyle="margin-right: 5px;width: 290px;"
							onkeypress="changer(this, event);" size="10" id="distanciaCCA"
							maxlength="15" placeholder="0000" />
					</div>



				</fieldset>
			</form>
			<p align="center" style="color: red;" id="msg_status">&nbsp;</p>

		</div>



		<c:if test="${isnovo==null}">
		
			<%
				i = 0;
			%>
			<div class="divhorizontal" id="listaLocais" style="z-index: 31;">
				<fieldset>
					<legend>Localizações</legend>
					<table width="100%" class="display" id="tableLocais">
						<thead>
							<tr>
								<th width="92">Código</th>
								<th width="403">Descrição</th>
								<th width="199">Sentido
									<div id="iconsEdit_loc_tit"
										style="display: none; width: 60px; float: right;">
										<!-- <img alt="Cancelar" title="Cancelar"
											src="images/cancelar1.png"
											style="width: 15px; height: 15px; border: 0px;"
											onclick="onClickFimEditLocal();" /> --> 
											
											<img alt="Salvar"
											title="Salvar" src="images/check2.png"
											style="width: 15px; height: 15px; border: 0px;"
											onclick="onClickFimEditLocal();" /> 
											
											<img alt="Apagar"
											title="Apagar" src="images/remove.png"
											style="width: 15px; height: 15px; border: 0px;"
											onclick="apagarLocal();" />
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${praca.localizacoes}" var="lcs">
								<c:if test="${lcs!=null}">
									<tr id="tr_loc_${lcs.id}"
										onclick="onClickInitEditLocal(${lcs.id});"
										onmouseover="closeAll(event);"
										<%
												i++;
												out.print((i % 2 ==0)?"class='even'":"class='odd'");
											%>>
										<td width="92">${lcs.numero}</td>
										<td width="498">${lcs.descricao}</td>
										<td width="199" id="labelSentidosPraca${lcs.id}">
											${lcs.siglas}</td>
									</tr>
									<tr style="display: none;" id="edit_loc_${lcs.id}"
										onmouseover="viewIconsLocais(${lcs.id});"
										onmouseout="hideIconsLocais(${lcs.id});"
										<%
												out.print((i % 2 ==0)?"class='even2'":"class='odd2'");
											%>>
										<form id="formLocal_edt${lcs.id}"
											name="formLocal_edt${lcs.id}" action="#"
											onsubmit="return false;">
										<td width="92"><input maxlength="1" type="text"
											name="cod_local" placeholder="0" style="width: 96px;"
											id="cod_local${lcs.id}" value="${lcs.numero}" size="16" />
										</td>
										<td width="498px"><input type="text" name="desc_loc"
											style="width: 498px;" id="desc_loc" value="${lcs.descricao}"
											size="76" maxlength="30" placeholder="Localização 0" />
										</td>
										<td width="199" colspan="2"><select
											id="sentidos${lcs.id}" class="multiselect" name="sentidos"
											size="4" style="width: 160px; height: 40px; float: left;">
												<c:forEach items="${lcs.sentidos}" var="std">
													<c:if test="${std!=null}">
														<option value="${std.sigla}">${std.sentido}</option>
													</c:if>
												</c:forEach>
										</select>
											<div style="float: left;">
												<div onclick="add(${lcs.id});"
													class="novo-documento16 icone-horizontal"
													title="Adicionar novo sentido"></div>
												<div onclick="remove(${lcs.id});"
													class="del-documento16 icone-horizontal"
													title="Remover sentido selecionado"></div>
											</div>

											<div id="novoSentido${lcs.id}" style="display: none;"
												title="Adicionar novo sentido">
												<label>Sigla:</label> <input type="text" id="sigla${lcs.id}"
													name="sigla" maxlength="2" onkeyup="digita(${lcs.id});" /><br />
												<label>Sentido:</label> <input type="text"
													id="descc${lcs.id}" name="descc" maxlength="28" />
											</div>
										</td>
										</form>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr id="trLabelNovaLocal">
								<td onclick="showNewLocal(event);"
									style="text-align: center; color: #0000FF; text-decoration: underline; font-weight: bold;"
									colspan="3">Nova Localização</td>
							</tr>
							<tr class="even2" style="display: none;"
								onclick="ignoreClick(event);" id="trNewLocal">
								<form id="formLocal_edt00" name="formLocal_edt00" action="#"
									onsubmit="return false;">
									<td width="92"><input maxlength="1" type="text"
										name="cod_local" placeholder="0" style="width: 96px;"
										id="cod_local00" size="16" />
									</td>
									<td width="498px"><input type="text" name="desc_loc"
										style="width: 498px;" maxlength="30" onkeypress="verificadorDescricao(this);"
										placeholder="Localização 0" id="desc_loc00" size="76" />
									</td>
									<td width="199">
										<select id="sentidos00"
											class="multiselect" name="sentidos" size="4"
											style="width: 160px; height: 40px; float: left;">
										</select>
									
										<div style="float: left;">
											<div onclick="add('00');"
												class="novo-documento16 icone-horizontal"
												title="Adicionar novo sentido"></div>
											<div onclick="remove('00');"
												class="del-documento16 icone-horizontal"
												title="Remover sentido selecionado"></div>
										</div> <img alt="Salvar" title="Salvar" src="images/check2.png"
										style="width: 15px; height: 15px; border: 0px;"
										onclick="salvarLocal()" />
										<%-- novoLocal(${praca.id}); --%>

										<div id="novoSentido00" style="display: none;"
											title="Adicionar novo sentido">
											<label>Sigla:</label> <input type="text" id="sigla00"
												name="sigla00" maxlength="2" onkeyup="digita('00');" /><br />
											<label>Sentido:</label> <input type="text" id="descc00"
												name="descc00" maxlength="28" />
										</div>
									</td>
								</form>
							</tr>
						</tfoot>
					</table>

				</fieldset>
			</div>








<button onclick="limparFormPraca();">Limpar</button>
<button onclick="toast();">Limpar</button>
			<c:if test="${local==null}">
				<div class="divhorizontal" id="listaPistas">
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
										<div id="iconsEditPISTA"
											style="display: none; width: 60px; float: right;">
											<img alt="Cancelar" title="Cancelar"
												src="images/cancelar1.png"
												style="width: 15px; height: 15px; border: 0px; margin: 0px;"
												onclick="onClickFimEditPista();" /> <img alt="Salvar"
												title="Salvar" src="images/check2.png"
												style="width: 15px; height: 15px; border: 0px; margin: 0px;"
												onclick="alterarPista();" /> <img alt="Apagar"
												title="Apagar" src="images/remove.png"
												style="width: 15px; height: 15px; border: 0px; margin: 0px;"
												onclick="apagarPista();" />
										</div>
									</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${pistas}" var="lcs">
									<c:if test="${lcs!=null}">
										<tr id="tr_pst_${lcs.id}"
											onclick="onClickInitEditPista(${lcs.id});"
											onmouseover="closeAll(event);"
											<%
													i++;
													out.print((i % 2 ==0)?"class='even'":"class='odd'");
												%>>
											<td width="50">${lcs.numeroPista}</td>
											<td width="100">${lcs.localizacao.descricao}</td>
											<td width="70">${lcs.sentido}</td>
											<td width="70">${lcs.tipoStr}</td>
											<td width="160">${lcs.nomeMaquina}</td>
											<td width="134">${lcs.ipMaquina}</td>
										</tr>


										<tr style="display: none;" id="edit_pst_${lcs.id}"
											onclick="ignoreClick(event);"
											onmouseover="viewIcons(${lcs.id});"
											onmouseout="hideIcons(${lcs.id});"
											<%
													out.print((i % 2 ==0)?"class='even2'":"class='odd2'");
												%>>
											<form action="#" onsubmit="return false"
												name="formPista_edt_${lcs.id}" id="formPista_edt_${lcs.id}">
												<td width="50"><input type="text" name="cod_pst"
													placeholder="0" maxlength="2" id="cod_pst"
													value="${lcs.numeroPista}" size="20" style="width: 54px;" />
												</td>


												<td width="100"><select
													onclick="addEventChangeLocal(${lcs.id});" name="localid"
													id="desc_loc_pista${lcs.id}" style="width: 120px;">
														<c:forEach var="lz" items="${locais}">
															<option value="${lz.id}"
																<c:if test="${lz.id==lcs.localizacao.id}">selected="selected"</c:if>>${lz.descricao}</option>
														</c:forEach>
												</select>
												</td>
												<td width="70"><select name="sentido_pst"
													id="sentido_pst_${lcs.id}" style="width: 90px;">
												</select>
												</td>

												<td width="70"><select name="tipo" id="tipo${lcs.id}"
													style="width: 94px;">
														<c:forEach items="${tipospista}" var="tppt">
															<option
																<c:if test="${lcs.tipo==tppt.id}">selected="selected"</c:if>
																value="${tppt.id}">${tppt.nome}</option>
														</c:forEach>
												</select>
												</td>
												<td width="160"><input type="text" name="nomeMaquina"
													placeholder="P1CV00" id="nomeMaquina${lcs.id}"
													style="width: 177px;" value="${lcs.nomeMaquina}" size="23" />
												</td>
												<td width="134"><input type="text"
													placeholder="00.00.00.00" name="ipMaquina"
													style="width: 140px;" id="ipMaquina${pts.id}" size="15"
													value="${lcs.ipMaquina}" maxlength="15"
													onkeypress="return ( maskIP(event,this) );"
													onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';"
													onfocus="this.style.backgroundColor='transparent';" />
												</td>
											</form>
										</tr>
									</c:if>
								</c:forEach>
								<tr id="trLabelNewPista" onclick="showNewPista(event);">
									<td colspan="6"
										style="text-align: center; color: #0000FF; font-weight: bold; text-decoration: underline;">
										Nova Pista</td>
								</tr>
								<tr class="even2" id="trNewPista" style="display: none;"
									onclick="ignoreClick(event);">
									<form action="#" onsubmit="return false"
										name="formPista_edt_000" id="formPista_edt_000">
										<td width="50"><input type="text" maxlength="2"
											placeholder="0" nextinput="desc_loc_pista000" name="cod_pst"
											id="cod_pst000" size="20" style="width: 54px;" />
										</td>
										<td width="100"><select name="localid"
											onchange="carregarSentidosDoLocal('000');"
											onclick="carregarSentidosDoLocal('000');"
											id="desc_loc_pista000" style="width: 120px;">
												<c:forEach var="lz" items="${locais}">
													<option value="${lz.id}">${lz.descricao}</option>
												</c:forEach>
										</select>
										</td>
										<td width="70"><select name="sentido_pst"
											id="sentido_pst_000" style="width: 90px;">
										</select>
										</td>
										<td width="70"><select name="tipo" id="tipo${lcs.id}"
											style="width: 94px;">
												<c:forEach items="${tipospista}" var="tppt">
													<option value="${tppt.id}">${tppt.nome}</option>
												</c:forEach>
										</select>
										</td>
										<td width="160"><input maxlength="30" type="text"
											name="nomeMaquina"
											onkeypress="proximoCampo(this, event, 'ipMaquina000');"
											placeholder="P1CV00" id="nomeMaquina000"
											style="width: 177px;" size="23" />
										</td>
										<td width="134">
											<!-- onkeypress="return ( maskIP(event,this) );" --> 
											<input type="text" placeholder="00.00.00.00" name="ipMaquina"
											style="width: 130px; float: left;" id="ipMaquina000"
											size="15" maxlength="15"
											onkeypress="return ( maskIP(event,this) );"
											onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';"
											onfocus="this.style.backgroundColor='transparent';" /> <img
											alt="Salvar" title="Salvar" src="images/check2.png"
											style="width: 15px; float: right; height: 15px; border: 0px;"
											onclick="novoPista();" />
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

	<div style="float: right; margin-right: 4px;">
		<!-- <img alt="Cancelar Edição" title="Cancelar Edição" src="images/back.png" width="20px" height="20px" border="0px" style="padding-right: 5px;" onclick="closePraca();" /> -->
		<a href="gerenciarPracasCompleta.htm?cid=${cid}&cmd=novo"> <input
			type="image" src="images/novo.png"
			style="width: 60px; padding-top: 16px; display: inline;" /> </a> <input
			type="image" src="images/salvar_img.png"
			style="width: 60px; padding-top: 16px; height: 29px; display: inline;"
			onclick="pracaSubmit();" />
	</div>
<a href="#" onclick="verificarTable1();" >Teste1</a>
<a href="#" onclick="verificarTable2();" >Teste2</a>

</body>
</html>