<%-- 
    Document   : header
    Created on : 05/02/2012, 21:39:30
    Author     : McLuck
--%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="content-language" content="pt-br">
    <title>Loja Virtual 
        <%
            if (request.getParameter("get") == null) {
                out.print(" - Home");
            } else {
                out.println(" - ");
        %>
        <%=request.getParameter("get")%>
        <% }// %>
    </title>

    <script src="js/jquery-1.6.2.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/additional-methods.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/messages_ptbr.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/methods_pt.js" type="text/javascript" charset="utf-8"></script>
    <%@include file="jsFunction.jsp" %>
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/estilo.css" type="text/css" media="all" charset="utf-8" />
</head>