/**
 * retorna a posicao X do elemento
 */
function pX(objeto){
    var atual_left = 0;
    if (objeto.offsetParent) {
        while (objeto.offsetParent) {
            atual_left += objeto.offsetLeft
            objeto = objeto.offsetParent;
        }
    }
    return atual_left;
}

var oTable = null;
function loadTrsPraca(cid){
	var url = "configPracas.htm?cmd=loadtrs&cid="+cid;
	$.ajax({
		url : url,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#lista_pracas_trs").html(data);
			if(oTable==null){
				oTable = $("#lista_pracas").dataTable(); 
			}else{
				oTable.fnReloadAjax();
			}
		}
	});
}


/**
 * retorna a posicao Y do elemento
 */
function pY(objeto)
{
    var atual_top = 0;
    if (objeto.offsetParent) {
        while (objeto.offsetParent) {
            atual_top += objeto.offsetTop
            objeto = objeto.offsetParent;
        }
    }
    return atual_top;
}

var dadosGerais = new Array("dadosgeraisconcessionaria", "dadosgeraispraca", "dadosgeraissgbd", "dadosgeraiscategorias", "dadosgeraisimagens", "dadosgeraisoperacional", "dadosgeraiscript");
var titDadosGerais = new Array(" - Concessionária", " - Praça", " - SGBD", " - Categorias", " - Imagens", " - Operacional", " - Script");

function hideAllDados(){
	for(var i=0;i<dadosGerais.length;i++){
            document.getElementById(dadosGerais[i]).style.display = "none";
        }
}

function openDadosGeral (i){
	hideAllDados();
    document.getElementById(dadosGerais[i]).style.display = "block";
}

function ogn(name){
	hideAllDados();
	document.getElementById(name).style.display = "block";
	
    tratarTituloGeral(name);
    tratarLink(name);
}
function setMaskCNPJ(ele){
	//$(ele).setMask();
	$(ele).setMask();
}
function loadCategFromTab(){
	var cid = $("#cid").val();
	loadCATEGsTable(cid);
}

function ogn(name, cid){
	hideAllDados();
	document.getElementById(name).style.display = "block";
	if(name=="dadosgeraiscategorias"){
		try{
			loadCategFromTab();
		}catch(e){}
	}
    tratarTituloGeral(name);
    tratarLink(name);
}

var tempRowSelected = null;
var idRegistro = null;
function clickRow(elem, idReg){
	idRegistro = idReg;
	if(tempRowSelected!=null){
		try{
			if(tempRowSelected==elem){
				hideFrameOptions();
				$(tempRowSelected).removeClass('row_selected');
				tempRowSelected = null;
				return;
			}else{
				$(tempRowSelected).removeClass('row_selected');
			}
		}catch(e){}
	}
	$(elem).addClass('row_selected');
	tempRowSelected = elem;
	showFrameOptions();
}

var tempOptions = null;
function showFrameOptions(){
	if(tempOptions!=null){
		return;
	}
	tempOptions = $("#opcoesEffects");// .show("blind");
	$(tempOptions).show("fade"); 
	
}
function hideFrameOptions(){
	if(tempOptions==null){
		return;
	}
	$(tempOptions).hide("fade");
	tempOptions = null;
}

function deletePraca(cid){
	if(!CONFIRMA_EXCLUSAO()){
		return;
	}
	try{
		$.ajax({
	        url : "gerenciarPracasCompleta.htm?cid="+cid+"&cmd=del&dominio=praca&pracaid="+idRegistro,
	        type: "get",
	        async : true,
	        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
	        success : function(data) {
	        	$(tempRowSelected).remove();
	        	hideFrameOptions(); 
	        	$("#dialogApagar1").dialog({ closeOnEscape: true})
	        }
	    });
	}catch(e){}
}

function tratarLink(name){
	zerarLinks();
	//var id = "#li_"+name;
	var id = "li_"+name;
	//$(id).animate({ backgroundColor: "#999" }, "fast");
	document.getElementById(id).style.backgroundColor = "#999";
}

function zerarLinks(){
	for(var i=0;i<dadosGerais.length;i++){
			//var id = "#li_"+dadosGerais[i];
			var id = "li_"+dadosGerais[i];
			try{
				document.getElementById(id).style.backgroundColor = "#E9E9E6";
				//$(id).animate({ backgroundColor: "#E9E9E6" }, "fast");
			}catch(e){}
    }
}

function tratarTituloGeral(name){
	for(var i=0;i<titDadosGerais.length;i++){
		if(name==dadosGerais[i]){
			$("#titConfigGeral").html(titDadosGerais[i]);
			break;
		}
    }
}

function ogn_prc(id){
	// zerar link aberto
	zerarLinksPrx();
	
	// Altera a cor do link
	$("#li_prc_prc"+id).animate({ backgroundColor: "#999" }, "fast");
	prc_last_id = id;
	
	// Carrega Conteudo Praca
	var pid = id;
	var cid = $("#cidd").val();
	var url = "formConfigPracaCV.htm?pid=" + pid + "&cid=" + cid;
	if (pid != null && pid != "" && pid != undefined) {
		var data = "<iframe src='"+url+"' id='praca_prc' name='praca_prc' style='border:none;' scrolling='no'  height='500px' frameborder='0' width='99%'>Seu navegador nao suporta a tecnologia</iframe>";
		$("#tab_ConfigPracas").html(data);
	}
}

var prc_last_id = 0;
function zerarLinksPrx(){
	try{
		$("#li_prc_prc"+prc_last_id).animate({ backgroundColor: "#E9E9E6" }, "fast");
	}catch(e){}
}


var tabscfg = new Array("tabRelatorio", "tabs-1", "tabs-3", "rec_dividass", "tabs-5");

function loadConfigGeral(name){
	var id = $("#_cid").val();
	for(var i=0;i<tabscfg.length;i++){
		if(tabscfg[i]==name){
			$("#li_"+name).animate({ backgroundColor: "#999" }, "fast");
			document.getElementById(name).style.display = "block";
			if(name=="tabs-1"){
				loadConfigAcesso(id);
			}else if(name=="tabRelatorio"){
				loadRelatorios(id);
			}else if(name=="rec_dividass"){
				loadConfigDividaTermo(id);
			}else if(name=="tabs-5"){
				loadFuncionalidades(id);
				try{
					$('#table_funcionalidades').dataTable();
				}catch(e){}
			}
		}else{
			try{
				document.getElementById(tabscfg[i]).style.display = "none";
			}catch(e){}
			try{
				$("#li_"+(tabscfg[i])).animate({ backgroundColor: "#E9E9E6" }, "fast");
			}catch(e){}
		}
	}
}



function loadConfigDividaTermo(cid){
    $.ajax({
        url : "config_geral.htm?cmd=configGeral&cid="+cid,
        type: "get",
        async : true,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#framRecDivida").html(data);
        }
    });
}

function addEventChangeLocal(pistaid){
	$("#desc_loc_pista"+pistaid).change(function () {
		carregarSentidosDoLocal(pistaid);
      }).trigger('change');
}

function proximoCampo(ele, e){
	try{
		if (!e) var e = window.event
		if (e.keyCode) code = e.keyCode;
		else if (e.which) code = e.which;
		
		//ENTER E TAB redirecionam para o proximo campos
		if(code==9 || code == 13){
			var idp = $(ele).attr("nextinput");
			if(idp instanceof Function){
				idp;
			}else{
				$("#"+idp).focus();
				return false;
			}
		}
	}catch(e){}
}
function proximoCampo(ele, e, idp){
	try{
		if (!e) var e = window.event
		if (e.keyCode) code = e.keyCode;
		else if (e.which) code = e.which;
		
		//ENTER E TAB redirecionam para o proximo campos
		if(code==9 || code == 13){
			if(idp instanceof Function){
				idp;
			}else{
				$("#"+idp).focus();
				return false;
			}
		}
	}catch(e){}
}

function carregarSentidosDoLocal(pistaid){
	$("#sentido_pst_"+pistaid).html("");
	var localid = $("#desc_loc_pista"+pistaid).val();
	
    $("#sentidos"+localid +" option").each(function () {
          //str += $(this).text() + " ";
    	var optn = "<option value='"+$(this).val()+"'>"+$(this).text()+"</option>";
          $("#sentido_pst_"+pistaid).append(optn);
    });
}
function tratarLabelForSentidosLocalizacao(localid){
	var str = "";
	var first = false;
	$("#sentidos"+localid +" option").each(function () {
		if(first==false){
			first = true;
		}else{
			str+= ", "
		}
        str += $(this).val();
    });
	$("#labelSentidosPraca"+localid).html(str);
}
//Criar requisicoes ajax para tratar varios sentidos para varias pracas
function add(localid) {
	$("#sigla"+localid).val("");
	$("#descc"+localid).val("");
	$("#novoSentido"+localid).dialog({
		modal: true,
		minWidth: 330,
		buttons: {
			"Sair": function() { $(this).dialog("destroy"); },
			"Salvar" : function(){
				var sigla = $("#sigla"+localid).val();
				var descc = $("#descc"+localid).val();
				if(sigla.length == 2 && descc.length >=3){
					$("#sentidos"+localid).append("<option value='"+sigla+"'>"+descc+"</option>");
		        	tratarLabelForSentidosLocalizacao(localid);
				}
				
				//Elimina o AJAX porque guarda tudo no cliente (JS) e envia todos os parametros de uma so vez
				/*if(localid=="00"){
					//Novo registro, nao manda para o BD
					$("#sentidos"+localid).append("<option value='"+sigla+"'>"+descc+"</option>");
					return;
				}
				if(sigla.length ==2 && descc.length>=3){
					$.ajax({
				        url : "gerenciarPracasCompleta.htm?cmd=add&localid="+localid+"&dominio=sentido&sigla="+sigla+"&sentido="+descc,
				        type: "get",
				        async : true,
				        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
				        success : function(data) {
				        	$("#sentidos"+localid).append("<option value='"+sigla+"'>"+descc+"</option>");
				        	tratarLabelForSentidosLocalizacao(localid);
				        }
				    });
				}*/
				$(this).dialog("destroy");
			}
		}
	});
}

function remove(localid) {
	var sigla = $('#sentidos'+localid).val();
	if(sigla!=null && sigla != undefined && sigla!=""){
		$('#sentidos'+localid+' option:selected').remove();
    	tratarLabelForSentidosLocalizacao(localid);
		
    	//Elimina ajax para enviar tudo de uma vez so no request do formulario
		/*$.ajax({
	        url : "gerenciarPracasCompleta.htm?cmd=del&localid="+localid+"&dominio=sentido&sigla="+sigla,
	        type: "get",
	        async : true,
	        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
	        success : function(data) {
	        	$('#sentidos'+localid+' option:selected').remove();
	        	tratarLabelForSentidosLocalizacao(localid);
	        }
	    });*/
	}
}
function digita(localid) {
	var val = $("#sigla"+localid).val();
	val = val.replace(/ /g, '');
	val = val.toUpperCase();
	if (val.length == 2) {
		$("#descc"+localid).focus();
	}
	$("#sigla"+localid).val(val);
}