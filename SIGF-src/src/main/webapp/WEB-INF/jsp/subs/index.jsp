<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Praças</title>
<jsp:include page="../jsdefault.jsp" flush="true" />
<script type="text/javascript">
	function apagarPracasSelecionadas(){
		var ids = "";
		$("#fomrListPracas").find("input[type=checkbox]").each(function(key, value){
			console.log($(this).attr("id"));
			console.log($(this).attr("value"));
			console.log("---");
			if($(this).is(':checked')){
				ids += $(this).attr("value")+",";
			}
		});
		if(ids==""){
			$().toastmessage('showErrorToast', "Nenhuma praça selecionada!");
			return;
		}
		var url = "gerenciarPracasCompleta.htm"
		var params = "cmd=apagarPracas&ids="+ids;
		$.ajax({
			url : url,
			data : params,
			type : "post",
			cache : false,
			dataType : "html",
			contentType : 'application/x-www-form-urlencoded; charset=ISO-8859-1',
			success : function(data) {
				$("#tableListaPracas tbody tr").each(function(key, value){
					$().toastmessage('showSuccessToast', "Praças apagadas com sucesso!");
				});	
			}
		});
	}
	
	function editarPracaSelecionada(){
		var boxes = $("#fomrListPracas").find("input[type=checkbox]");
		if(boxes.length==0){
			$().toastmessage('showErrorToast', "Nenhuma praça selecionada!");
		}else if(boxes.length!=1){
			$().toastmessage('showErrorToast', "Apenas uma praça deve ser selecionada para esta operação!");
		}else{
			var praca = boxes[0];
			//TODO abrir edicao da praca
			var url = "gerenciarPracasCompleta.htm?"
			var params = "cmd=loadPraca&pracaid="+$(praca).attr("value");
			url += params;
			
			var iframe = "<iframe id='iframe_praca_edicao' name='iframe_praca_edicao' src = "+url+">Navegador sem suporte a iframe. Habilite este recurso, por favor</iframe>";
			$("#painelEdicaoPraca").html(iframe);
			$("#painelEdicaoPraca").dialog({ title: "Editando Praça", minWidth: 1000, minHeight:800 });
		}
	}
	
	function getCid(){
		return $("#cid").val();
	}
</script>
</head>
<body>
<input type="hidden" id="cid" name="cid" value="${cid}" />
<div id="painel">
	<a href="#">Nova</a> | <a href="#">Editar</a> | <a href="#" onclick="apagarPracasSelecionadas();">Apagar</a>
</div>
<form action="#" name="fomrListPracas" id="fomrListPracas">
<table id="tableListaPracas">
	<thead>
		<tr>
			<th colspan="2">Praças</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pracas}" var="pc">
			 <tr id="trpracaid_${pc.id}">
			 	<td style="width: 20px;">
			 		<input style="margin-bottom:0px;margin-top: 1px; width: 20px;" type="checkbox" name="selecionadas" id="selecionadas_${pc.id}" value="${pc.id}" />
			 	</td>
			 	<td>${pc.nome}</td>			 	
			 </tr>
	    </c:forEach>	
	</tbody>
</table>
</form>

<div id="painelEdicaoPraca">
</div>
</body>
</html>