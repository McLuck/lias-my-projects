function IsNum(event){
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

function dadosPraca_DisableAll(){
    jQuery('#screen_dados_praca :input').attr('disabled', true);
    $("#bt_screen_dados_praca_salve").val("Salvando...");
    $("#bt_screen_dados_praca_salve").html("Salvando...");
}
function dadosPraca_EnableAll(){
    jQuery('#screen_dados_praca :input').attr('disabled', false);
    $("#id").attr("disabled", true)
    $("#bt_screen_dados_praca_salve").val("Salvar");
    $("#bt_screen_dados_praca_salve").html("Salvar");
}



function mouseOn(ele){
    if(elemento!=null){
        if(elemento.getAttribute("id") == ele.getAttribute("id")){
            ele.style.backgroundColor = "#C8E366";
            return;
        }
    }
    ele.style.backgroundColor = "#C8E3EE";
}
var elemento = null;
function mouseOut(ele){
    if(elemento!=null){
        if(elemento.getAttribute("id") == ele.getAttribute("id")){
            ele.style.backgroundColor = "#C8E300";
            return;
        }
    }
    ele.style.backgroundColor = "#FFFFFF";
}
function mouseClick(ele){
    if(elemento!=null){
        elemento.style.backgroundColor = "#FFFFFF";
    }
    ele.style.backgroundColor = "#C8E300";
    elemento = ele;
}


var visivel = true;
function showAndHidePracas(){
    if(visivel){
        $("#menu_pracas_").hide("fast");
        $("#form_praca").show("fast");
        $("#pistas_frame").show("fast");
        $("#showhidemenu").html(">>");
        visivel = false;
        return;
    }else{
        $("#form_praca").hide("fast");
        $("#pistas_frame").hide("fast");
        $("#menu_pracas_").show("fast");
        $("#showhidemenu").html("<<");
        visivel = true;
        return;
    }
}

function iframeAutoHeight(quem){
    if(navigator.appName.indexOf("Internet Explorer")>-1){ //ie sucks
        var func_temp = function(){
            var val_temp = quem.contentWindow.document.body.scrollHeight + 15
            quem.style.height = val_temp + "px";
        }
        setTimeout(function() {
            func_temp()
        },100) //ie sucks
    }else{
        var val = quem.contentWindow.document.body.parentNode.offsetHeight + 15
        quem.style.height= val + "px";
    }
}

function closePraca(){
    autoSave();
    $("#pistas_frame").html("");
    $("#form_praca").html("");
    showAndHidePracas();
}