<%@include file="include_htab2.jsp"%>
</head>
<body>
    <%-- <label>Selecione a praça que deseja editar</label>
    <select onchange="loadPraca();" onclick="loadPraca();" id="select_praca_for_config">
        <c:forEach items="${pracas}" var="pc">
            <option value="${pc.id}">${pc.nome}</option>
        </c:forEach>
    </select> --%>
    
    
    
    <ul>
    	<c:forEach items="${pracas}" var="pc">
	    	<li id="li_prc_prc${pc.id}">
	    		<a href="#" onclick="ogn_prc(${pc.id});">${pc.nome}</a>
	    	</li>
    	</c:forEach>
    </ul>
    <input type="hidden" name="cidd" id="cidd" value="${cid}" />
    
    
    
    
    
    <!-- <p id="msg_status_pracas_tab">
        &nbsp;
    </p>
    <div style="width: 350px;height: 130px; border: 1 solid black; background-color:white; padding-top: 40px; display: none;"  id="wait_seleciona">
    	<p style="text-align: center;">Carregando, aguarde!<br/>
    		<img src="images/wait.gif" alt="WAIT" title="WAIT" style="border: 0px; width: 20px; height: 20px;" id="icon_wait" />
    	</p>
    </div>
    <div id="tab_ConfigPracas">
        
    </div> -->
</body>
</html>
