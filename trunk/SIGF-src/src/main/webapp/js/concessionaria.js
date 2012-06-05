function clickConfigMP(id, equip, contato){
    if(!equip && !contato){
        return;
    }
    
    $.ajax({
        url : "formConfigMP.htm?cmd=loadConfig&id="+id,
        type: "get",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#screen_config_mp").show();
            $("#screen_config_mp").html(data);
            $("#id_mp_config").val(id);
            if(contato){
                $("#config_mp_contato").show();
            }else{
                $("#config_mp_contato").hide();
            }
            if(equip){
                $("#config_mp_equip").show();
            }else{
                $("#config_mp_equip").hide();
            }
    
            var ep = document.getElementById("tr_mp_"+id);
            var x = pX(ep)+200;
            var y = 10;
    
    
            var frame = document.getElementById("screen_config_mp");
            frame.style.left = x+"px";
            frame.style.top = y+"px";
            frame.style.display = "block";
        }
    });   
}

var running = false;
function savePracaMP(mid){
    $("#msg_status_mps").html("Aguarde...");
    if(running){
        return;
    }
    running = true;
    
    var params = $("#formPracaMeioPGTO").serialize();
    params += "&cmd=savePgtoPraca";
    var dataType = "html";
    $.ajax({
        url : "formConfigMP.htm",
        type: "get",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            running = false;
            pracaMpSaved(mid);
        },
        error : function(data){
            running = false;
        }
    });
}

function pracaMpSaved(mid){
    $("#msg_status_mps").html("Salvo com sucesso em "+new Date());
    var name = "#tr_mp_" +mid
    $(name).hide("fast");
}

function clickPMP(ativoid){
    if(document.getElementById("ativo_"+ativoid).checked){
        $("#codLocal_"+ativoid).removeAttr("disabled");
    }else{
        $("#codLocal_"+ativoid).attr("disabled", "true");
    }
}

function loadConfigurationForArrecadacao(cid){
    $.ajax({
        url : "formArrecad.htm?cid="+cid,
        type: "get",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#detalhe_arrecadacao_frame").html(data);
        }
    });
}

function loadConfigurationForMalote(cid){
    $.ajax({
        url : "formMalote.htm?cid="+cid,
        type: "get",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#detalhe_malote_frame").html(data);
            habilitaItens();
        }
    });
}

function habilitaItens(){
    if(document.getElementById("regDeposito_forma").value==3){
        $("#layer_config_formato_arquivo_ret_malote").show();
    }
    opc_lacre_malote();
}

function saveAllOperacional(cid){
    try{
        saveArrecadForm(cid);
    }catch(e){}
    try{
        salvarConfigMP(cid);
    }catch(e){}
    try{
        salvarMPsUtilizadas(cid);
    }catch(e){}
    try{
        saveMaloteForm(cid);
    }catch(e){}
}

function saveArrecadForm(cid){
	
    var params = $("#formConfArrecadacao").serialize();
    var dataType = "html";
    $.ajax({
        url : "formArrecad.htm?cid="+cid,
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#msg_status_arrecad").html("Salvo em "+new Date());
        }
    });
}

function saveMaloteForm(cid){
    var params = $("#formConfMalote").serialize();
    var dataType = "html";
    $.ajax({
        url : "formMalote.htm?cid="+cid,
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#msg_status_malote").html("Salvo em "+new Date());
        }
    });
}

function showConfigMp(id, temConf){
    if(temConf){
        if(document.getElementById("ch_meio_habilitado"+id).checked){
            $("#layer_config_button"+id).show();   
        }else{
            $("#layer_config_button"+id).hide();   
        }
    }
}

function closeConfigMP(){
    $("#screen_config_mp").hide();
}
function loadFrameMeioPagamentos(cid){
    $.ajax({
        url : "formConfigMP.htm?cid="+cid,
        type: "get",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#detalhe_meio_pagamento_frame").html(data);
        }
    });
}
function salvarConfigMP(cid){
    var params = "cmd=cfg&"+$("#form_config_mp").serialize();
    var dataType = "html";
    $.ajax({
        url : "formConfigMP.htm?cid="+cid,
        type: "get",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            closeConfigMP();
        }
    });
}

function salvarMPsUtilizadas(cid){
    var params = "cmd=saveAll&"+$("#form_mps_utilizados").serialize();
    var dataType = "html";
    $.ajax({
        url : "formConfigMP.htm?cid="+cid,
        type: "get",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#msg_status_mps").html("Salvo em "+new Date());
        }
    });
}

function loadConfigSGBD(cid){
    $.ajax({
        url : "bdmanager.htm?cmd=get&cid="+cid,
        type: "get",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#frame_dados_sgbd").html(data);
        }
    });
}

function editarCatg(id){
    $("#categoria_table_content_"+id).hide();
    $("#categoria_edit_content_"+id).show();
}
function cancelEdit(id){
    $("#categoria_edit_content_"+id).hide();
    $("#categoria_table_content_"+id).show();
}

function deleteCategoriaFN(id, cid){
	
    if(window.confirm("Tem certeza que deseja apagar esta categoria?")){
        var params = "cmd=del&id="+id+"&cid="+cid;
        var dataType = "html";
        $.ajax({
            url : "formCategoria.htm",
            type: "get",
            data: params,
            dataType: dataType,
            contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
            success : function(data) {
                loadCATEGsTable(cid);
            }
        });
    }
}

function saveCATEG(id, cid){
    var params = $('#form_categ'+id).serialize();
    params += "&cid="+cid;
    var dataType = "html";
    $.ajax({
        url : "formCategoria.htm",
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            if(data!="ok"){
                $("#msg_status_categ").html(data);
            }else{
                $("#msg_status_categ").html("Salvo em "+new Date());
                loadCATEGsTable(cid);
            }
        }
    });
}

function saveDividas(cid){
	$("#msg_sts_divida").html("&nbsp;");
	var params = $('#formDividaTermo').serialize();
    params += "&cmd=saveDivida&cid="+cid;
    var dataType = "html";
    $.ajax({
        url : "config_geral.htm",
        type: "get",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#msg_sts_divida").html("Salvo!");
        }
    });
}

function loadCATEGsTable(cid){
	//ogn('dadosgeraiscategorias');
    var dataType = "html";
    $.ajax({
        url : "formCategoria.htm?cid="+cid,
        type: "get",
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#screen_categorias_config_frame").html(data);
        }
    });
}

function loadConfigImagesContent(cid){
    var dataType = "html";
    $.ajax({
        url : "formConfigImagem.htm?cid="+cid,
        type: "get",
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#frame_config_img_content").html(data);
        }
    });
}

function saveBD(cid){
    var params = $('#form_server_bd').serialize();
    var dataType = "html";
    $.ajax({
        url : "bdmanager.htm?cid="+cid,
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            if(data!="ok"){
                $("#msg_status_bd").html(data);
            }else{
                $("#msg_status_bd").html("Salvo em "+new Date());
            }
        }
    });
}

function saveConc1(cid){
    var params = $('#form_conc_dados1').serialize();
    var dataType = "html";
    $.ajax({
        url : "formConcessinaria.htm?cid="+cid,
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            try{
                $("#cid").val(data);
                $("#msg_status_conc1").html("Salvo em "+new Date());
            }catch(e){
                if(data!="ok"){
                    $("#msg_status_conc1").html(data);
                }else{
                    $("#msg_status_conc1").html("Salvo em "+new Date());
                }   
            }
        }
    });
}

function saveConc3(cid){
	var params = $('#formConfigPracasConc').serialize();
	var dataType = "html";
	$.ajax({
		url : "formConcessinaria.htm?cmd=cfgprc&cid="+cid,
		type: "post",
		data: params,
		dataType: dataType,
		contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
		success : function(data) {
			$("#msg_status_cfgprc").html("Salvo com sucesso!");
		}
	});
}

function saveConc2(cid){
    var params = $('#form_conc_dados2').serialize();
    var dataType = "html";
    $.ajax({
        url : "formConcessinaria.htm?cid="+cid,
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            if(data!="ok"){
                $("#msg_status_conc2").html(data);
            }else{
                $("#msg_status_conc2").html("Salvo em "+new Date());
            }
        }
    });
}

function saveConfigImagem1(){
    var params = $('#form_pts_img_adq').serialize();
    alert(params);
    var dataType = "html";
    $.ajax({
        url : "formConfigImagem.htm",
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            if(data!="ok"){
                $("#msg_status_conc3").html(data);
            }else{
                $("#msg_status_conc3").html("Salvo em "+new Date());
            }
        }
    });
}

function saveAllImgConfig(cid){
    try{
        getChbParametters(cid);
    }catch(e){}
    try{
        saveFormConfigImg(cid);
    }catch(e){}
}
function getChbParametters(cid){
    var params = "cmd=chb&"+$('#form_pts_img_adq').serialize();
    params += "&"+$('#form_capt_por_tipo').serialize();
    params += "&cid="+cid;
    alert(params);
    var dataType = "html";
    $.ajax({
        url : "formConfigImagem.htm",
        type: "get",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#msg_status_configImag1").html("Salvo em "+new Date());
        }
    });
}

function saveFormConfigImg(cid){
    var params = $('#form_cnfig_img_').serialize();
    params += "&qtdAdquirida="+$("#qtdAdquirida").val();
    params += "&cid="+cid+"&cmd=saveConfigIMG";
    alert(params);
    var dataType = "html";
    $.ajax({
        //url : "formConfigImagem.htm",
    	url : "dadosGerais.htm",
        type: "post",
        data: params,
        dataType: dataType,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#msg_status_configImag1").html("Salvo em "+new Date());
        }
    });
}

function opc_operacao_sa(){
    if(document.getElementById("c_dg_link1").checked == true){
        $("#htabtolinks").show();
    }else{
        $("#htabtolinks").hide();
    }
}

function opc_so_sgbd(){
    //
    if(document.getElementById("sgbd_so_lnx").checked){
        //Se tiver selecionado o MS SQL Server, muda selecao para oracle 11g
        if(document.getElementById("sgbd_ms").checked){
            $("#sgbd_ms").removeAttr('selected');
            $("#sgbd_o11").attr('checked', true);
        }
        //Disabilita o controle o sql server
        $("#sgbd_ms").attr('disabled', true);
    }else{
        //habilita o controle do sql server
        $("#sgbd_ms").attr('disabled', false);
    }
}

function opc_sgbd_so(){
    //
    if(document.getElementById("sgbd_ms").checked){
        //Se tiver selecionado o MS SQL Server, muda selecao para oracle 11g
        if(document.getElementById("sgbd_so_lnx").checked){
            $("#sgbd_so_lnx").removeAttr('selected');
            $("#sgbd_so_w08").attr('checked', true);
        }
        //Disabilita o controle o sql server
        $("#sgbd_so_lnx").attr('disabled', true);
        $("#sgbd_so_linux_name").attr('disabled', true);

    }else{
        //habilita o controle do sql server
        $("#sgbd_so_lnx").attr('disabled', false);
        $("#sgbd_so_linux_name").attr('disabled', false);
    }
}

function create_select_tipo_carros(){
    $('.td_tp_carro').append('<select><option value="ps">Passeio</option><option value="mt">Moto</option><option value="cm">Comercial</option></select>');
}


function opc_cat_esp_tp(){
    if(document.getElementById("cats_opc_3").checked){
        $("#cats_opc_outra_value").attr('disabled', false);
    }else{
        $("#cats_opc_outra_value").attr('disabled', true);
    }
}

function opc_existe_cat_ambigua(){
    if(document.getElementById("ch_cat_amb").checked){
        $("#frame_cat_ambigua").show();
        opc_existe_correcao_cat_ambigua();
    }else{
        $("#frame_cat_ambigua").hide();
        $("#frame_percent_cat_ambigua").hide();
    }
}

function opc_existe_correcao_cat_ambigua(){
    if(document.getElementById("ch_correcao_cat_amb").checked){
        $("#frame_percent_cat_ambigua").show();
    }else{
        $("#frame_percent_cat_ambigua").hide();
    }
}


function opc_existe_config_smartcard(){
    $("#screen_config_visa_vale_pedagio").hide();
    $("#screen_config_smartcard").hide();
    $("#screen_config_pgto_dbtrans").hide();
    
    if(document.getElementById("ch_meio_pgto_smartcard_indv").checked || document.getElementById("ch_meio_pgto_smartcard_empresa").checked){
        $("#layer_config_smartcard").show();
    }else{
        $("#layer_config_smartcard").hide();
        $("#screen_config_smartcard").hide();
    }
}

function opc_existe_config_vvpedagio(){
    $("#screen_config_visa_vale_pedagio").hide();
    $("#screen_config_smartcard").hide();
    $("#screen_config_pgto_dbtrans").hide();
    
    if(document.getElementById("ch_meio_pgto_vvpedagio").checked){
        $("#bt_config_vvp").show();
    }else{
        $("#bt_config_vvp").hide();
        $("#screen_config_visa_vale_pedagio").hide();
    }
}

function opc_existe_config_dbtrans(){
    $("#screen_config_visa_vale_pedagio").hide();
    $("#screen_config_smartcard").hide();
    $("#screen_config_pgto_dbtrans").hide();
    
    if(document.getElementById("ch_meio_pgto_vp_dbtrans").checked){
        $("#bt_config_dbtrans").show();
    }else{
        $("#bt_config_dbtrans").hide();
        $("#screen_config_pgto_dbtrans").hide();
    }
}

function pX(objeto) //Retorna posicao X (horizontal do elemento);
{
    var atual_left = 0;
    if (objeto.offsetParent) {
        while (objeto.offsetParent) {
            atual_left += objeto.offsetLeft
            objeto = objeto.offsetParent;
        }
    }
    return atual_left;
}

function pY(objeto)////Retorna posicao Y (vertical do elemento);
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

function closeFR(id){
    id = "#"+id
    $(id).hide();
}


function openConfigSmartCard(){
    $("#screen_config_visa_vale_pedagio").hide();
    $("#screen_config_smartcard").hide();
    $("#screen_config_pgto_dbtrans").hide();
    var ep = document.getElementById("ch_meio_pgto_smartcard_indv");
    var x = pX(ep)+200;
    var y = pY(ep);
    
    
    var frame = document.getElementById("screen_config_smartcard");
    frame.style.left = x+"px";
    frame.style.top = y+"px";
    frame.style.display = "block";
    
}

function openConfigVisaValePed(){
    $("#screen_config_visa_vale_pedagio").hide();
    $("#screen_config_smartcard").hide();
    $("#screen_config_pgto_dbtrans").hide();
    var ep = document.getElementById("ch_meio_pgto_vvpedagio");
    var x = pX(ep)+200;
    var y = pY(ep);
    
    
    var frame = document.getElementById("screen_config_visa_vale_pedagio");
    frame.style.left = x+"px";
    frame.style.top = y+"px";
    frame.style.display = "block";
    
}

function openConfigDBTrans(){
    $("#screen_config_visa_vale_pedagio").hide();
    $("#screen_config_smartcard").hide();
    $("#screen_config_pgto_dbtrans").hide();
    
    var ep = document.getElementById("ch_meio_pgto_vp_dbtrans");
    var x = pX(ep)+200;
    var y = pY(ep);
    
    var frame = document.getElementById("screen_config_pgto_dbtrans");
    frame.style.left = x+"px";
    frame.style.top = y+"px";
    frame.style.display = "block";
    
}

function opc_lacre_malote(){
    if(!document.getElementById("radio_repete_lacre_malote1").checked){
        $("#layer_config_repeticao_lacre_malote").show();
    }else{
        $("#layer_config_repeticao_lacre_malote").hide();
    }
}

function opc_habilita_detalhe_arquivo(elem){
    if(elem.value == "3"){
        $("#layer_config_formato_arquivo_ret_malote").show();
    }else{
        $("#layer_config_formato_arquivo_ret_malote").hide();
    }
}

function viewDetalhesPraca(){
    $("#tabela_geral_pracas").hide("fast");
    $("#dadosPagina_detalhes").show("fast");
}
function closeDetalhesPraca(){
    $("#dadosPagina_detalhes").hide("fast");
    $("#tabela_geral_pracas").show("fast");
}