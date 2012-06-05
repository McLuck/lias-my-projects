<%@include file="include.jsp" %>

<html lang="pt-br">
    <head>
        <title>Praças</title>
        <script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
        <link rel="stylesheet" href="<%=pathCSS%>support.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        
    </head>
    <body onload="loadPraca(0);">
        <div>
            <input type="hidden" value="${cid}" name="cidd" id="cidd" />
            <div style="float: left; height: 260px; overflow: auto; width: 300px;" id="menu_pracas_">
                <fieldset>
                    <legend>Praças</legend>
                    <img src="images/addicon.png" onclick="loadPraca(0);" id="img_icon_add" style="float: left;" width="10px" height="10px" alt="add" title="add" border="0px" />
                    <table id="menu_pracas" style="clear: both; border: 0px;">
                        <c:forEach items="${pracas}" var="pc">
                        	<c:if test="${pc!=null}">
	                        	<tr id="tr__${pc.id}" onclick="mouseClick(this);" onmouseover="mouseOn(this);" onmouseout="mouseOut(this);">
	                                <td onclick="loadPraca(${pc.id});" style="margin-bottom: 5px; border-bottom: 1px solid #0073BF;">${pc.description}</td>
	                                <%-- <td style="margin-bottom: 5px; border-bottom: 1px solid #0073BF;">
	                                    <img onclick="removePraca(${pc.id});" src="images/remove.png" id="remove_icon" width="20px" alt="Remover" border="0px" title="Remover" height="20px" />
	                                </td> --%>
	                            </tr>
                        	</c:if>
                        </c:forEach>
                    </table>
                </fieldset>
            </div>
        </div>
    </body>
</html>