<%@include file="include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Funcionalidades</title>
    </head>
    <body>
        <form action="#" method="post" onsubmit="return false;" id="form_funcionalidades" name="form_funcionalidades">
            <table id="table_funcionalidades" boder="1">
                <thead>
                    <tr>
                        <th rowspan="2">
                            Títuto
                        </th>
                        <th rowspan="2">
                            Descrição
                        </th>
                        <th rowspan="2">
                            Classificação
                        </th>
                        <th colspan="2">
                            Para Comercial
                        </th>
                        <th colspan="2">
                            Para Desenvolvimento
                        </th>
                    </tr>
                    <tr>
                        <th>Horas Desenvolvimento</th>
                        <th>Horas Homologação</th>
                        <th>Valor percebido</th>
                        <th>Habilita</th>
                    </tr>
                </thead>
                <c:forEach items="${lista}" var="r">
                    <tr>
                        <td>${r.funcionalidade.titulo}</td>
                        <td>${r.funcionalidade.descricao}</td>
                        <td>${r.funcionalidade.classificacao}</td>
                        <td>${r.funcionalidade.horasDesenvolvimento}</td>
                        <td>${r.funcionalidade.horasHomologacao}</td>
                        <td>${r.funcionalidade.valorPercebido}</td>
                        <td>
                            <input type="checkbox" name="utilizado${r.funcionalidade.id}" onchange="clickSave(${r.funcionalidade.id}, ${cid});" id="utilizado${r.funcionalidade.id}" <c:if test="${r.ativo}">checked="true"</c:if> value="true" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
