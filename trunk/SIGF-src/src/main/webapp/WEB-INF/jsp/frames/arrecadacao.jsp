<%@include file="../include.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <div>
            <p id="msg_status_arrecad" style="color: red; text-align: right">

            </p>
            <form action="" onsubmit="return false;" method="POST" name="formConfArrecadacao" id="formConfArrecadacao">
                <fieldset>
                    <legend>Forma de Arrecadação</legend>
                    <table>
                        <thead>
                            <tr>
                                <th>Papel</th>
                                <th style="width: 100px; text-align: left;">No Caixa</th>
                                <th style="width: 100px; text-align: left;">Por Malote</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>Arrecadador</td>
                            <td>
                                <form:radiobutton path="arr.formArrecadador" value="1" cssClass="SpecialCaseForLabel" />
                            </td>
                            <td>
                                <form:radiobutton path="arr.formArrecadador" value="2" cssClass="SpecialCaseForLabel"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Supervisor</td>
                            <td>
                                <form:radiobutton path="arr.formSupervisor" value="1" cssClass="SpecialCaseForLabel"/>
                            </td>
                            <td>
                                <form:radiobutton path="arr.formSupervisor" value="2" cssClass="SpecialCaseForLabel"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Responsável por pista</td>
                            <td>
                                <form:radiobutton path="arr.formRespPista" value="1" cssClass="SpecialCaseForLabel"/>
                            </td>
                            <td>
                                <form:radiobutton path="arr.formRespPista" value="2" cssClass="SpecialCaseForLabel"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Vendedor de Cupons</td>
                            <td>
                                <form:radiobutton path="arr.formVendCupons" value="1" cssClass="SpecialCaseForLabel"/>
                            </td>
                            <td>
                                <form:radiobutton path="arr.formVendCupons" value="2" cssClass="SpecialCaseForLabel"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Coletor de Sangria</td>
                            <td>
                                <form:radiobutton path="arr.formSangria" value="1" cssClass="SpecialCaseForLabel"/>
                            </td>
                            <td>
                                <form:radiobutton path="arr.formSangria" value="2" cssClass="SpecialCaseForLabel"/>
                            </td>
                        </tr>
                    </table>
                </fieldset>


                <fieldset>
                    <legend>Forma de devolução do troco</legend>
                    <form:select path="arr.formaDevTroco">
                        <form:option value="1" label="Implícita (Junto com a declaração dos valores arrecadados)" />
                        <form:option value="2" label="Explícita (separado da declaração dos valores arrecadados)" />
                        <form:option value="3" label="Não registrará a entrega de troco no sistema" />
                    </form:select>
                </fieldset>
            </form>
        </div>
    </body>
</html>
