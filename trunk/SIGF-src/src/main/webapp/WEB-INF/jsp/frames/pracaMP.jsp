<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <p style="text-align: center;">
            Configuração de praça para o Meio de Pagamento "${mp.nome}"
        </p>
        <form action="#" method="POST" name="formPracaMeioPGTO" id="formPracaMeioPGTO">
            <table>
                <thead>
                    <tr>
                        <th>
                            Habilita
                        </th>
                        <th>
                            Praça
                        </th>
                        <th>
                            Código Praça Local
                        </th>
                    </tr>
                </thead>

                <input type="hidden" name="id" id="id" value="${mp.id}" />
                <input type="hidden" name="cid" id="cid" value="${cid}" />
                <c:forEach items="${pracas}" var="pv">
                    <tr>
                        <td>
                            <input type="checkbox" onclick="clickPMP(${pv.praca.id});"  style="width: 20px;" onchange="clickPMP(${pv.praca.id});" id="ativo_${pv.praca.id}" name="ativo_${pv.praca.id}" <c:if test="${pv.ativo}">checked="true"</c:if> />
                        </td>
                        <td>
                            ${pv.praca.nome}
                        </td>
                        <td>
                            <input type="text" value="${pv.codPracaLocal}" name="codLocal_${pv.praca.id}" id="codLocal_${pv.praca.id}" <c:if test="${pv.ativo==false}">disabled="true"</c:if> />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <button value="Salvar" onclick="savePracaMP()">Salvar</button>
    </body>
</html>
