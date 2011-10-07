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

function ogn(name, cid){
	hideAllDados();
    document.getElementById(name).style.display = "block";
    tratarTituloGeral(name);
    tratarLink(name);
}

function tratarLink(name){
	zerarLinks();
	var id = "#li_"+name;
	$(id).animate({ backgroundColor: "#999" }, "fast");
}

function zerarLinks(){
	for(var i=0;i<dadosGerais.length;i++){
			var id = "#li_"+dadosGerais[i];
			try{
				$(id).animate({ backgroundColor: "#E9E9E6" }, "fast");
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
	//zerar link aberto
	zerarLinksPrx();
	
	//Altera a cor do link
	$("#li_prc_prc"+id).animate({ backgroundColor: "#999" }, "fast");
	prc_last_id = id;
	
	//Carrega Conteudo Praca
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


var tabscfg = new Array("tabRelatorio", "tabs-1", "tabs-3", "tabs-5", "rec_divida");

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
				$("#li_"+tabscfg[i]).animate({ backgroundColor: "#E9E9E6" }, "fast");
			}catch(e){}
		}
	}
}



