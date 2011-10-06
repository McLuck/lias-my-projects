<%@include file="include.jsp"%>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Praca</title>

<link rel="stylesheet" href="<%=pathCSS%>support.css">
<script type="text/javascript" src="<%=pathJS%>praca_geral.js"></script>
<title>Praca</title>
<script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
<link rel="stylesheet" href="<%=pathCSS%>support.css">
<script type="text/javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.3.js"></script>

<script type="text/javascript">
            var alterado = false;
            var serviceSave = null;
            function stopService(){
                if(serviceSave!=null){
                    try{
                        clearInterval(serviceSave);
                    }catch(e){}
                }
            }
            function startService(){
                //Servico de salvar sera executado a cada 5 segundos
                //Mas so ira continuar se houver alteracao. Caso nao haja, o servico aguarda novamente.
                serviceSave = setInterval("autoSave()", 5000);
            }
            function changer(elem, evento){
                alterado = true;
                //Efetuar validacoes necessarias para o elemento (elem)

                //validacao para aceitar apenas numero
                if(elem.getAttribute("id") == "trafegoEstimado"){
                    return IsNum(evento);
                }
            }

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
         
            function autoSave(){
                if(!alterado){
                    $("#msg_status").html("&nbsp;");
                    return;
                }
                try{
                    alterado = false;
                    var params = $('#form_dados_praca').serialize();
                    
                    try{
                    	dadosPraca_DisableAll();
                    }catch(ex){}

                    var dataType = "html";

                    //Salva
                    $.ajax({
                        url : "verPraca.htm?cid=${cid}",
                        type: "post",
                        data: params,
                        dataType: dataType,
                        cache: false,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                            try{
                                data = data.replace(" ", "");
                                data = data.replace("\n", "");
                                $("#msg_status").html("Salvo!");
                                $("#prcid").val(data);
                                var id = $("#prcid").val();
                                loadPista(id);
                            }catch(e){
                                if(data!="ok"){
                                    $("#msg_status").html(data);
                                }else{
                                    $("#msg_status").html("Salvo em "+new Date());
                                    var id = $("#prcid").val();
                                    loadPista(id);
                                }    
                            }
                    
                        }
                    });

                }catch(e){
                    dadosPraca_EnableAll();
                } finally {
                    dadosPraca_EnableAll();
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

            function removePraca(id){
                if(window.confirm("Tem certeza que deseja apagar esta Praça?")){
                    var params = "cmd=removePraca&pracaid="+id;
                    $.ajax({
                        url : "listar_pracas.htm?cid=${cid}",
                        type: "post",
                        data: params,
                        cache: false,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                            $("#menu").html(data);
                        }
                    });
                }
            }
            
            $(document).ready(function() {
                loadPracas();
                //$("#nome").mask("aa, aaa******************************************");
                //$("#cnpj").mask("99.999.999/9999-99");
            });
          
            function loadPracas(){
                
                var params = "cmd=getPracasSession";
                $.ajax({
                    url : "listar_pracas.htm?cid=${cid}",
                    type: "post",
                    data: params,
                    cache: false,
                    contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                    success : function(data) {
                        $("#menu").html(data);
                    }
                });
            }
            var visivel = true;
            
            function showAndHidePracas(){
            	$("#form_praca").hide("fast");
                $("#pistas_frame").hide("fast");
            }
            
            function loadPraca(id){
                stopService();
                if(id!=0){
                    $.ajax({
                        url : "verPraca.htm?pracaid="+id+"&cid=${cid}",
                        type: "get",
                        cache: false,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                            showAndHidePracas();
                            //
                            loadPista(id);
                            $("#form_praca").show("fast");
                            $("#form_praca").html(data);
                            startService();
                            //Previne o submit normal do form
                            $("#form_dados_praca").submit(function(event) {
                                //stop form from submitting normally /
                                autoSave();
                                $("#msg_status").html("Dados Salvo!");
                                event.preventDefault();
                            });
                        }
                    });
                }else{
                    $.ajax({
                        url : "verPraca.htm?cid=${cid}&nowAgora="+ new Date().getTime(),
                        type: "get",
                        cache: false,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                            showAndHidePracas();
                            //
                            loadPista(id);
                            $("#form_praca").show("fast");
                            $("#pistas_frame").show("fast");
                            $("#form_praca").html(data);
                            startService();
                        }
                    });
                }
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
            function loadPista(id){
                if(id!=0){
                    var url = "verPista.htm?pracaid="+id+"&cid=${cid}";
                    var ifr = '<iframe src="'+url+'" style="border:none;" height="700px"  width="1000px" frameborder="0" name="ifrm2">';
                    ifr += "Seu navegador não suporta quadros. Use o Google Chrome!</iframe>";

                    $("#pistas_frame").html(ifr);
                  
                    
                    $("#pistas_frame").show("fast");
                }
            }
            /* function loadPista(id){
            	if(id!=0){
            		var url = "verPista.htm?pracaid="+id+"&cid=${cid}";
            		$.ajax({
                        url : url,
                        type: "get",
                        cache: false,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                        	$("#pistas_frame").html("");
                        	var div = document.createElement("div");
                            div.innerHTML = data;
                            document.getElementById("pistas_frame").appendChild(div);
                        }
                    });
            	}
            } */
            function closePraca(){
                autoSave();
                $("#pistas_frame").html("");
                $("#form_praca").html("");
                showAndHidePracas();
            }
        </script>
</head>
<body>
	<input type="hidden" value="${cid}" name="cidd" id="cidd" />
	<div id="menu" style="float: left; width: 300px;"></div>
	<div id="form_praca"
		style="float: left; margin-left: 8px; width: 600px;"></div>

	<div id="pistas_frame" style="clear: both; width: 900px;"></div>
</body>
</html>
