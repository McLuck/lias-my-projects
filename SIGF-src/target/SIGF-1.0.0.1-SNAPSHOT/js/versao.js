function quebraLabel(){
    $("label").append("<br/>");
}
$(function() {
    $("#vtabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-tabs-nav');
    $("#vtabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
		
});
    
           
function clonaConcessionaria(id){
    var nome = window.prompt("Digite o nome da nova versão.", "(CLONE)");
    if(nome==null || nome.length<3){
        alert("Nome não foi aceito. Deve ter no mínimo 3 caracteres.\nOperação cancelada!");
        return;
    }
    var msg = "Você irá clonar um registro com todas suas dependências no banco de dados.\nTem certeza que deseja continuar?";
    if(!window.confirm(msg)){
        return;
    }
                
    var url = "concessionaria.htm?cmd=clone&cid="+id+"&nome="+nome;
                
    $.ajax({
        url : url,
        type : "get",
        dataType: "html",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data){
            if(data == "ok"){
                window.location.href = "admNavegacao.htm?cmd=ccs";
            }
        }
    });
}
            
            
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
            
var idtemp = 0;
var aberto = false;
function clickMenu(id){
    if(aberto==true && id==idtemp){
        document.getElementById("myMenu1").style.display = "none";
        aberto = false;
        return;
    }
    aberto = true;
    idtemp = id;
    var ide = "id"+id;
    var ele = document.getElementById(ide);
    var menu = document.getElementById("myMenu1");
    var x = pX(ele)-40;
    var y = pY(ele)+5;
    menu.style.display = "block";
    menu.style.position = "absolute";
    menu.style.left = x+"px";
    menu.style.top = y+"px";
                
    menu.style.zIndex = "33";
                
}
            
function cancelaMenu(){
    document.getElementById("myMenu1").style.display = "none";
    aberto = false;
}
function injetaIDS(){
    $("#cloneid").val(idtemp);
    $("#alterid").val(idtemp);
    $("#insertid").val(idtemp);
}
function clickItem1(){
    injetaIDS();
    cancelaMenu();
    //carregar inserts
                
    var params = "vid="+idtemp;
    params += "&cmd=optionsTable";
    $.ajax({
        url : "bdModelController.htm",
        data : params,
        type : "get",
        dataType: "html",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data){
            var select = "<select name='tabela' id='tabela_select'>"+data+"</select>";
            $("#select_tabelas").html(select);
        }
    });
    $("#formAddInsertDIV").show();
}
function clickItem2(){
    injetaIDS();
    cancelaMenu();
    $("#formCloneVersaoDIV").show();
}
function clickItem3(){
    injetaIDS();
    cancelaMenu();
                
            
                
    $("#formAlteracaoDIV").show();
}
            
function loadTableVersoes(){
    var url = "bdModelController.htm?cmd=getTableVersao";
    $.ajax({
        url : url,
        type : "post",
        dataType: "html",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data){
            $("#listaVersoes").html(data);
        }
    });
}
            
function IsNum(obj,event){
                
    var Tecla = event.which;
    if(Tecla == null){
        Tecla = event.keyCode;
    }

    if ( (Tecla < 48 || Tecla > 59)&& Tecla != 8 ){
        event.returnValue = false;
        return false;
    }else{
        event.returnValue = true;
        return true;
    }
}
            
function CancelarClonagem(){
    $("#formCloneVersaoDIV").hide();
}
function CancelarModificacao(){
    $("#formAlteracaoDIV").hide();
}
function CancelarInsert(){
    $("#formAddInsertDIV").hide();
}
function ClonarVersao(){
    var params = $("#formCloneVersao").serialize();
    params += "&cmd=clonarVersao";
    $.ajax({
        url : "bdModelController.htm",
        data : params,
        type : "get",
        dataType: "html",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data){
            CancelarClonagem();
            $("#msg_status_versao_control").html("Salvo em "+new Date());
            loadTableVersoes();
        }
    });
}
function alterarVersao(){
    var params = $("#formAlteracaVersao").serialize();
    params += "&cmd=alteracao";
    $.ajax({
        url : "bdModelController.htm",
        data : params,
        type : "get",
        dataType: "html",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data){
            CancelarModificacao()();
            $("#msg_status_versao_control").html("Salvo em "+new Date());
        }
    });
}
function novoInsert(){
    if(document.getElementById("descricao").value.length < 25){
        alert("É exigido uma descrição de 25 caracteres deste registro.\nPor favor, seja bem detalhista quanto ao uso deste novo elemento na geração do scripts, pois isto irá ajudar quem for usar o SIGF mais tarde.\nObrigado!");
        return;
    }
    var params = $("#formAddInsert").serialize();
    params += "&cmd=insert";
    $.ajax({
        url : "bdModelController.htm",
        data : params,
        type : "post",
        dataType: "html",
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data){
            CancelarInsert()();
            $("#msg_status_versao_control").html("Salvo em "+new Date());
        }
    });
}