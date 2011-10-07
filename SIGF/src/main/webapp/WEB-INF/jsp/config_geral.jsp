<%@include file="include_htab2.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#htabs3").tabs();
	});
</script>
</head>
<body>
    <div id="htabs3" class="teste">
        <ul>
            <li><a href="#tabs-1" onclick="loadConfigAcesso(${cid});">Controle de Acesso</a></li>
            <li><a href="#tabs-2">Reconhecimento D�vidas</a></li>
            <li><a href="#tabs-3">Interoperabilidade</a></li>
            <li><a href="#tabRelatorio" onclick="loadRelatorios(${cid});">Relat�rios</a></li>
            <li><a href="#tabs-5" onclick="loadFuncionalidades(${cid});">Funcionalidades e M�dulos Adicionais</a></li>
        </ul>
            
        <div id="tabRelatorio">
            <p id="msg_status_relatorios" style="color: red; font-weight: bold;">
                &nbsp;
            </p>
            <div id="content_relatorios">
            </div>
            <!--button onclick="saveRelatorios(${cid});" value="Salvar">Salvar</button-->
        </div>
        
        <div id="tabs-1">
            <div id="contentConfigAcesso">
            </div>
        </div>

        <div id="tabs-2">
            <p>Configura��es do Termo de reconhecimento de d�vidas.</p>
        </div>

        <div id="tabs-3">
            <p>Configura��es das Interoperabilidades.</p>
        </div>

        <div id="tabs-5">
            <p id="msg_status_funcionalidades" style="color: red; font-weight: bold;">
                &nbsp;
            </p>
            <div id="content_funcionalidade">
            </div>
            <button onclick="saveFuncionalidades(${cid});" value="Salvar">Salvar</button>
        </div>
    </div>
</body>
</html>