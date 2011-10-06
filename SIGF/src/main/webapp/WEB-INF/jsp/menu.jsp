<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 160px; float: left;">
	<ol>
		<li><a href="bdmanager.htm?cmd=get&cid=${cid}">Configuracao
				SGBD</a></li>
		<li><a href="formCategoria.htm?cid=${cid}">Categorias</a></li>
		<li><a href="formConfigImagem.htm?cid=${cid}">Configuração
				Imagens</a></li>
		<li><a href="main_operacional.htm?cid=${cid}">Operacional</a></li>
		<li><a href="Status?cmd=download">Gerar e baixar Script</a></li>
		<li><a href="listar_pracas.htm?cmd=getPracas&cid=${cid}">Praças</a>
		</li>
		<li><a href="concessionaria.htm?cmd=loadConfigAcesso&cid=${cid}">Cntrole
				Acesso</a></li>
		<li><a href="formRelatorios.htm?cmd=load&cid=${cid}">Relatorios</a>
		</li>
		<li><a href="formFuncionalidade.htm?cmd=load&cid=${cid}">Funcinoalidades</a>
		</li>
	</ol>
</div>
