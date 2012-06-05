<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <style type="text/css">
        	select {
	width: 450px;
}
        </style>
    </head>
    <body>
        <div>
            <p id="msg_status_malote" style="color: red; text-align: right">

            </p>
            <form action="formMalote.htm" onsubmit="return false;" method="POST" name="formConfMalote" id="formConfMalote">


                
                    <fieldset>
                    	<legend>Configura��es do Malote</legend>
                        <label>Op��o de Cria��o do Malote</label>
                        <form:select path="mal.opcCriacaoMalote">
                            <form:option value="1" label="Malote �nico" />
                            <form:option value="2" label="Dois Malotes: Dinheiro e cheque separados de cupons" />
                            <form:option value="3" label="Tres Malotes: Dinheiro, separado de cheques, separados de cupons" />
                            <form:option value="4" label="Composi��o Livre" />
                        </form:select>
                        
                        <label>Registro de Dep�sito</label>
                        <form:select path="mal.opcRegistroDeposito" id="regDeposito_forma" onchange="opc_habilita_detalhe_arquivo(this);" onclick="opc_habilita_detalhe_arquivo(this);">
                            <form:option value="1" label="Ocorrer� automaticamente, junto com registro de envio" />
                            <form:option value="2" label="Ocorrer� ap�s o retorno banc�rio, manualmente" />
                            <form:option value="3" label="Ocorrer� ap�s o retorno banc�rio, com retorno de arquivo" />
                        </form:select>
                        
                        <div id="layer_config_formato_arquivo_ret_malote" style="display: none;">
                            <label>Detalhes do formato do arquivo:</label>
                            <form:textarea path="mal.detalheFormatoArquivo" cols="40" rows="5" />
                        </div>
						<br/>
					
                        <form:checkbox path="mal.lacreRepete" onclick="opc_lacre_malote();" label="Repetir lacre no Malote?" id="radio_repete_lacre_malote1" cssClass="SpecialCaseForLabel" cssStyle="margin-top: 5px; margin-bottom: 10px;" />
                        
                        <div id="layer_config_repeticao_lacre_malote" style="display: none;">
                            <label>Por quantos dias n�o pode se repetir?</label>
                            <form:textarea path="mal.diasSemRepetirLacre" cols="10" rows="1" cssStyle="margin-left: 20px;" />
                        </div>
                        <label style="clear: both;">Exibi��o da Interface em Malotes</label>
                        <form:select path="mal.opcExibicaoInterface">
                            <form:option value="1" label="Valor depositado" />
                            <form:option value="2" label="Valor depositado em dinheiro, em cheques e em cupons" />
                            <form:option value="3" label="Diferen�a a mais e diferen�a a menos" />
                        </form:select>
                    </fieldset>
            </form>
        </div>
    </body>
</html>
