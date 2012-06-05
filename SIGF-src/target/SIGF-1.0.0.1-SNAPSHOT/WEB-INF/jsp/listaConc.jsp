<%@include file="index_1.jsp"%>
<style type="text/css">
    table{
        font-size: 15px;
        font-weight: bolder;
        text-decoration: none;
    }
</style>
<script type="text/javascript" src="<%=pathJS%>listConcessionaria.js"></script>
<body>
    <div id="myMenu1" style="display: none;">
        <ul>
            <li id="open" onclick="clickItem1();">Abrir</li>
            <li id="clone" onclick="clickItem2();">Clonar</li>
        </ul>
    </div>

    <table width="100%" border="0" id="tbccs" class="tbl">
        <c:forEach items="${ccs}" var="c">
            <tr class="linkmenu">
                <td>
                    <img src="images/forward.png" alt="Menu" title="Menu" border="0" width="15px" height="15px" /> <a href="admNavegacao.htm?cid=${c.id}">${c.nome}</a>
                    <img src="images/bullet_hover.gif" alt="Opções" title="Opções" id="id${c.id}" border="0" onclick="clickMenu(${c.id});" />
                </td>
            </tr>
        </c:forEach>
    </table>  

</body>
</html>
