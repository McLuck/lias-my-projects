<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <fieldset>
            <legend>Antena Pista AVI</legend>
            <table>
                <thead>
                    <tr>
                        <th>Fabricante</th>
                        <th>Modelo</th>
                        <th>Interface de Acesso</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <c:forEach items="${antenas}" var="at">
                    <tr>
                        <td>
                            ${at.fabricante}
                        </td>
                        <td>
                            ${at.modelo}
                        </td>
                        <td>
                            ${at.interfaceStr}
                        </td>
                        <td>

                        </td>
                    </tr>
                </c:forEach>
                <form action="" method="post" onsubmit="return false;" id="form_antena_confPraca">
                    <input type="hidden" name="pracaid" value="${pracaid}" />
                    <tr>
                        <td>
                            <form:input path="atn.fabricante" />
                        </td>
                        <td>
                            <form:input path="atn.modelo" />
                        </td>
                        <td>
                            <form:select path="atn.interfaceAcesso">
                                <form:option value="1" label="Serial" />
                                <form:option value="2" label="USB" />
                            </form:select>
                        </td>
                        <td>
                            <img src="images/save.png" onclick="saveAntenaPista();" title="Salvar" alt="Salvar" width="15px" height="15px" style="border: 0px" />
                        </td>
                    </tr>
                </form>
            </table>
        </fieldset>
    </body>
</html>
