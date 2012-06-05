<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Configurações de Acesso</title>
    </head>
    <body>
        <p id="msg_status_configAcesso" style="color: red; font-weight: bold;"></p>
        <form action="#" name="formConfirmAcesso" id="formConfirmAcesso"  onsubmit="return false;">
            <input type="hidden" id="cid" name="cid" value="${cid}" />
            <input type="hidden" id="id" name="id" value="${ca.id}" />
            <fieldset>
                <legend>Complexidade da Senha</legend>
                <select name="complexidade" onchange="clickcomplexidade();" onclick="clickcomplexidade();" id="complexidade">
                    <option value="1" <c:if test="${ca.complexidade==1}"> selected="true" </c:if>>Básica (de 8 a 23 caracteres; Letras e numeros; SA == CS)</option>
                    <option value="0" <c:if test="${ca.complexidade==0}"> selected="true" </c:if>>Fraca (6 dígitos; SA == CS == CV;)</option>
                    <option value="2" <c:if test="${ca.complexidade==2}"> selected="true" </c:if>>Avançada (Senha básica + caixa maiusculos e minusculos + caracteres especiais)</option>
                </select>
                
                <div id="frame_senha_avancado" style="margin-top: 5px; <c:if test="${ca.complexidade!=2}">display: none;</c:if>">
                    Não conter <input type="text" style="display: inline; width: 20px;" onkeyup="refreshDiasConfigAcesso();" name="qtdMinimaSegura" id="qtdMinimaSegura" value="${ca.qtdMinimaSegura}" size="3" /> do mesmo tipo; <br />
                    Não conter <span id="qtdMinimaSegura1" style="color: red;">${ca.qtdMinimaSegura}</span> iguais consecutivos; <br />
                    Não conter padrões de <span id="qtdMinimaSegura2" style="color: red;">${ca.qtdMinimaSegura}</span> caracteres ou mais sequencias da tabela ASCII
                </div>
            </fieldset>
            <label>Validade da senha (dias):</label> <input type="text" value="${ca.senhaValidade}" id="senhaValidade" style="clear: none;" name="senhaValidade" size="4" />
            <label>Quantidade de senhas registradas:</label><input type="text" value="${ca.qtdRegistroSenha}" id="qtdRegistroSenha" name="qtdRegistroSenha" size="3" />
            <label>Quantidade de erros antes de bloqueio:</label> <input type="text" value="${ca.toleranciaBloqueio}" id="toleranciaBloqueio" name="toleranciaBloqueio" size="3" />

            <fieldset>
                <legend>Expirar Senha</legend>
                <input type="checkbox" name="senhaExpira" class="SpecialCaseForLabel" id="senhaExpira" <c:if test="${ca.senhaExpira}"> checked="true" </c:if> /> Expirar senha do operador por inatividade <br />
                <label>Dias antes de expirar:</label> <input type="text" id="diaSenhaExpirar" name="diaSenhaExpirar" size="6" value="${ca.diaSenhaExpirar}" />
            </fieldset>
            <label>Operador inativo receberá status de:</label>
            <select name="statusOperadorInativo" id="statusOperadorInativo">
                <option value="1" <c:if test="${ca.statusOperadorInativo==1}"> selected="true" </c:if>>Ativo</option>
                <option value="2" <c:if test="${ca.statusOperadorInativo==2}"> selected="true" </c:if>>Afastado</option>
                <option value="3" <c:if test="${ca.statusOperadorInativo==3}"> selected="true" </c:if>>Bloqueado</option>
                <option value="5" <c:if test="${ca.statusOperadorInativo==5}"> selected="true" </c:if>>Primeiro Login</option>
            </select> 
            <br /><br />
            <p style="color: orange; font-weight: bold;">
            	Existe a possibilidade de liberar uma nova tentativa de login após um determinado período para o operador que foi bloqueado por errar a senha. Depois deste intervalo de tempo, se o operador digitar a senha correta, fará o login. 
            </p>
            <label>Qual o tempo (em minutos) o sistema deve impedir nova tentativa bem sucedida de login?</label>
            <input type="text" name="tempo" id="tempobloqueio" />
            <br />
            <!-- <button style="float:right; margin-right: 3px;" value="Salvar" onclick="saveDataConfigAcesso();">Salvar</button> -->
            
            <div style="float: right; padding-top: 5px;">
				<input type="image" src="images/salvar_img.png" style="width: 100%;display: inline;" onclick="saveDividas(${cid});" />
			</div>
        </form>
    </body>
</html>
