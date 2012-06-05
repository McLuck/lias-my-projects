var tableNOVA = null;

function zeroTabelaNova(){
    document.getElementById("newProt").innerHTML = "";
    document.getElementById("addn").style.display = "none";
    document.getElementById("idedit").value = "0";
    tableNOVA = null;
}
var idpr, name, osiid, tcpid, desc;
function getProtForEdit(idp){
    document.getElementById("idedit").value = idp;
    var url = "AJAX";
    var parametro = "metodo=getForEdit&id="+idp;
    var metodo = "post";
    MakeAJAX(metodo, url, parametro, function(){
        if (httpRequest.readyState == 4) {
                if (httpRequest.status == 200) {
                    var str = httpRequest.responseText;
                    newP();
                    str = decoderAJAX(str);
                    var vet = str.split("|");
                    
                    idpr = vet[0];
                    name = vet[1];
                    osiid=vet[2];
                    tcpid=vet[3];
                    desc=vet[4];
                    setdadosInForm();
                }
            }
    });
}

function setdadosInForm(){
    document.getElementById("idedit").value = idpr;
    document.getElementById("nome").value = name;
    document.getElementById("osic").value = osiid;
    document.getElementById("tcpc").value = tcpid;
    document.getElementById("descric").value = desc;
}

function addThisProtocol(element_id, html, body){
    var hhh = html;
    if(hhh!=undefined && (tableNOVA!=null)){
        //hhh = hhh.replace(/a/g,'b');
        //hhh = hhh.replace(/'%'/g,'/%');
        var iddd = document.getElementById("idedit").value;
        
        var url = "AJAX";
        var metodo="post";
        var parametro = "metodo=addThisProtocol&nome="+encodeURIComponent(document.getElementById("nome").value);
        if(iddd!="" && iddd!= "0"){
            parametro += "&id="+iddd;
        }
        parametro += "&desc="+encodeURIComponent(hhh)+"&osic="+encodeURIComponent(document.getElementById("osic").value)+"&tcpc="+encodeURIComponent(document.getElementById("tcpc").value)+"&passwd="+encodeURIComponent(document.getElementById("passwd").value);
        zeroTabelaNova();
        MakeAJAX(metodo, url, parametro, function(){
            if (httpRequest.readyState == 4) {
                if (httpRequest.status == 200) {
                    zeroTabelaNova();
                    var str = httpRequest.responseText;
                    if(str!=""){
                        str = decoderAJAX(str);
                        alert(str);
                    }
                }
            }
        });
    }
}

function iniciatTn(){
    tinyMCE.init({
        // General options
        mode : "exact",
        elements : "descric",
        theme : "advanced",
        plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups",

        // Theme options
        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,
        save_callback: "addThisProtocol",

        cleanup_on_startup : true,
        cleanup: true,

        // Example content CSS (should be your site CSS)
        content_css : "css/content.css",

        // Drop lists for link/image/media/template dialogs
        template_external_list_url : "lists/template_list.js",
        external_link_list_url : "lists/link_list.js",
        external_image_list_url : "lists/image_list.js",
        media_external_list_url : "lists/media_list.js",

        // Replace values for the template plugin
        template_replace_values : {
            username : "Some User",
            staffid : "991234"
        }
    });
}

function newP(){
    if(tableNOVA!=null){
        zeroTabelaNova();
        return;
    }
    document.getElementById("addn").style.display = "block";
    tableNOVA = document.createElement("table");
    //Aplicar estilos;

    var tr1 = tableNOVA.insertRow(0);
    var td1 = tr1.insertCell(0);
    td1.innerHTML = "<b>Nome:</b>";

    var td2 = tr1.insertCell(1);
    td2.innerHTML = "<input type='text' id='nome' />";

    var tr2 = tableNOVA.insertRow(1);
    var td3 = tr2.insertCell(0);
    td3.innerHTML = "<b>Camada OSI:</b>";
    var td4 = tr2.insertCell(1);

    var modelOSI = "<select id='osic'>";
    modelOSI += "<option value='1'>Física</option>";
    modelOSI += "<option value='2'>Enlace</option>";
    modelOSI += "<option value='3'>Rede</option>";
    modelOSI += "<option value='4'>Transporte</option>";
    modelOSI += "<option value='5'>Sessão</option>";
    modelOSI += "<option value='6'>Apresentação</option>";
    modelOSI += "<option value='7'>Aplicação</option>";
    modelOSI += "</select>";

    td4.innerHTML = modelOSI;

    var tr3 = tableNOVA.insertRow(2);
    var td5 = tr3.insertCell(0);
    td5.innerHTML = "<b>Camada TCP:</b>";
    var td6 = tr3.insertCell(1);

    var modelTCP = "<select id='tcpc'>";
    modelTCP += "<option value='1'>Rede</option>";
    modelTCP += "<option value='2'>Internet</option>";
    modelTCP += "<option value='3'>Transporte</option>";
    modelTCP += "<option value='4'>Aplicação</option>";
    modelTCP += "</select>";


    td6.innerHTML = modelTCP;

    var tr4 = tableNOVA.insertRow(3);
    var tddn = tr4.insertCell(0);
    tddn.innerHTML = "<b>Descrição:</b>";

    var tdd = tr4.insertCell(1);
    tdd.innerHTML = "<textarea id='descric' name='descric'></textarea>";

    var tr9 = tableNOVA.insertRow(0);
    var td9 = tr9.insertCell(0);
    td9.innerHTML = "<b>Senha Master:</b>";

    var td10 = tr9.insertCell(1);
    td10.innerHTML = "<input type='password' id='passwd' />";

    var trf = tableNOVA.insertRow(5);
    var tdf = trf.insertCell(0);
    tdf.setAttribute("colspan", "2");
    tdf.setAttribute("align", "center");

    tdf.innerHTML = "<a href=\"javascript:zeroTabelaNova()\">Cancelar</a>";


    document.getElementById("newProt").appendChild(tableNOVA);
    document.getElementById("newProt").style.display = "block";

    iniciatTn();
}

function clearTable(){
    var table = document.getElementById("lista");
    for(var i= 1;i<table.rows.length;i++){
        table.deleteRow(i);
    }
    if(table.rows.length>1){
        table.deleteRow(1);
    }
    TABELA = null;
}
function possui(vet,item){
    if(vet==null)
        return false;
    for(var i=0;i<vet.length;i++){
        if(vet[i]==item)
            return true;
    }
    return false;
}

var TABELA = null;

function addTable(item){
    var aux = TABELA;
    if(aux==null){
        aux = item.split(";");
        TABELA = aux;
        return true;
    }else{
        if(!possui(TABELA, item)){
            aux = new Array(TABELA.length+1);
            var i =0;
            for(i=0;i<aux.length-1;i++){
                aux[i] = TABELA[i];
            }
            aux[i] = item;
            TABELA = aux;
            return true;
        }else{
            return false;
        }
    }
}

function addItem(cod, nome, osi, tcp){
    var table = document.getElementById("lista");
    var tr = table.insertRow(1);

    var td0 = tr.insertCell(0);
    td0.innerHTML = (cod);
    
    var htm = nome+"<b><font face='Verdana' style='font-size: 6pt'>(<a href='javascript:getProtForEdit("+cod+")'>editar</a>)</font></b>";

    var td1 = tr.insertCell(1);
    td1.innerHTML =(htm);

    var td2 = tr.insertCell(2);
    td2.innerHTML =(osi);

    var td3 = tr.insertCell(3);
    td3.innerHTML =(tcp);
}

function setResposta(txt){
    clearTable();
    var a = txt.split("|");
    for(var i =0;i<a.length;i++){
        var b = a[i].split(";");
        if(b[1]!=undefined){
            if(addTable(b[1])){
                var protoc = getLinkProtocolo(b[1]);
                var cosi = getLinkCamadaOSI(b[2]);
                var ctcp = getLinkCamadaTCP(b[3]);
                addItem(b[0], protoc, cosi, ctcp);
            }
        }
    }
}

function search(){
    var txt = document.getElementById("src").value;
    if(txt.length<2){
        clearTable();
    }else{
        var metodo = "post";
        var parametro = "metodo=getProtocol&src="+txt;
        var url = "AJAX";
        MakeAJAX(metodo, url, parametro, function(){
            if (httpRequest.readyState == 4) {
                document.getElementById("imgsrc").style.display = "none";
                if (httpRequest.status == 200) {
                    var str = httpRequest.responseText;
                    if(str!=""){
                        str = decoderAJAX(str);
                        setResposta(str);
                    }else{
                        clearTable();
                    }
                }
            }else{
        //document.getElementById("imgsrc").style.display = "block";
        }
        });
    }

}
function setDesc(txt){
    document.getElementById("desc").innerHTML = txt;
}
function cleanDesc(){
    document.getElementById("desc").innerHTML = "";
}
function closeW(){
    document.getElementById("palco").style.display = "none";
}
function getDesc(protocol){
    var url = "AJAX";
    var parametro = "metodo=getPr&"+protocol;
    var metodo = "post";
    MakeAJAX(metodo, url, parametro, function(){
        if (httpRequest.readyState == 4) {
            document.getElementById("palco").style.display = "block";
            if (httpRequest.status == 200) {
                var str = httpRequest.responseText;
                if(str!=""){
                    document.getElementById("desc").style.display = "block";
                    str = decoderAJAX(str);
                    setDesc(str);
                }else{
                    cleanDesc();
                }
            }
        }
    });
}

function getLinkProtocolo(txt){
    var a = "<a href='javascript:loadProtocolo(\""+encoderAJAX(txt)+"\");'>"+txt+"</a>";
    return a;
}

function getLinkCamadaOSI(txt){
    var a = "<a href='javascript:loadCamada(\""+encoderAJAX(txt)+"\", \"Modelo OSI\");'>"+txt+"</a>";
    return a;
}
function getLinkCamadaTCP(txt){
    var a = "<a href='javascript:loadCamada(\""+encoderAJAX(txt)+"\", \"Modelo TCP\");'>"+txt+"</a>";
    return a;
}

function loadProtocolo(protocol){
    protocol = "src="+protocol;
    getDesc(protocol);
}
function loadCamada(nome, modelo){
    var parametro = "src="+encoderAJAX(nome)+"&filtro=camada&filtro2="+modelo;
    getDesc(parametro);
}