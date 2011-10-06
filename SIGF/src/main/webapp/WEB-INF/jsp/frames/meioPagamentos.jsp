<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
        function loadPracaMP(mid, cid){
            if(document.getElementById("ch_meio_habilitado"+mid).checked==false){
                alert("Meio de pagamento esta desabilitado.\nHabilite-o antes de agregar uma praca.");
                return;
            }
            if(document.getElementById("tr_mp_"+mid).style.display != "none"){
                $("#tr_mp_"+mid).hide("fast");
                return;
            }
            $("#div_mp_"+mid).html("<p>Aguarde, por favor...</p>");
            var idmuda = "tr_mp_"+mid;
            document.getElementById(idmuda).style.display="block";
            //$("#tr_mp_"+mid).show("fast");
            $.ajax({
                url : "formConfigMP.htm?cmd=loadConfigMPPRACA&id="+mid+"&cid="+cid,
                type: "get",
                contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
                success : function(data) {
                    $("#div_mp_"+mid).html(data);
                    if(document.getElementById("div_mp_"+mid).style.display == "none"){
                        $("#tr_mp_"+mid).show("fast");
                    }
                }
            });
        }
        </script>
    </head>
    <body>
            <p id="msg_status_mps" style="color: red;">

            </p>
            <form action="" method="POST" id="form_mps_utilizados" onsubmit="return false;" name="form_mps_utilizados">
                <table width="100%">
                    <thead>
                        <tr>
                            <th>Utiliza?</th>
                            <th>Meio de Pagamento</th>
                            <th>Configuração</th>
                            <th colspan="2">Observação</th>
                        </tr>
                    </thead>
                    <c:forEach items="${mps}" var="m">
                        <tr>
                            <td>
                                <input onclick="showConfigMp(${m.id}, ${m.equipOrContato});"
                                       <c:if test="${m.habilitado}">checked="true"</c:if>
                                       type="checkbox" class="SpecialCaseForLabel" name="habilitado${m.id}" id="ch_meio_habilitado${m.id}" />
                                 <img src="images/settings_icon2.jpg" alt="Configurar Praças para este Meio de Pagamento" title="Configurar Praças para este Meio de Pagamento" onclick="loadPracaMP(${m.id}, ${cid});" height="10" width="10" style="border:0px;" id="img_cfg_${m.id}" />
                            </td>
                            <td>
                                ${m.nome}	
                            </td>
                            <td>${m.configuracao}</td>
                            <td>
                                <textarea rows="1" cols="10" name="obs${m.id}">${m.obs}</textarea>
                            </td>
                            <td>
                                <c:if test="${m.equipOrContato}">
                                    <div id="layer_config_button${m.id}" 
                                         <c:if test="${!m.habilitado}">style="display: none;"</c:if>
                                             >
                                             <button onclick="clickConfigMP(${m.id}, ${m.configEquipamento}, ${m.configContato});">Config</button>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                        <tr style="display: none;" id="tr_mp_${m.id}">
                            <td colspan="6">
                                <div id="div_mp_${m.id}" style="border: solid 1px #C6E5F9;">
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
    </body>
</html>
