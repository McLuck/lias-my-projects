<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <form id="form_config_mp" name="form_config_mp" method="POST" onsubmit="return false;">
            <input type="hidden" name="id" id="id_mp_config" value="mp.id" />
            <fieldset>
                <legend>Configuração</legend>
                <div id="config_mp_equip">
                    <label>Marca:</label><br/><input type="text" name="marca" id="config_marca_visa_vale_pedagio" value="${mp.equipamento.marca}" />
                    <br />
                    <label>Modelo:</label><br/><input type="text" name="modelo" id="config_modelo_visa_vale_pedagio" value="${mp.equipamento.modelo}" />
                </div>

                <div id="config_mp_contato">
                    <fieldset>
                        <legend>Contato</legend><br/>
                        <label>Nome:</label><br/>
                        <input type="text" name="nome" id="nome_contato_config_visa_vale_pedagio" value="${mp.contato.nome}" /> <br/>
                        <label>Email:</label><br/>
                        <input type="text" name="email" id="email_contato_config_visa_vale_pedagio" value="${mp.contato.email}" /> <br/>
                        <legend>Telefone:</legend>
                        <input type="text" name="telefone" id="nome_contato_config_visa_vale_pedagio" value="${mp.contato.telefone}" /> <br/>
                    </fieldset>
                </div>
                <button onclick="salvarConfigMP();">Salvar</button>
                <button onclick="closeConfigMP();">Fechar</button>
            </fieldset>
        </form>
    </body>
</html>
