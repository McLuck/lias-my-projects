<%@include file="../include.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>lista</title>
    </head>
    <body>
        <table width="100%" border="0" id="tbccs" class="tbl">
            <c:forEach items="${lista}" var="c">
                <tr class="linkmenu">
                    <td>
                        <img src="images/forward.png" alt="Menu" title="Menu" border="0" width="15px" height="15px" />${c.nome} - ${c.versao}
                        <img src="images/bullet_hover.gif" alt="Opções" title="Opções" id="id${c.id}" border="0" onclick="clickMenu(${c.id});" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
