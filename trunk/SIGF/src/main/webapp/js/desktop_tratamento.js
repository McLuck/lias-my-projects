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