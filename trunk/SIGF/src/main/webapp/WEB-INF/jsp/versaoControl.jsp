<%@include file="index_1.jsp"%>
<script type="text/javascript" src="<%=pathJS%>versao.js"></script>
<style type="text/css">
    table{
        font-size: 15px;
        font-weight: bolder;
        text-decoration: none;
    }
</style>
<body onload="loadTableVersoes();">
    <div id="myMenu1" style="display: none;">
        <ul>
            <li id="open" onclick="clickItem1();">Adicionar Insert Nesta Versão</li>
            <li id="clone" onclick="clickItem2();">Clonar Esta Versão</li>
            <li id="clone" onclick="clickItem3();">Realizar Alteração Nesta Versão</li>
        </ul>
    </div>

    <div id="formCloneVersaoDIV" style="display: none;width: 20%; padding: 5px; margin: 5px; border: 1px solid black; background-color: #DADCFF;">
        <form id="formCloneVersao" name="formCloneVersao" method="post" onsubmit="return false;">
            <input type="hidden" name="vid" id="cloneid"/>
            <label>Nome da nova versão:</label><br/>
            <input type="text" name="nome" value="(Clone) - HEAD" /><br/>
            <label>Número da nova versão:</label><br/>
            <input type="text" onkeyup="IsNum(this, event);" name="versao" value="30" /><br/>
            <input type="submit" value="Salvar" onclick="ClonarVersao();" />
            <input type="reset" value="Cancelar" onclick="CancelarClonagem();" />
        </form>
    </div>

    <div id="formAlteracaoDIV" style="display: none;width: 80%; padding: 5px; margin: 5px; border: 1px solid black; background-color: #DADCFF;">
        <form id="formAlteracaVersao" name="formAlteracaVersao" method="post" onsubmit="return false;">
            <input type="hidden" name="vid" id="alterid" /><br/>
            <label>Digite um insert normal da tabela que deseja alterar. Favor digitar com todos os dados, tal como se estivesse inserindo no banco de dados.</label><br/>
            <textarea name="sqlinsert" cols="100" rows="10"></textarea><br/>
            <input type="submit" value="Salvar" onclick="alterarVersao();" />
            <input type="reset" value="Cancelar" onclick="CancelarModificacao();" />
        </form>
    </div>

    <div id="formAddInsertDIV" style="display: none; width: 85%; padding: 5px; margin: 5px; border: 1px solid black; background-color: #DADCFF;">
        <form id="formAddInsert" name="formAddInsert" method="post" onsubmit="return false;">
            <input type="hidden" name="vid" id="insertid" />
            <label>Selecione a tabela que deseja cadastrar o insert:</label><br/>

            <div id="select_tabelas">
                Colocar select aqui...
            </div>
            <br />
            <label>Descreva como será usado este INSERT, quais seus valores padrões e onde ele irá afetar no sistema. (Não serão aceitos menos de 25 caracteres sem espaços.)</label><br/>
            <textarea name="descricao" id="descricao" cols="100" rows="10"></textarea><br />
            <input type="submit" value="Salvar" onclick="novoInsert();" />
            <input type="reset" value="Cancelar" onclick="CancelarInsert();" />
        </form>
    </div>


    <p id="msg_status_versao_control">
        &nbsp;
    </p>
    <div id="listaVersoes">

    </div>
</body>
</html>
