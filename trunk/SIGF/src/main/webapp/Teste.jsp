<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String cmd = request.getParameter("cmd");
    if (cmd != null) {
        if (cmd.equals("pais")) {
            String p = request.getParameter("p");
            if (p.equals("1")) {
                out.print("1,Sao Paulo;2,Rio de Janeiro;3,Amazonas;");
                return;
            } else {
                out.print("1,Nova York;");
                return;
            }
        }
    } else {

%>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    
    function seleciona(){
        var params = "cmd=pais&p="+$("#pais").val();
        var dataType = "html";
        $.ajax({
            url : "Teste.jsp",
            type: "post",
            data: params,
            dataType: dataType,
            contentType: 'application/x-www-form-urlencoded; charset=ISO-8859-1' ,
            success : function(data) {
                var str = data.split(";");
                var opt = "";
                for(var i=0;i<str.length;i++){
                    if(str[i]==null || str[i] == "" || str[i] == undefined){
                        continue;
                    }
                    var p = str[i].split(",");
                    opt += "<option value='"+p[0]+"'>"+p[1]+"</option>";
                }
                $("#uf").html(opt);
            }
        });
    }
    
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <select onclick="seleciona();" onchange="seleciona();" id="pais">
            <option value="1">Brasil</option>
            <option value="2">USA</option>
        </select>
        <br/>

        <select id="uf">
        </select>
    </body>
</html>
<%    }
%>