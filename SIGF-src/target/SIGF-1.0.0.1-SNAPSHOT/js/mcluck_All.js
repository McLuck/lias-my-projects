/*
 * Documento criado por McLuck
 * @author: McLuck
 *
 */

function CampoMoeda(){
    //Campo MOEDA//
    //Uso
    //<input onclick="campoMoeda.onClick(this);" onmouseup="campoMoeda.onMouseUp(this);" onkeydown="campoMoeda.onKeyDown(this, event);" value="0.00" style="text-align: right;" type="text" name="valor" id="value" >

    this.onClick = function( campo ){
        this.posicionarPonteiro(campo);
    }
    this.formatarValor = function( campo ){
        campo.value = campo.value.replace('.', '');
        campo.value = campo.value.replace(',', '');
        switch( campo.value.length ){
            case 0 :
                campo.value = '0,00';
                break;
            case 1 :
                campo.value = '0,0' + campo.value;
                break
            case 2  :
                campo.value = '0,' + campo.value;
                break;
            default:
                // remover 0 a esquerda
                while( campo.value.length > 3 && campo.value.substring(0,1) == '0' ){
                    campo.value = campo.value.substring(1, campo.value.length );
                }

                campo.value =
                campo.value.substring(0, campo.value.length-2 ) +
                ',' +
                campo.value.substring(campo.value.length-2, campo.value.length )
                break;
        }
    }

    this.getAsc = function( keyCode ){
        var chr = '';
        switch(keyCode) {
            case 48: case 96: // 0 and numpad 0
                chr = '0';
                break;
            case 49: case 97: // 1 and numpad 1
                chr = '1';
                break;
            case 50: case 98: // 2 and numpad 2
                chr = '2';
                break;
            case 51: case 99: // 3 and numpad 3
                chr = '3';
                break;
            case 52: case 100: // 4 and numpad 4
                chr = '4';
                break;
            case 53: case 101: // 5 and numpad 5
                chr = '5';
                break;
            case 54: case 102: // 6 and numpad 6
                chr = '6';
                break;
            case 55: case 103: // 7 and numpad 7
                chr = '7';
                break;
            case 56: case 104: // 8 and numpad 8
                chr = '8';
                break;
            case 57: case 105: // 9 and numpad 9
                chr = '9';
                break;
        }
        return chr;
    }

    this.onMouseUp = function( campo ){
        this.posicionarPonteiro(campo);
    }

    this.onKeyDown = function( campo, event ){

        var keyCode = event.which || event.keyCode;
        switch( keyCode ){
            case 27:
                campo.value = '0,00';
                this.cancelarEvento(event);
                break;
            case 36: // Home
            case 35: // End
            case 37: // Left
            case 38: // Up
            case 39: // Right
            case 40: // Down
                this.cancelarEvento(event);
                this.posicionarPonteiro( campo );
                break;

            case 8 :  // backspace
            case 46 :  // delete
                this.retirarNumero(campo);
                this.formatarValor( campo );
                this.cancelarEvento(event);
                this.posicionarPonteiro( campo );
                break;
            case 48: case 96: // 0 and numpad 0
            case 49: case 97: // 1 and numpad 1
            case 50: case 98: // 2 and numpad 2
            case 51: case 99: // 3 and numpad 3
            case 52: case 100: // 4 and numpad 4
            case 53: case 101: // 5 and numpad 5
            case 54: case 102: // 6 and numpad 6
            case 55: case 103: // 7 and numpad 7
            case 56: case 104: // 8 and numpad 8
            case 57: case 105: // 9 and numpad 9
                campo.value = campo.value + this.getAsc( keyCode );
                this.formatarValor( campo );
                this.cancelarEvento(event);
                this.posicionarPonteiro( campo );
                break;
            default:
                this.cancelarEvento(event);
                this.posicionarPonteiro(campo);
        }
    }

    this.posicionarPonteiro = function( campo ){
        var r = campo.createTextRange();
        r.collapse();
        r.moveStart("character", campo.value.length);
        r.moveEnd("character", campo.value.length);
        r.select();
    }

    this.retirarNumero = function( campo ){
        campo.value = campo.value.substring(0, (campo.value.length - 1));
    }

    this.cancelarEvento = function( event ){
        if (event.stopPropagation)
            event.stopPropagation();
        else
            event.cancelBubble = true;

        if (event.preventDefault)
            event.preventDefault();
        else
            event.returnValue = false;
    }
}
var campoMoeda = new CampoMoeda();




//------------------------------------------------------------//
/*
                                             * Exibe/Oculta Elemento passado pelo par�metro...
                                             *
                                             */
function onOff(elemento){
    var el = document.getElementById(elemento);
    if(el.style.display == 'none'){
        el.style.display = 'block';
    }else{
        el.style.display = 'none';
    }
}



/*
                                             * AJAX
                                             */

var httpRequest;


function createDocument(){
    var aVersions = [ "MSXML2.DOMDocument.5.0",
    "MSXML2.DOMDocument.4.0", "MSXML.DOMDocument.3.0",
    "MSXML2.DOMDocument", "Microsoft.XmlDom"
    ];

    for (var i=0; i<aVersions.length; i++){
        try{
            var oXmlDom = new ActiveXObject(aVersions[i]);
            return oXmlDom;
        }catch(oError){
        //Nada a fazer
        }
    }
}
function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
        // code for IE6, IE5
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}

function MakeAJAX(metodo, url, parametro ,funcao){
    httpRequest = false;
    httpRequest = GetXmlHttpObject();
    /*if (window.XMLHttpRequest) { // Mozilla, Safari, Chrome...
        httpRequest = new XMLHttpRequest();
        if(!isIE()){
            httpRequest.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { // IE
        httpRequest = createDocument();
    }*/
    if(httpRequest.overrideMimeType){
        httpRequest.overrideMimeType('text/xml');
    }
    if (!httpRequest) {
        alert('Seu navegador nao suporta AJAX. Esta pagina usa AJAX.');
    }
    httpRequest.onreadystatechange = funcao; //Esta fun��o cuidara do resto;
    if(metodo == "get"){
        httpRequest.open('GET', url, true);
        httpRequest.setRequestHeader("Cache-Control", "max-age=0,no-cache,no-store,post-check=0,pre-check=0");
        httpRequest.setRequestHeader("Expires", "Mon, 26 Jul 1997 05:00:00 GMT");
        httpRequest.setRequestHeader("Pragma", "no-cache");
        httpRequest.setRequestHeader("encoding", "ISO-8859-1");
        httpRequest.send(null);
    }else{
        httpRequest.open('POST', url, true);
        httpRequest.setRequestHeader("Cache-Control", "max-age=0,no-cache,no-store,post-check=0,pre-check=0");
        httpRequest.setRequestHeader("Expires", "Mon, 26 Jul 1997 05:00:00 GMT");
        httpRequest.setRequestHeader("encoding", "ISO-8859-1");
        httpRequest.setRequestHeader("Pragma", "no-cache");
        httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        httpRequest.send(parametro);
    }
}

 
function limpaCache(url){
    if(url.indexOf("?")>=0){
        return aurl + "&rand=" + encodeURI(Math.random() * 100000);
    }else{
        return aurl + "?randon=" + encodeURI(Math.random() * 100000);
    }
}

function MakeAJAX2(metodo, url, parametro ,funcSuccess, funcError, funcAguardo){
    httpRequest = false;
    var urlSemCacheNoMalditoIE = limpaCache(url);
    if (window.XMLHttpRequest) { // Mozilla, Safari, Chrome...
        httpRequest = new XMLHttpRequest();
        if (httpRequest.overrideMimeType) {
            httpRequest.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { // IE
        httpRequest = createDocument();
    }
    if (!httpRequest) {
        alert('Seu navegador n�o suporta AJAX. Esta p�gina usa AJAX.');
    }
    httpRequest.onreadystatechange = function(){
        if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
                funcSuccess();
            }else{
                funcError();
            }
        }else{
            funcAguardo();
        }
    };
    if(metodo == "get"){
        httpRequest.open('GET', urlSemCacheNoMalditoIE, true);
        httpRequest.setRequestHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        httpRequest.setRequestHeader("Cache-Control", "post-check=0, pre-check=0");
        httpRequest.setRequestHeader("Pragma", "no-cache");
        httpRequest.setRequestHeader("encoding", "ISO-8859-1");
        parametro = Math.ceil( Math.random() * 100000 );
        httpRequest.send(parametro);
    }else{
        httpRequest.open('POST', urlSemCacheNoMalditoIE, true);
        httpRequest.setRequestHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        httpRequest.setRequestHeader("Cache-Control", "post-check=0, pre-check=0");
        httpRequest.setRequestHeader("Pragma", "no-cache");
        httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        parametro += "&" + Math.ceil( Math.random() * 100000 );
        httpRequest.send(parametro);
    }
}

//Montar Parametro para ajax
function CriarParametro(){
    var elementos = document.getElementsByTagName("input");
    var parametro = "";
    for(i=0;i<elementos.length;i++){
        var el = elementos[i];
        parametro += el.getAttribute("name");
        parametro += "=";
        parametro += encodeURI(el.value);
        if(i!=(elementos.length-1)){
            parametro += "&";
        }
    }
    return parametro;
}



//-----------------------------------------------------------------------//
/*
                                             * Valida��es
                                             */

function isVazio(elemento){
    var el = document.getElementById(elemento);
    if(el.value == ""){
        var nome = el.getAttribute("name");
        alert("Campo "+nome+" � obrigat�rio!");
        el.focus();
    }
}

/*
                                             * uso: <input type="text" name="cpf" id="cpf" onkeypress="return(IsNum(this,event, 'myspan'))" />
                                             */
function IsNum(obj,event, nomeSpan){
    var str = obj.value;
    var msg = document.getElementById(nomeSpan);
    var Tecla = event.which;
    if(Tecla == null){
        Tecla = event.keyCode;
    }

    //se nao for n�mero nem parentesis ou espa�o
    if ( (Tecla < 48 || Tecla > 59)&& Tecla != 8 ){
        event.returnValue = false;
        //obj.value = str;
        //alert("Este campo s� aceita n�meros!")
        msg.innerHTML = "Este campo s� aceita n�meros";
        return false;
    }else{
        msg.innerHTML = "&nbsp;";
        event.returnValue = true;
        return true;
    }

}

function IsChar(obj,event, nomeSpan){
    var str = obj.value;
    var msg = document.getElementById(nomeSpan);
    var Tecla = event.which;
    if(Tecla == null){
        Tecla = event.keyCode;
    }

    //se nao for n�mero nem parentesis ou espa�o
    if ( (Tecla < 48 || Tecla > 59)&& Tecla != 8 ){
        event.returnValue = true;
        msg.innerHTML = "&nbsp;";
        return true;
    }else{
        event.returnValue = false;
        msg.innerHTML = "Este campo n�o aceita n�meros";
        return false;
    }
}



//----------------------------------------------------------------------//
/*
                                             * Posi��es de ELEMENTOS;
                                             *
                                             */
function pX(objeto) //Retorna posi��o X (horizontal do elemento);
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

function pY(objeto)////Retorna posi��o Y (vertical do elemento);
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

function isIE(){
    if(window.ActiveXObject){
        return true;
    }else{
        return false;
    }
}

function encoderAJAX(texto) {
    encodedHtml = escape(texto);
    encodedHtml = encodedHtml.replace(/\//g,"%2F");
    encodedHtml = encodedHtml.replace(/\?/g,"%3F");
    encodedHtml = encodedHtml.replace(/=/g,"%3D");
    encodedHtml = encodedHtml.replace(/&/g,"%26");
    encodedHtml = encodedHtml.replace(/@/g,"%40");
    return encodedHtml;
}

function decoderAJAX(texto){
    var t = unescape(texto);
    t = t.replace (/\+/g, " ");
    return t;
}

function getDataFormatada(){
    var url = "AJAX";
    var parametro = "metodo=getDataFormatada&agora="+new Date().getTime();
    var metodo = "post";
    MakeAJAX(metodo, url, parametro, function(){
        if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
                var str = httpRequest.responseText;
                return str;
            }else{
                alert("Houve um erro no servidor!");
            }
        }
    });
}

var sugestMcLuck, conteudo;
function createSugest(campo, tagXML_ID, tagXML_Texto, tagXML_Lista, enderecoAJAX, linkSugest){
    conteudo = document.getElementById("conteudo");
    conteudo.setAttribute("onclick", "javascript:destroiSugest();");
    campo = document.getElementById(campo);
    if(campo.value == ""){
        destroiSugest();
    }else{
        destroiSugest();
        var src = encoderAJAX(campo.value);
        var parametro = new Date().getTime();
        var metodo = "post";
        var url;
        if(enderecoAJAX.indexOf("?") == -1){
            url = enderecoAJAX+"?buscar="+src;
        }else{
            url = enderecoAJAX+"&buscar="+src;
        }
        sugestMcLuck = createDIV();
        sugestMcLuck.setAttribute("id","sugestMcLuck"+campo.getAttribute("id"));
        sugestMcLuck.setAttribute("onclick","javascript:destroiSugest();");
        var largura, altura;
        largura = (campo.size * 7);
        altura = "220px";
        sugestMcLuck.setAttribute("style","position: absolute; width: "+largura+"; background-color:#F3F2F1");
        sugestMcLuck.style.position = "absolute";
        sugestMcLuck.style.width = largura+"px";
        sugestMcLuck.style.background.color = "#F3F2F1";

        var posx2 = pX(campo);
        var posy2 = pY(campo)+20;
        if(isIE()){
            sugestMcLuck.style.top = posy2+"px";
        }else{
            sugestMcLuck.style.top = posy2+"px";
        }
        sugestMcLuck.style.left = posx2+"px";
        conteudo.appendChild(sugestMcLuck);
        MakeAJAX(metodo, url, parametro ,function(){
            this.createItem = function(textosjmcluck, idsgmcluck){
                var linkSugest2 = linkSugest;
                if(linkSugest2.indexOf("#") == -1){
                    if(linkSugest2.indexOf("?") == -1){
                        linkSugest2 = linkSugest2+"?id="+idsgmcluck;
                    }else{
                        linkSugest2 = linkSugest2+"&id="+idsgmcluck;
                    }
                }else{
                    linkSugest2 = linkSugest2.replace(/\#/g,idsgmcluck);
                }

                sugestMcLuck.appendChild(createLink(linkSugest2, textosjmcluck));
                sugestMcLuck.appendChild(createBR());
            }

            if (httpRequest.readyState == 4) {
                sugestMcLuck.innerHTML = "";
                if (httpRequest.status == 200) {
                    if(isIE()){
                        var sXml = httpRequest.responseText;
                        var oXmlDom = createDocument();
                        oXmlDom.loadXML(sXml);
                        var oRoot = oXmlDom.documentElement;
                        var tamanho = oRoot.childNodes.length;
                        if(tamanho> 0){
                            if(tamanho>30){
                                sugestMcLuck.setAttribute("style","position: absolute; width: "+largura+"; height: "+altura+"; overflow: auto; background-color:#F3F2F1");
                                sugestMcLuck.style.height = altura;
                                sugestMcLuck.style.overflow = "auto";
                            }
                            for(var i = 0; i<tamanho;i++){
                                var itemIE = oRoot.childNodes[i];
                                var tagtextoIE = itemIE.getElementsByTagName(tagXML_Texto)[0];
                                var idIE = itemIE.getElementsByTagName(tagXML_ID)[0];

                                this.createItem(tagtextoIE.text, idIE.text);
                            }
                        }else{
                            destroiSugest();
                        }
                    }else{
                        var responseXML = httpRequest.responseXML;
                        var lista3 = responseXML.getElementsByTagName(tagXML_Lista)[0];
                        if (lista3.childNodes.length > 0) {
                            if(lista3.childNodes.length>30){
                                sugestMcLuck.setAttribute("style","position: absolute; width: "+largura+"; height: "+altura+"; overflow: auto; background-color:#F3F2F1");
                                sugestMcLuck.style.height = altura;
                                sugestMcLuck.style.overflow = "auto";
                            }
                            for (loop = 0; loop < lista3.childNodes.length; loop++) {
                                var item = lista3.childNodes[loop];
                                var idFF = item.getElementsByTagName(tagXML_ID)[0];
                                var tagtextoFF = item.getElementsByTagName(tagXML_Texto)[0];

                                this.createItem(tagtextoFF.childNodes[0].nodeValue, idFF.childNodes[0].nodeValue);
                            }
                        }else{
                            destroiSugest();
                        }
                    }
                }else{
                    destroiSugest();
                    alert(httpRequest.status + " - Houve um erro no servidor. Se o erro persistir, contacte o suporte tecnico!");
                }
            }

        });
    }
}
function destroiSugest(){
    if(sugestMcLuck != null){
        conteudo.removeChild(sugestMcLuck);
        sugestMcLuck = null;
    }
}

//-----------------------------------------------------------//
// Elementos
function createDIV(){
    var div = document.createElement("div");
    return div;
}

function createBR(){
    var br = document.createElement("br");
    return br;
}

function createLink(ahreflink, atextolink){
    var a = document.createElement("a");
    a.setAttribute("href", ahreflink);
    a.appendChild(document.createTextNode(atextolink));
    return a;
}



//---------------------------------------------------------------//
//Conversores

function StringToDouble(x){
    valor = 0.0;
    tam = x.length;
    xx = "";
    valors = "";
    for (i = 0; i < tam; i++) {
        xx = x.substring(i, i + 1);
        if (xx == ",") {
            xx = ".";
        }
        valors += xx;
    }
    return valors;
}

function DoubleToString(valor){
    tam = valor.length;
    cont = 0;
    xx = null;
    valors = "";
    t = false;
    v = 0;
    for (i = 0; i < tam; i++) {
        xx = valor.substring(i, i + 1);
        if (xx == ".") {
            xx = ",";
            cont = 1;
            t = true;
        }
        if (cont > 0) {
            cont++;
        }
        if(!t){
            valors += xx;
        }else{
            if(v<=2){
                v++;
                valors += xx;
            }
        }
    }
    if (cont == 3) {
        valors += "0";
    }
    return valors;
}