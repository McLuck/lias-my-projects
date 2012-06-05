<%@include file="../include.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Praca</title>
        <script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
        <link rel="stylesheet" href="<%=pathCSS%>support.css">

    </head>
    <body>
        
            <p style="color: red;" id="msg_status_bd">
                &nbsp;
            </p>
            <form action="" method="POST" id="form_server_bd" name="form_dados_praca">
                <fieldset>
                    <legend>Qual será o SGBD utilizado?</legend>
                    <form:hidden path="sgbd.id" />
                    <form:radiobutton path="sgbd.bd" onclick="opc_sgbd_so();" id="sgbd_o10" value="1" label="Oracle 10G" />
                    <br /> 
                    <form:radiobutton path="sgbd.bd" onclick="opc_sgbd_so()" id="sgbd_o11" value="2" label="Oracle 11G" />
                    <br /> 
                    <form:radiobutton path="sgbd.bd" onclick="opc_sgbd_so()" id="sgbd_ms" value="3" label="Microsoft SQL Server" />
                    <br /><br /><br />

                    <fieldset>
                        <legend>Sistema Operacional da Instalação</legend>

                        <div style="width: 50%; float: left;">

                            <form:radiobutton path="sgbd.os" onclick="opc_so_sgbd()" id="sgbd_so_w03" value="1" label="Windows Server 2003" />
                            <br /> 
                            <form:radiobutton path="sgbd.os" onclick="opc_so_sgbd()" id="sgbd_so_w08" value="2" label="Windows Server 2008 RC" />
                            <br />
                            <form:radiobutton path="sgbd.os" onclick="opc_so_sgbd()" id="sgbd_so_lnx" value="3" label="Linux" />

                            <br /> 
                            <form:input path="sgbd.linuxDetalhe" id="sgbd_so_linux_name" />

                            <br />

                            <form:radiobutton path="sgbd.os" onclick="opc_sgbd_so()" id="sgbd_so" value="4" label="Outro" />
                            <br /> 
                            <form:input path="sgbd.osDetalhe" id="sgbd_so_name" />


                        </div>
                        <div style="width: 50%; float: left;">

                            Versão: <br /> 
                            <form:select path="sgbd.versao" id="versao_so" >
                                <c:forEach items="${versoes}" var="v">
                                    <form:option value="${v.value}" label="${v.label}" />
                                </c:forEach>
                            </form:select>
                            <br /> 

                            Edição: <br /> 
                            <form:select path="sgbd.edicao" id="edicao_so" >
                                <c:forEach items="${edicoes}" var="ed">
                                    <form:option value="${ed.value}" label="${ed.label}" />
                                </c:forEach>
                            </form:select>
                            <br /> 
                            Idioma: <br /> 
                            <form:select path="sgbd.idioma" id="idioma_so" >
                                <c:forEach items="${idiomas}" var="ed">
                                    <form:option value="${ed.value}" label="${ed.label}" />
                                </c:forEach>
                            </form:select>
                            <br />
                        </div>

                    </fieldset>

                </fieldset>
            </form>

    </body>
</html>
