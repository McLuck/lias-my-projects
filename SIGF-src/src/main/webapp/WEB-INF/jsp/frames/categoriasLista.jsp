<%@include file="../include.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
        	var idtempCat = null;
        	function clickOpenTR(id){
        		if(idtempCat!=null){
        			try{
        				fecharTRdeEdicao(idtempCat);
        			}catch(e){}
        		}
        		idtempCat = id;
        		$("#categoria_table_content_" + id).hide();
        		document.getElementById("categoria_edit_content_"+id).style.display = "table-row";
        	}
        	
        	function fecharTRdeEdicao(id){
        		$("#categoria_edit_content_"+id).hide();
        		document.getElementById("categoria_table_content_" + id).style.display = "table-row";
        		idtempCat = null;
        	}
        </script>
    </head>
    <body>
        <table width="100%" class="display" style="text-align: center;">
            <thead>
                <tr>
                    <th rowspan="2">
								Código
                    </th>
                    <th rowspan="2" style="width: 180px;">
								Descrição
                    </th>
                    <th colspan="4" align="center" style="text-align: center;">
								Perfil do Eixo
                    </th>
                    <th rowspan="2">
								Tipo
                    </th>
                    <th rowspan="2">
								Modelo
                    </th>
                    <th rowspan="2">
								CGMP
                    </th>
                    <th rowspan="2">
								Habilita Classificação
                    </th>
                    <th rowspan="2">
                        Ordem
                    </th>
                    <th rowspan="2" style="width: 200px;">

                    </th>
                </tr>
                <tr>
                    <th>EF</th>
                    <th>RD</th>
                    <th>AV</th>
                    <th>RM</th>
                </tr>
            </thead>
            <% int i=0; %>
            <c:forEach items="${categorias}" var="ct">
				<% i++; %>
                <tr id="categoria_edit_content_${ct.id}" style="display: none;text-align: center;"
                <%
                	out.print((i%2==0)?"class='even'":"class='odd'");
                %>
                >
                <form onsubmit="return false;" action="" name="form_categ${ct.id}" id="form_categ${ct.id}" method="POST">
                    <td>
                        <input type=hidden name="id" style="width: 50px;" size="3" value="${ct.id}" />
                        <input type="text" name="catid" placeholder="0" style="width: 50px;" size="3" value="${ct.catid}" />
                    </td>
                    <td style="width: 180px;">
                        <input type="text" style="width: 175px;" placeholder="Cat XX" name="descricao" value="${ct.descricao}" />
                    </td>
                    <td>
                        <input type="text" style="width: 20px;" placeholder="2" name="ef" size="2" value="${ct.ef}" />
                    </td>
                    <td>
                        <input type="text" name="rd" style="width: 20px;" placeholder="0" size="2" value="${ct.rd}" />
                    </td>
                    <td>
                        <input type="text" style="width: 20px;" placeholder="0" name="av" size="2" value="${ct.av}" />
                    </td>
                    <td>
                        <input type="text" style="width: 20px;" placeholder="0" name="rm" size="2" value="${ct.rm}" />
                    </td>
                    <td>
                        <select name="tipo" style="width: 100px;">
                            <c:forEach items="${tiposCat}" var="tc">
                                <option value="${tc.id}" <c:if test="${ct.tipo==tc.id}">selected="selected"</c:if> >${tc.nome}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="text" style="width: 50px;" placeholder="0" name="modelo" size="10" value="${ct.modelo}" />
                    </td>
                    <td>
                        <input type="text" name="cgmp" style="width: 50px;" placeholder="X" size="2" value="${ct.cgmp}" />
                    </td>
                    <td>
                        <input type="checkbox" style="width: 10px;" name="habilitada" <c:if test="${ct.habilitada}">checked="true"</c:if> />
                    </td>
                    <td>
                        <input type="text" name="ordem" placeholder="00" style="width: 50px;" size="2" value="${ct.ordem}" />
                    </td>
                    <td>
                        
                        <img alt="Cancelar Edição" title="Cancelar Edição" src="images/cancelar1.png" width="15px" height="15px" border="0px" onclick="fecharTRdeEdicao(${ct.id});" />
                        <img alt="Salvar" title="Salvar" src="images/save.png" width="15px" height="15px" border="0px" onclick="saveCATEG(${ct.id}, ${cid});" />
                        <img alt="Apagar" title="Apagar" src="images/remove.png" width="15px" height="15px" border="0px" onclick="deleteCategoriaFN(${ct.id}, ${cid})" />
                    </td>
                </form>
            </tr>    


            <tr onclick="clickOpenTR(${ct.id});" id="categoria_table_content_${ct.id}" style="text-align: center;" <%
                	out.print((i%2==0)?"class='even'":"class='odd'");
                %>>
                <td>
                    ${ct.catid}
                </td>
                <td style="width: 180px;">
                    ${ct.descricao}
                </td>
                <td>
                    ${ct.ef}
                </td>
                <td>
                    ${ct.rd}
                </td>
                <td>
                    ${ct.av}
                </td>
                <td>
                    ${ct.rm}
                </td>
                <td>
                    ${ct.tipoStr}
                </td>
                <td>
                    ${ct.modelo}
                </td>
                <td>
                    ${ct.cgmp}
                </td>
                <td>
                    ${ct.habilitaStr}
                </td>
                <td>
                    ${ct.ordem}
                </td>
                <td>

                </td>
            </tr>


        </c:forEach>


        <tr id="categoria_edit_content_new" style="text-align: center;">
        <form onsubmit="return false;" action="" name="form_categnew" id="form_categnew" method="POST">
            <td>
            	<form:hidden path="cat.id"/>
                <form:input path="cat.catid" placeholder="0" cssStyle="width: 50px;" size="3" />
            </td>
            <td style="width: 180px;">
                <form:input path="cat.descricao" placeholder="Cat XX" cssStyle="width: 175px;" />
            </td>
            <td>
                <form:input path="cat.ef" size="2" placeholder="2" cssStyle="width: 20px;" />
            </td>
            <td>
                <form:input path="cat.rd" size="2" placeholder="1" cssStyle="width: 20px;"/>
            </td>
            <td>
                <form:input path="cat.av" size="2" placeholder="0" cssStyle="width: 20px;"/>
            </td>
            <td>
                <form:input path="cat.rm" size="2" placeholder="0" cssStyle="width: 20px;"/>
            </td>
            <td>
                <form:select path="cat.tipo" cssStyle="width: 100px;">
                    <c:forEach items="${tiposCat}" var="tc">
                        <form:option value="${tc.id}" label="${tc.nome}" />
                    </c:forEach>
                </form:select>
            </td>
            <td>
                <form:input path="cat.modelo" size="10" placeholder="0"  cssStyle="width: 50px;"/>
            </td>
            <td>
                <form:input path="cat.cgmp" placeholder="X" size="2" cssStyle="width: 50px;"/>
            </td>
            <td>
                <form:checkbox path="cat.habilitada" cssStyle="width: 10px;" />
            </td>
            <td>
                <form:input path="cat.ordem" placeholder="00" size="2" cssStyle="width: 50px;" />
            </td>
            <td>
            	<input type="image" style="width: 30px; height: 30px;" alt="Salvar" title="Salvar" src="images/check.png" onclick="saveCATEG('new');"/>
                <!-- <button onclick="saveCATEG('new');" value="Salvar">Salvar</button> -->
            </td>
        </form>
    </tr>
</table>
</body>
</html>
