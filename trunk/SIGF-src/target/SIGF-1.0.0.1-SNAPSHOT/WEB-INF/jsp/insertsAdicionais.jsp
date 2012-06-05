<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="form_insert" name="form_insert_${s.id}" onsubmit="return false;">
    <c:forEach items="${inserts}" var="s">
        <div id="insert_elemento_${s.id}" style="border: 1px solid black;">
            <p>
                ${s.descricao}
            </p>

            <input type="hidden" name="id${s.id}" id="id${s.id}" value="${s.id}" />
            <c:forEach items="${s.tbAux.campos}" var="cp">
                <label>${cp.nome}</label><br/>
                <input type="text" name="${cp.nome}${s.id}" /><br />
            </c:forEach>
        </div>
    </c:forEach>
    <button value="Exportar Inserts" onclick="goExport(${cid});">Exportar Inserts</button>
</form>