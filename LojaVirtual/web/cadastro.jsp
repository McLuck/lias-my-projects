<%-- 
    Document   : cadastro
    Created on : 05/02/2012, 22:47:53
    Author     : Junio
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br">
    <%@include file="header.jsp" %>
                    <body>
                        <div id="content">
                            <h1><a href="index.jsp">Home</a> > Cadastre-se!</h1>
                            <form name="cadastroForm" id="cadastroForm" method="post">
                                <p><label for="nome">Nome:</label><br />
                                    <input type="text" name="nome" id="nome" class="grande" value="" /></p>
                                <p><label for="email">E-mail:</label><br />
                                    <input type="text" name="email" id="email" class="grande" value="" /></p>

                                <p><label for="data_nascimento">Data de Nascimento:</label><br />
                                    <input type="text" name="data_nascimento" id="data_nascimento" class="pequeno" value="" /></p>
                                <p><label for="cep">CEP</label> - <label for="cep">
                                        <a href="#">
                                        Completar Endereço</a></label> - 
                                        <a href="#">
                                        Não sei meu CEP</a><br />
                                    <input type="text" name="cep" id="cep" class="pequeno" value="" /></p>
                                <p><label for="endereco">Endereço:</label><br />
                                    <input type="text" name="endereco" id="endereco" class="grande" value="" /></p>
                                <p><label for="numero">Número:</label><br />
                                    <input type="text" name="numero" id="numero" class="pequeno" value="" /></p>
                                <p><label for="complemento">Complemento:</label><br />
                                    <input type="text" name="complemento" id="complemento" class="grande" value="" /></p>
                                <p><label for="bairro">Bairro:</label><br />
                                    <input type="text" name="bairro" id="bairro" class="grande" value="" /></p>
                                <p><label for="cidade">Cidade:</label><br />
                                    <input type="text" name="cidade" id="cidade" class="grande" value="" /></p>
                                <p><label for="estado">Estado:</label><br />
                                    <select name="estado" id="estado" class="medio">
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espirito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP" selected>São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                                    </select></p>
                                <p><label for="telefone">Telefone:</label><br />
                                    <input type="text" name="telefone" id="telefone" value="" /></p>
                                <p><label for="senha">Senha:</label><br />
                                    <input type="password" name="senha" id="senha" class="medio" value="" /></p>
                                <p><label for="confirmacao_senha">Confirmação de Senha:</label><br />
                                    <input type="password" name="confirmacao_senha" id="confirmacao_senha" class="medio" value="" /></p>
                                
                                <p><input type="reset" name="limpar" id="limpar" value="Limpar Formulário"> <input type="submit" name="enviar" id="enviar" value="Enviar"></p>
                                            </form>
                                            </div>
                                            </body>
                                            </html>