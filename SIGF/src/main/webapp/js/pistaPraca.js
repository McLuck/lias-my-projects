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
function loadTable(id){
    $.ajax({
        url : "listaPista.htm?pracaid="+id,
        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
        success : function(data) {
            $("#table_content_pista").html(data);
        }
    });
}
       
function auxClick(idps, event){
	if(idps==editando){
		event.stopPropagation();
	}
}
var editando = -1;
function editar(id){
	clickFora();
	editando = id;
    $("#pista_table_content_"+id).hide();
    $("#pista_edit_content_"+id).show();
    var idel = "#nomeMaquina"+id;
    $(idel).focus();
    //idLocalizacao_input
}

function clickFora(){
	if(editando!=-1){
		try{
			CancelEdit(editando);
		}catch(Ee){}
		editando = -1;	
	}
}
function CancelEdit(id){
    $("#pista_edit_content_"+id).hide();
    $("#pista_table_content_"+id).show();
    editando = -1;
}
function iframeAutoHeight(quem){
    if(navigator.appName.indexOf("Internet Explorer")>-1){ //ie sucks
        var func_temp = function(){
            var val_temp = quem.contentWindow.document.body.scrollHeight + 15
            quem.style.height = val_temp + "px";
        }
        setTimeout(function() { func_temp() },100) //ie sucks
    }else{
        var val = quem.contentWindow.document.body.parentNode.offsetHeight + 15
        quem.style.height= val + "px";
    }
}