var a = false, b = false, c = false;
function clickVTab(id) {
	showWait();
	var url = "";
	var ntabs = "";
	var cid = $("#cidd").val();
	switch (id) {

	case 1: {
		url = "formConcessinaria.htm?cid=" + cid;
		ntabs = "#cont_t1";
		$('#cont_t1').show();
		$('#cont_t2').hide();
		$('#cont_t3').hide();
		if (a) {
			return;
		} else {
			a = true;
		}
		break;
	}
	case 2: {
		url = "listar_pracas.htm?cmd=getPracas&cid=" + cid;
		ntabs = "#cont_t2";
		$('#cont_t2').show();
		$('#cont_t1').hide();
		$('#cont_t3').hide();
		if (b) {
			return;
		} else {
			b = true;
		}
		break;
	}

	case 3: {
		url = "config_geral.htm?cmd=configGeral&cid=" + cid;
		ntabs = "#cont_t3";
		$('#cont_t3').show();
		$('#cont_t2').hide();
		$('#cont_t1').hide();
		if (c) {
			return;
		} else {
			c = true;
		}
		break;
	}
	}

	$.ajax({
		url : url,
		success : function(data) {
			$(ntabs).html(data);
			if (id == 1) {
				opc_operacao_sa();
				opc_existe_cat_ambigua();
				opc_existe_correcao_cat_ambigua();
			}
			quebraLabel();
			if (id == 3) {
				try {
					loadConfigAcesso(cid);
				} catch (E) {
				}
			}
			try {
				loadPraca();
			} catch (e) {
			}
			$(function() {
				$("#htabs1").tabs();
				$("#htabs2").tabs();
				$("#htabs3").tabs();
				$('#lista_pracas').dataTable();

			});
		},
        complete : function(){
        	hideWait();
        }
	});
}

function render_accordion() {
	loadFrameMeioPagamentos();
	$('#accordion').accordion();
}

function refreshDiasConfigAcesso() {
	// concessionaria.htm
	var val = $("#qtdMinimaSegura").val();
	$("#qtdMinimaSegura1").html(val);
	$("#qtdMinimaSegura2").html(val);
}

function saveDataConfigAcesso() {
	var params = $("#formConfirmAcesso").serialize();
	params += "&cmd=saveConfigAcesso";
	$.ajax({
		url : "concessionaria.htm",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#msg_status_configAcesso").html("Salvo em " + new Date());
		}
	});
}

function clickSave(id, cid) {
	var params = "cmd=clicksave&id=" + id + "&cid=" + cid;
	$("#msg_status_funcionalidades").html("Salvando...");
	$
			.ajax({
				url : "formFuncionalidade.htm",
				data : params,
				type : "get",
				dataType : "html",
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					if (data == "ok") {
						$("#msg_status_funcionalidades").html(
								"Salvo em " + new Date());
					} else {
						$("#msg_status_funcionalidades").html(
								"Erro ao salvar este item. Tente novamente.");
						if (document.getElementById("utilizado" + id).checked) {
							document.getElementById("utilizado" + id).checked = false;
						} else {
							document.getElementById("utilizado" + id).checked = true;
						}
					}
				},
				error : function(data) {
					$("#msg_status_funcionalidades").html(
							"Erro ao salvar este item. Tente novamente.");
					if (document.getElementById("utilizado" + id).checked) {
						document.getElementById("utilizado" + id).checked = false;
					} else {
						document.getElementById("utilizado" + id).checked = true;
					}
				}
			});
}

function clickSaveRel(id, cid) {
	var params = "cmd=clicksave&id=" + id + "&cid=" + cid;
	$("#msg_status_relatorios").html("Salvando...");
	$.ajax({
		url : "formRelatorios.htm",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			if (data == "ok") {
				$("#msg_status_relatorios").html("Salvo em " + new Date());
			} else {
				$("#msg_status_relatorios").html(
						"Erro ao salvar este item. Tente novamente.");
				if (document.getElementById("utilizado" + id).checked) {
					document.getElementById("utilizado" + id).checked = false;
				} else {
					document.getElementById("utilizado" + id).checked = true;
				}
			}
		},
		error : function(data) {
			$("#msg_status_funcionalidades").html(
					"Erro ao salvar este item. Tente novamente.");
			if (document.getElementById("utilizado" + id).checked) {
				document.getElementById("utilizado" + id).checked = false;
			} else {
				document.getElementById("utilizado" + id).checked = true;
			}
		}
	});
}

function iframeAutoHeight(quem) {
	if (navigator.appName.indexOf("Internet Explorer") > -1) { // ie sucks
		var func_temp = function() {
			var val_temp = quem.contentWindow.document.body.scrollHeight + 15
			quem.style.height = val_temp + "px";
		}
		setTimeout(function() {
			func_temp()
		}, 100) // ie sucks
	} else {
		var val = quem.contentWindow.document.body.parentNode.offsetHeight + 15
		quem.style.height = val + "px";
	}
}

function saveConfigPraca_p1() {
	var params = $("#form__conf_praca_phase1").serialize();
	var type = "html";
	$.ajax({
		url : "formConfigPracaCV.htm",
		data : params,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#msg_status_ant_conf").html("Salvo em " + new Date());
		}
	});
}

function saveAntenaPista(idp) {
	var params = $("#form_antena_confPraca").serialize() + "&pid=" + idp;
	var type = "html";
	$.ajax({
		url : "formAntenaPista.htm",
		data : params,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#msg_status_ant_conf").html("Salvo em " + new Date());
			loadAntenaPistaFrame($("#select_praca_for_config").val());
		}
	});
}

function loadAntenaPistaFrame(idp) {
	$.ajax({
		url : "formAntenaPista.htm?pid=" + idp,
		type : "get",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#frame_antena_pista").html(data);
		}
	});
}

function loadConfigAcesso(cid) {
	$.ajax({
		url : "concessionaria.htm?cmd=loadConfigAcesso&cid=" + cid,
		type : "get",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#contentConfigAcesso").html(data);
		}
	});
}

function clickcomplexidade() {
	if ($("#complexidade").val() == "2") {
		$("#frame_senha_avancado").show();
	} else {
		$("#frame_senha_avancado").hide();
	}
}

function loadPraca() {
	
	var pid = $("#select_praca_for_config").val();
	var cid = $("#cidd").val();
	if (pid != null && pid != "" && pid != undefined) {
		$("#wait_seleciona").show();
		$
				.ajax({
					url : "formConfigPracaCV.htm?pid=" + pid + "&cid=" + cid,
					type : "get",
					contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
					success : function(data) {
						$("#tab_ConfigPracas").html(data);
						$("#htabs2tabsPraca").tabs();
						loadAntenaPistaFrame(pid);
					},
					complete: function(){
						$("#wait_seleciona").hide();
					}
				});
	}
}

function loadScripts(cid, rodar) {
	var vid = $("#select_versao_export").val();

	if (vid == "0" || rodar == '0') {
		return;
	}
	$("#wait_frame").show();
	var download = document.getElementById("download").checked;
	startServiceStatus();
	$("#content_scritps")
			.html(
					"<p>Aguarde, por favor!<br />Scripts sendo gerado...  <img = src='images/wait.gif' border='0' alt='Aguarde' title='Aguarde' /></p>");
	$
			.ajax({
				url : "script.htm?cid=" + cid + "&vid=" + vid + "&down="
						+ download,
				type : "get",
				async : true,
				cache : false,
				contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
				success : function(data) {
					var area = data;
					if (download) {
						$("#content_scritps")
								.html(
										"<p>Seu script esta iniciando o download.</p><p><a href='javascript:downloadScript();'>Clique aqui se o download nao iniciar.</a></p>");
						downloadScript();

					} else {
						$("#content_scritps").html(area);
					}

					$("#wait_frame").hide();
					stopServiceStatus();
				},
				error : function(data) {
					$("#content_scritps").html(
							"Houde um erro ao processar seu pedido.<br/>"
									+ data);
					$("#wait_frame").hide();
					stopServiceStatus();
				}
			});
}
function downloadScript() {
	document.location.href = "Status?cmd=download";
}

function goExport(cid) {
	var vid = $("#select_versao_export").val();
	if (vid == "0") {
		return;
	}
	$("#content_scritps")
			.html(
					"<p>Aguarde, por favor!<br />Scripts sendo gerado...  <img = src='images/wait.gif' border='0' alt='Aguarde' title='Aguarde' /></p>");
	var params = $("#form_insert").serialize();
	params += "&cmd=export&cid=" + cid + "&vid=" + vid;
	$.ajax({
		url : "script.htm?" + params,
		type : "get",
		async : true,
		cache : false,
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			var area = data;
			$("#content_scritps").html(area);
		},
		error : function(data) {
			$("#content_scritps").html(
					"Houde um erro ao processar seu pedido.<br/>" + data);
		}
	});
}

function saveConfigSensores() {
	var params = $("#form_geoSensores").serialize();

	$.ajax({
		url : "formConfigPracaCV.htm?c=submit",
		data : params,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#msg_status_pracas_tab").html("Salvo em " + new Date());
		}
	});
}

function clickModeloAVC() {
	if ($("#cvClassificaArmazenaSA").val() == "3") {
		$("#cvModeloFrameConfig").show();
	} else {
		$("#cvModeloFrameConfig").hide();
	}
}

function loadGeoSensoresConfig() {
	var pid = $("#select_praca_for_config").val();
	$.ajax({
		url : "formConfigPracaCV.htm?pid=" + pid + "&cmd=configSensores",
		type : "get",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#tabs-2").html(data);
			testCheckedEixos();
		}
	});
}

function testCheckedEixos() {
	var el1 = document.getElementById("detectEixoSuspenso");
	var el2 = document.getElementById("detectJuntoEixoChao");
	var el3 = document.getElementById("cobrancaEixo");

	if (el2.checked) {
		el3.style.display = "block";
	} else {
		el3.style.display = "none";
	}

	if (el1.checked) {
		el2.style.display = "block";
	} else {
		el2.style.display = "none";
		el3.style.display = "none";
	}
}

function quebraLabel() {
	$("label").append("<br/>");
}
$(function() {
	$("#vtabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix')
			.removeClass('ui-tabs-nav');
	$("#vtabs li").removeClass('ui-corner-top').addClass('ui-corner-left');

});

function clonaConcessionaria(id) {
	var nome = window.prompt("Digite o nome da nova vers√£o.", "(CLONE)");
	if (nome == null || nome.length < 3) {
		alert("Nome n√£o foi aceito. Deve ter no m√≠nimo 3 caracteres.\nOpera√ß√£o cancelada!");
		return;
	}
	var msg = "Voc√™ ir√° clonar um registro com todas suas depend√™ncias no banco de dados.\nTem certeza que deseja continuar?";
	if (!window.confirm(msg)) {
		return;
	}

	var url = "concessionaria.htm?cmd=clone&cid=" + id + "&nome=" + nome;

	$.ajax({
		url : url,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			if (data == "ok") {
				window.location.href = "admNavegacao.htm?cmd=ccs";
			}
		}
	});
}

/**
 * retorna a posicao X do elemento
 */
function pX(objeto) {
	var atual_left = 0;
	if (objeto.offsetParent) {
		while (objeto.offsetParent) {
			atual_left += objeto.offsetLeft
			objeto = objeto.offsetParent;
		}
	}
	return atual_left;
}

/**
 * retorna a posicao Y do elemento
 */
function pY(objeto) {
	var atual_top = 0;
	if (objeto.offsetParent) {
		while (objeto.offsetParent) {
			atual_top += objeto.offsetTop
			objeto = objeto.offsetParent;
		}
	}
	return atual_top;
}

var idtemp = 0;
var aberto = false;
function clickMenu(id) {
	if (aberto == true && id == idtemp) {
		document.getElementById("myMenu1").style.display = "none";
		aberto = false;
		return;
	}
	aberto = true;
	idtemp = id;
	var ide = "id" + id;
	var ele = document.getElementById(ide);
	var menu = document.getElementById("myMenu1");
	var x = pX(ele) - 40;
	var y = pY(ele) + 5;
	menu.style.display = "block";
	menu.style.position = "absolute";
	menu.style.left = x + "px";
	menu.style.top = y + "px";

	menu.style.zIndex = "33";

}

function cancelaMenu() {
	document.getElementById("myMenu1").style.display = "none";
	aberto = false;
}
function injetaIDS() {
	$("#cloneid").val(idtemp);
	$("#alterid").val(idtemp);
	$("#insertid").val(idtemp);
}
function clickItem1() {
	injetaIDS();
	cancelaMenu();
	// carregar inserts

	var params = "vid=" + idtemp;
	params += "&cmd=optionsTable";
	$.ajax({
		url : "bdModelController.htm",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			var select = "<select name='tabela' id='tabela_select'>" + data
					+ "</select>";
			$("#select_tabelas").html(select);
		}
	});
	$("#formAddInsertDIV").show();
}
function clickItem2() {
	injetaIDS();
	cancelaMenu();
	$("#formCloneVersaoDIV").show();
}
function clickItem3() {
	injetaIDS();
	cancelaMenu();

	$("#formAlteracaoDIV").show();
}

function loadTableVersoes() {
	var url = "bdModelController.htm?cmd=getTableVersao";
	$.ajax({
		url : url,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#listaVersoes").html(data);
		}
	});
}

function IsNum(obj, event) {

	var Tecla = event.which;
	if (Tecla == null) {
		Tecla = event.keyCode;
	}

	if ((Tecla < 48 || Tecla > 59) && Tecla != 8) {
		event.returnValue = false;
		return false;
	} else {
		event.returnValue = true;
		return true;
	}
}

function CancelarClonagem() {
	$("#formCloneVersaoDIV").hide();
}
function CancelarModificacao() {
	$("#formAlteracaoDIV").hide();
}
function CancelarInsert() {
	$("#formAddInsertDIV").hide();
}
function ClonarVersao() {
	var params = $("#formCloneVersao").serialize();
	params += "&cmd=clonarVersao";
	$.ajax({
		url : "bdModelController.htm",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			CancelarClonagem();
			$("#msg_status_versao_control").html("Salvo em " + new Date());
			loadTableVersoes();
		}
	});
}
function alterarVersao() {
	var params = $("#formAlteracaVersao").serialize();
	params += "&cmd=alteracao";
	$.ajax({
		url : "bdModelController.htm",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			CancelarModificacao()();
			$("#msg_status_versao_control").html("Salvo em " + new Date());
		}
	});
}
function novoInsert() {
	if (document.getElementById("descricao").value.length < 25) {
		alert("…â exigido uma descriÁ„o de 25 caracteres deste registro.\nPor favor, seja bem detalhista quanto ao uso deste novo elemento na geraÁ„o do scripts, pois isto ir· ajudar quem for usar o SIGF mais tarde.\nObrigado!");
		return;
	}
	var params = $("#formAddInsert").serialize();
	params += "&cmd=insert";
	$.ajax({
		url : "bdModelController.htm",
		data : params,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			CancelarInsert()();
			$("#msg_status_versao_control").html("Salvo em " + new Date());
		}
	});
}

function saveRelatorios(cid) {
	var params = $("#form_relatorios").serialize() + "&cid=" + cid;
	var type = "html";
	$.ajax({
		url : "formRelatorios.htm?cmd=save",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#msg_status_relatorios").html("Salvo em " + new Date());
		}
	});
}

function saveFuncionalidades(cid) {
	var params = $("#form_funcionalidades").serialize() + "&cid=" + cid;
	var type = "html";
	$.ajax({
		url : "formFuncionalidade.htm?cmd=save",
		data : params,
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#msg_status_funcionalidades").html("Salvo em " + new Date());
		}
	});
}

function loadRelatorios(cid) {
	$.ajax({
		url : "formRelatorios.htm?cmd=load&cid=" + cid,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#content_relatorios").html(data);
			$('#table_relatorios').dataTable();
		}
	});
}

function loadFuncionalidades(cid) {
	$.ajax({
		url : "formFuncionalidade.htm?cmd=load&cid=" + cid,
		type : "post",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#content_funcionalidade").html(data);
			$('#table_funcionalidades').dataTable();
		}
	});
}

var serviceStatus = null;

function startServiceStatus() {
	serviceStatus = setInterval("verificaStatus()", 900);
}

function stopServiceStatus() {
	clearInterval(serviceStatus);
	clearInterval(serviceStatus);
	clearInterval(serviceStatus);
	serviceStatus = null;
}

function verificaStatus() {

	$.ajax({
		url : "Status?cmd=status",
		type : "get",
		dataType : "html",
		contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
		success : function(data) {
			$("#processo_status_script").html(data);
		},
		error : function(data) {
			$("#processo_status_script").html("&nbsp;");
		}
	});
}



function formataIP(IP)
{
       with (IP)
       {
               value = value.substr(0, 3) + '.' + 
                               value.substr(3, 3) + '.' + 
                               value.substr(6, 3) + '-' +
                               value.substr(9, 2);
       }
}



function maskIP(e,obj){
    if (document.all){var evt=event.keyCode;} // caso seja IE
    else{var evt = e.charCode;}    // do contr·rio...
    if (evt <20) return true;    // liberando teclas de controle
    if ( (/^(\d{1,3}\.){3}\d{3}$/).test(obj.value) ) return false;        
    var chr= String.fromCharCode(evt);    // pegando a tecla digitada
    if (! (/[\d\.]/).test(chr)) return false; // testando se È uma tecla v·lida (um digito ou um ponto)
    if (chr=='.')
        return (!(/\.$|^(\d{1,3}\.){3}/).test(obj.value) );
    else 
        if( (/\d{3}$/).test(obj.value) )
            obj.value+='.';            
    return true;
}
// /Mascara IP    //

// Valida IP    //    
function validateIP(ip,showErrMsg){
    a = (/\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/).test(ip);
    if (!a && showErrMsg){
        alert(ip+' n„o È um ip v·lido!');
    }
    return a;
}






function formataSentido(st){
	//SP, S„o Paulo
	
}