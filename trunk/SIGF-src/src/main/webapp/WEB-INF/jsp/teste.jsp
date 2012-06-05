<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="iso-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function sendData(){
		var params = $("#form1").serialize();
		alert(params);
		//alert(params);
		$.ajax({
            url : "teste.htm",
            type: "post",
            data: params,
            dataType: 'html',
            cache: false,
            contentType: 'application/x-www-form-urlencoded; charset=iso-8859-1' ,
            success : function(data) {
                try{
                	data = decodeURI(data);
                    $("#sts").html(data);
                    alert(data);
                }catch(e){
                }
        
            }
        });
	}
	 
	function tratarSubmit(event){
		alert(event);
	}
	
	function encoderAJAX(texto) {
	    encodedHtml = escape(texto);
	    encodedHtml = encodedHtml.replace(/\//g,"%2F");
	    encodedHtml = encodedHtml.replace(/\?/g,"%3F");
	    encodedHtml = encodedHtml.replace(/=/g,"%3D");
	    encodedHtml = encodedHtml.replace(/&/g,"%26");
	    encodedHtml = encodedHtml.replace(/@/g,"%40");
	    return encodedHtml;
	}
</script>
<title>Insert title here</title>
</head>
<body>
<p id="sts">&nbsp;</p>
<form name="form1" id="form1" method="POST" onsubmit="tratarSubmit(event); return false;"> 
	<label>Nome:</label>
	<form:input path="tbl.nome" id="nome"/>
	<br />
	<input type="submit" value="Enviar" />
	<a href="javascript:sendData();">Send</a>
</form>
</body>
</html>