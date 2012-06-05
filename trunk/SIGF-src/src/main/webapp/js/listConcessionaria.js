function quebraLabel(){
    $("label").append("<br/>");
}
$(function() {
    $("#vtabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-tabs-nav');
    $("#vtabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
		
});
    
           
function clonaConcessionaria(id){
    var nome = window.prompt("Digite o nome da nova concessionaria.", "(CLONE)");
    if(nome==null || nome.length<4){
        alert("Nome nao foi aceito. Operacao cancelada!");
        return;
    }
    var msg = "Voce ira clonar um registro com todas suas dependencias no banco de dados.\nTem certeza que deseja continuar?";
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
            
function clickItem1(){
    cancelaMenu()
    window.location.href = "admNavegacao.htm?cid="+idtemp;
}
function clickItem2(){
    cancelaMenu()
    clonaConcessionaria(idtemp);
}