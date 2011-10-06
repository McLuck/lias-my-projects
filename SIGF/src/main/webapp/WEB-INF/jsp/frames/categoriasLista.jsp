<%@include file="../include.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <table width="100%">
            <thead>
                <tr>
                    <th rowspan="2">
								ID
                    </th>
                    <th rowspan="2">
								Descrição
                    </th>
                    <th colspan="4">
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
                    <td>EF</td>
                    <td>RD</td>
                    <td>AV</td>
                    <td>RM</td>
                </tr>
            </thead>
            <c:forEach items="${categorias}" var="ct">

                <tr id="categoria_edit_content_${ct.id}" style="display: none;">
                <form onsubmit="return false;" action="" name="form_categ${ct.id}" id="form_categ${ct.id}" method="POST">
                    <td>
                        <input type="text" name="id" style="width: 50px;" size="3" value="${ct.id}" />
                    </td>
                    <td>
                        <input type="text" style="width: 200px;" name="descricao" value="${ct.descricao}" />
                    </td>
                    <td>
                        <input type="text" style="width: 20px;" name="ef" size="2" value="${ct.ef}" />
                    </td>
                    <td>
                        <input type="text" name="rd" style="width: 20px;" size="2" value="${ct.rd}" />
                    </td>
                    <td>
                        <input type="text" style="width: 20px;" name="av" size="2" value="${ct.av}" />
                    </td>
                    <td>
                        <input type="text" style="width: 20px;" name="rm" size="2" value="${ct.rm}" />
                    </td>
                    <td>
                        <select name="tipo" style="width: 100px;">
                            <c:forEach items="${tiposCat}" var="tc">
                                <option value="${tc.id}">${tc.nome}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <input type="text" style="width: 50px;" name="modelo" size="10" value="${ct.modelo}" />
                    </td>
                    <td>
                        <input type="text" name="cgmp" style="width: 50px;" size="2" value="${ct.cgmp}" />
                    </td>
                    <td>
                        <input type="checkbox" style="width: 10px;" name="habilitada" <c:if test="${ct.habilitada}">checked="true"</c:if> />
                    </td>
                    <td>
                        <input type="text" name="ordem" style="width: 50px;" size="2" value="${ct.ordem}" />
                    </td>
                    <td>
                        
                        <img alt="Cancelar Edição" title="Cancelar Edição" src="images/back.png" width="15px" height="15px" border="0px" onclick="cancelEdit(${ct.id});" />
                        <img alt="Salvar" title="Salvar" src="images/save.png" width="15px" height="15px" border="0px" onclick="saveCATEG(${ct.id}, ${cid});" />
                        <img alt="Apagar" title="Apagar" src="images/remove.png" width="15px" height="15px" border="0px" onclick="deleteCategoriaFN(${ct.id}, ${cid})" />
                    </td>
                </form>
            </tr>    


            <tr onclick="editarCatg(${ct.id});" id="categoria_table_content_${ct.id}">
                <td>
                    ${ct.id}
                </td>
                <td>
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


        <tr id="categoria_edit_content_new">
        <form onsubmit="return false;" action="" name="form_categnew" id="form_categnew" method="POST">
            <td>
                <form:input path="cat.id" cssStyle="width: 50px;" size="3" />
            </td>
            <td>
                <form:input path="cat.descricao" cssStyle="width: 200px;" />
            </td>
            <td>
                <form:input path="cat.ef" size="2" cssStyle="width: 20px;" />
            </td>
            <td>
                <form:input path="cat.rd" size="2" cssStyle="width: 20px;"/>
            </td>
            <td>
                <form:input path="cat.av" size="2" cssStyle="width: 20px;"/>
            </td>
            <td>
                <form:input path="cat.rm" size="2" cssStyle="width: 20px;"/>
            </td>
            <td>
                <form:select path="cat.tipo" cssStyle="width: 100px;">
                    <c:forEach items="${tiposCat}" var="tc">
                        <form:option value="${tc.id}" label="${tc.nome}" />
                    </c:forEach>
                </form:select>
            </td>
            <td>
                <form:input path="cat.modelo" size="10"  cssStyle="width: 50px;"/>
            </td>
            <td>
                <form:input path="cat.cgmp" size="2" cssStyle="width: 50px;"/>
            </td>
            <td>
                <form:checkbox path="cat.habilitada" cssStyle="width: 10px;" />
            </td>
            <td>
                <form:input path="cat.ordem" size="2" cssStyle="width: 50px;" />
            </td>
            <td>
                <button onclick="saveCATEG('new');" value="Salvar">Salvar</button>
            </td>
        </form>
    </tr>
</table>
</body>
</html>
