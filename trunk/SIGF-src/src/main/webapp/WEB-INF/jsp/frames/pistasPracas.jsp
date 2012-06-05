<%@include file="../include.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Praca</title>
        <script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
        <link rel="stylesheet" href="<%=pathCSS%>support.css">
        
        <script type="text/javascript" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/jquery.jeditable.js"></script>
		
		<style type="text/css" title="currentStyle">
			@import "css/demo_page.css";
			@import "css/demo_table.css";
		</style>
        <script type="text/javascript" src="<%=pathJS%>pistaPraca.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                //Carrega tabela
                loadTable(${pracaid});
            });

            function deletePistaFN(id){
                if(window.confirm("Tem certeza que deseja apagar esta pista?")){
                    var params = "cmd=delete&idp="+id+"&pracaid=${pracaid}";
                    $.ajax({
                        url : "listaPista.htm",
                        type: "post",
                        data: params,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                            if(data!="ok"){
                                $("#msg_status").html(data);
                            }else{
                                $("#msg_status").html("Item apagado!");
                                loadTable(${pracaid});
                            }
                        }
                    });
                }
            }

            function Save(id){
            	
                try{
                    var error = false;
                    var msg = "Os seguintes itens são obrigatórios: <br/>";
                    if($("#idLocalizacao_input"+id).val()==""){
                        $("#idLocalizacao_input"+id).val("0");
                    }
                    //nomeMaquina
                    if($("#nomeMaquina"+id).val()==""){
                        error = true;
                        msg += "- Nome da máquina deve ser preenchido;<br/>";
                    }else{
                        if($("#nomeMaquina"+id).val().length < 3){
                            error = true;
                            msg += "- Nome da máquina deve possuir no mínimo 3 caracteres;<br/>";
                        }
                    }
                    if($("#ipMaquina"+id).val()==""){
                        error = true;
                        msg += "- IP da máquina deve ser preenchido;<br/>";
                    }else{
                        if($("#ipMaquina"+id).val().length < 7){
                            error = true;
                            msg += "- IP da máquina deve possuir no mínimo 7 caracteres;<br/>";
                        }else if($("#ipMaquina"+id).val().indexOf(".") == -1){
                            error = true;
                            msg += "- IP da máquina não é válido;<br/>";
                        }
                    }
                    if(error){
                        $("#msg_status").html(msg);
                        return;
                    }

                }catch(e){
                    $("#msg_status").html("Erro na validação dos dados." + e);
                    return;
                }
                try{
                    var params = $('#form_pista'+id).serialize();
                    try{
                		tb_remove();
                	}catch(e){}
                    var dataType = "html";

                    //Salva
                    $.ajax({
                        url : "verPista.htm",
                        type: "post",
                        data: params,
                        dataType: dataType,
                        contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                        success : function(data) {
                            if(data!="ok"){
                                $("#msg_status").html(data);
                            }else{
                            	var url = "verPista.htm?pracaid=${pracaid}&cid=${cid}";
                            	window.location.href = url;
                            }
                        }
                    });

                }catch(e){
                    
                }
            }
            
            function runScript(idps, e) {
                if (e.keyCode == 13) {
                	Save(idps);
                    //return false;
                }else if(e.keyCode == 46){
                	deletePistaFN(idps);
                }else if(e.keyCode == 27){
                	CancelEdit(idps);
                }
            }
        </script>
	
    </head>
    <body>
   
        <div id="screen_dados_pista">
            <!-- button onclick="loadTable(${pracaid});" value="Atualizar">Atualizar</button-->
            <p align="center" style="color: red;" id="msg_status"> &nbsp; </p>

            <div id="table_content_pista" style="height: 300px;">

            </div>
        </div>
    </body>
</html>