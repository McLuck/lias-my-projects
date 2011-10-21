/**
 * Renderiza painel de opcoes acima da tabela selecionada
 */
function fnTabelaRenderOptions(tabela, linksOpcoes) {
	tabela = $(tabela);
	var idTable = $(tabela).attr("id");
	var linkNovo = linkOpcoes["fnNovo"];
	var linkEditar = linkOpcoes["fnEditar"];
	var linkDel = linkOpcoes["fnDel"];
	var linkAbrir = linkOpcoes["fnAbrir"];
	var options = "<div id=\"frameOpcoesTable_"+idTable+"\" style=\"height: 24px;\">"
			+ "<div id=\"opcoesEffects_"+idTable+"\" style=\"display: none; background-color: #EEEEEE; float:right;\" class=\"ui-state-default ui-corner-all\">"
			+ "<div class=\"icone-horizontal novo-documento16\" title=\"Novo\" onclick=\""+linkNovo+"\"></div>"
			+ "<div class=\"icone-horizontal edit-documento16\" title=\"Alterar\" onclick=\""+linkEditar+"\"></div>"
			+ "<div class=\"icone-horizontal del-documento16\" title=\"Apagar\" onclick=\""+linkDel+"\"></div>"
			+ "<div class=\"icone-horizontal abrir-documento16\" title=\"Abrir\" onclick=\""+linkAbrir+"\"></div>"
			+ "</div></div>";
	
}

var panelOptionTable_temp = null;
function showFrameOptions(id){
	var tempDisplay = $("#opcoesEffects_"+id);
	if(panelOptionTable_temp!=null){
		if(panelOptionTable_temp != tempDisplay){
			hideFrameOptions();
		}else{
			return;
		}
	}
	panelOptionTable_temp = $("#opcoesEffects_"+id);
	$(panelOptionTable_temp).show("fade"); 
	
}
function hideFrameOptions(){
	if(panelOptionTable_temp==null){
		return;
	}
	$(panelOptionTable_temp).hide("fade");
	panelOptionTable_temp = null;
}