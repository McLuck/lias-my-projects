<%@include file="include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Relatorios</title>
    </head>
    <body>
        <form action="#" method="post" onsubmit="return false;" id="form_relatorios" name="form_relatorios">
            <table id="table_relatorios" boder="1" style="clear: both;">
                <thead>
                    <tr>
                        <th rowspan="2" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">
                            Código
                        </th>
                        <th rowspan="2" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">
                            Títuto
                        </th>
                        <th rowspan="2" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">
                            Descrição
                        </th>
                        <th rowspan="2" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">
                            Classificação
                        </th>
                        <th colspan="3" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">
                            Para Comercial
                        </th>
                        <th colspan="2" style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">
                            Para Desenvolvimento
                        </th>
                    </tr>
                    <tr>
                        <th style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">Horas Desenvolvimento</th>
                        <th style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">Horas Homologação</th>
                        <th style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">Valor Percebido</th>
                        <th style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">Comentário</th>
                        <th style="border: 1px solid;text-align: center;text-align: center; font-weight: bold;">Habilita</th>
                    </tr>
                </thead>
                <c:forEach items="${lista}" var="r">
                    <tr>
                        <td>${r.relatorio.idrelatorio}</td>
                        <td>${r.relatorio.titulo}</td>
                        <td>${r.relatorio.descricao}</td>
                        <td>${r.relatorio.classificacao}</td>
                        <td>${r.relatorio.horasDesnvolvimento}</td>
                        <td>${r.relatorio.horasHomologacao}</td>
                        <td>${r.relatorio.valorPercebido}</td>
                        <td>${r.relatorio.comentario}</td>
                        <td>
                            <input type="checkbox" class="SpecialCaseForLabel" name="utilizado${r.relatorio.id}"  onchange="clickSaveRel(${r.relatorio.id}, ${cid});" id="utilizado${r.relatorio.id}" <c:if test="${r.ativo}">checked="true"</c:if> value="true" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
