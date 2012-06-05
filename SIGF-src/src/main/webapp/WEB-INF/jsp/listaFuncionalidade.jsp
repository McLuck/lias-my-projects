<%@include file="include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Funcionalidades</title>
    </head>
    <body>
        <form action="#" method="post" onsubmit="return false;" id="form_funcionalidades" name="form_funcionalidades">
            <table id="table_funcionalidades" border="1" style="padding: 2px;clear: both;">
                <thead>
                    <tr>
                        <th rowspan="2" style="border: 1px solid;text-align: center; font-weight: bold;">
                            Títuto
                        </th>
                        <th rowspan="2" style="border: 1px solid;text-align: center; font-weight: bold;">
                            Descrição
                        </th>
                        <th rowspan="2" style="border: 1px solid;width: 60px; text-align: center; font-weight: bold;">
                            Classificação
                        </th>
                        <th colspan="2" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold; border-right: 4px;">
                            Para Comercial
                        </th>
                        <th colspan="2" style="border: 1px solid;text-align: center;width: 30px; text-align: center; font-weight: bold;">
                            Para Desenvolvimento
                        </th>
                    </tr>
                    <tr>
                        <th style="text-align: center;border: 1px solid;text-align: center; width: 60px;">Horas Desenvolvimento</th>
                        <th style="text-align: center;border: 1px solid;text-align: center; border-right: 4px;">Horas Homologação</th>
                        <th style="text-align: center;border: 1px solid;text-align: center;">Valor percebido</th>
                        <th style="text-align: center;border: 1px solid;text-align: center;">Habilita</th>
                    </tr>
                </thead>
                <c:forEach items="${lista}" var="r">
                    <tr style="text-align: center;">
                        <td style="text-align: center;">${r.funcionalidade.titulo}</td>
                        <td style="text-align: center;">${r.funcionalidade.descricao}</td>
                        <td style="text-align: center;">${r.funcionalidade.classificacao}</td>
                        <td style="text-align: center;" width="200px">${r.funcionalidade.horasDesenvolvimento}</td>
                        <td style="text-align: center;">${r.funcionalidade.horasHomologacao}</td>
                        <td style="text-align: center;">${r.funcionalidade.valorPercebido}</td>
                        <td style="text-align: center;" width="20px">
                            <input type="checkbox" style="float: none;" class="SpecialCaseForLabel" name="utilizado${r.funcionalidade.id}" onchange="clickSave(${r.funcionalidade.id}, ${cid});" id="utilizado${r.funcionalidade.id}" <c:if test="${r.ativo}">checked="true"</c:if> value="true" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
