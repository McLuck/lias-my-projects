<%@include file="include_htab2.jsp"%>

<script type="text/javascript">
    $('#lista_pracas').dataTable();
</script>


<title>Sort Table</title>

</head>
<body style="background-color:transparent;">
	<div id="wait_frame" style="background-color: white; text-align: center; border solid blue 1px; padding-top: 30%; width: 100%; height: 100%; z-index: 90;position: absolute; top: 0px; left: 0px; display: none;">
		<p>
			Por favor aguarde enquanto o script é gerado. <br />
			Este processo pode demorar alguns segundos.
		</p>
		<img src="images/wait.gif" alt="WAIT" title="WAIT" style="border: 0px;" id="icon_wait" />
		<br />
		<img src="images/system_software_installer.png" alt="SIGF" title="SIGF" height="100" width="100" style="border: 0px;" id="icon_installer_home" />
		<br/><br/><br/><br/>
		<p id="processo_status_script">
			&nbsp;
		</p>
	</div>

	<input type="hidden" value="${cid}" name="cidd" id="cidd" />
	<div id="htabs1" class="teste">
		<ul>
			<li><a href="#cons_tabs-1">Dados Gerais</a>
			</li>
			<li><a href="#cons_tabs-2">Praças</a>
			</li>
			<li><a href="#cons_tabs-3" onclick="loadConfigSGBD(${cid});">SGBDs</a>
			</li>
			<li><a href="#cons_tabs-4" onclick="loadCATEGsTable(${cid});">Categorias</a>
			</li>
			<li><a href="#cons_tabs-5"
				onclick="loadConfigImagesContent(${cid});">Imagens</a>
			</li>
			<li><a href="#cons_tabs-6" onclick="render_accordion();">Operacional</a>
			</li>
			<li><a href="#cons_tabs-7" onclick="loadScripts(${cid}, '0');">Script</a>
			</li>
		</ul>

		<div id="cons_tabs-1">
			<p style="color: red; clear: both;" id="msg_status_conc1">
				&nbsp;</p>
			<form id="form_conc_dados1" method="POST" onsubmit="return false;">
				<div style="float: left;">
					<form:hidden path="conc.id" id="cid" />

					<input type="hidden" name="phase" value="1" /> <label
						for="c_dg_nome">Nome:</label>
					<form:input path="conc.nome" id="c_dg_nome" />
					<br /> <label for="c_dg_numeroCli">Número do Cliente:</label>
					<form:input path="conc.numeroCliente" id="c_dg_numeroCli" />
					<br /> <label for="c_dg_cnpj">CNPJ:</label>
					<form:input path="conc.cnpj" id="c_dg_cnpj" />
				</div>


				<fieldset style="clear: both;">
					<legend>A operação do Sistema Administrativo será
						centralizada ou distribuída?</legend>

					<form:radiobutton path="conc.operacaoSA"
						onclick="opc_operacao_sa();" value="1" id="c_dg_link1"
						label="Centralizada - Um servidor para a Concessionária toda. Necessário link entre as praças." />
					<br />
					<form:radiobutton path="conc.operacaoSA"
						onclick="opc_operacao_sa();" value="2" id="c_dg_link2"
						label="Distribuída - Um servidor por praça." />

					<fieldset id="fildset_link" style="display: none;">
						<legend>Link</legend>

						<fieldset style="float: left; width: 50%">
							<legend>Primário</legend>
							Tipo<br />
							<form:select path="conc.link1" id="tp_link_primario">
								<c:forEach items="${links}" var="lk">
									<form:option value="${lk.value}" label="${lk.label}" />
								</c:forEach>
							</form:select>

							<br /> Capacidade: <br />
							<form:input path="conc.capacidadeLink1" id="capac_link_primario" />
						</fieldset>

						<fieldset>
							<legend>Redundancia</legend>
							Tipo<br />
							<form:select path="conc.link2" id="tp_link_redundancia">
								<c:forEach items="${links}" var="lk">
									<form:option value="${lk.value}" label="${lk.label}" />
								</c:forEach>
							</form:select>

							<br /> Capacidade: <br />
							<form:input path="conc.capacidadeLink2"
								id="capac_link_redundancia" />
						</fieldset>
					</fieldset>
				</fieldset>
			</form>
			<div id="frame_dados_sgbd_salvar" style="text-align: right;">
				<button onclick="saveConc1(${cid});">Salvar</button>
			</div>

		</div>




		<div id="cons_tabs-2">

			<div id="tabela_geral_pracas">
				<fieldset>
					<legend>Praças</legend>
					<table id="lista_pracas" width="700" style="float: left;">
						<thead>
							<tr>
								<th>Detalhes</th>
							</tr>
						</thead>
						<c:forEach items="${pracas}" var="pc">
							<tr>
								<td colspan="2">${pc.description}</td>
							</tr>
						</c:forEach>
					</table>

					<div style="width: 98%; text-align: right;">
						<button onclick="viewDetalhesPraca();" value="Add">Add</button>
					</div>
				</fieldset>
			</div>
			<div id="dadosPagina_detalhes" style="display: none;">
				<fieldset>
					<legend>Quando concluir de editar as praças, clique em
						finalizar para voltar</legend>
					<button onclick="closeDetalhesPraca();" value="Finalizar">Finalizar</button>
				</fieldset>
				<iframe src="configPracas.htm?cid=${cid}" style="border: none;"
					scrolling="no" height="600px" frameborder="0" width="700px"
					name="ifrm"> Seu navegador não suporta Frames </iframe>
			</div>
		</div>




		<div id="cons_tabs-3">

			<div id="frame_dados_sgbd"></div>
			<div id="frame_dados_sgbd_salvar" style="text-align: right;">
				<button onclick="saveBD(${cid});">Salvar</button>
			</div>


		</div>


		<div id="cons_tabs-4">
			<fieldset>
				<legend>Configuração de categorias:</legend>
				<p id="msg_status_categ" style="color: red;">&nbsp;</p>
				<div id="screen_categorias_config_frame"></div>


			</fieldset>
			<p id="msg_status_conc2" style="color: red;">&nbsp;</p>
			<form action="" method="POST" name="form_conc_dados2"
				id="form_conc_dados2" onsubmit="return false;">
				<input type="hidden" name="phase" value="2" />
				<fieldset>
					<legend>Fórmula para o cálculo da tarifa da categoria
						especial</legend>
					<form:radiobutton path="conc.calculoCatEspecial"
						onclick="opc_cat_esp_tp();"
						label="Modalidade 1 onde Tarifa especial = A + B * (E - C)"
						value="1" />
					<form:radiobutton path="conc.calculoCatEspecial"
						onclick="opc_cat_esp_tp();"
						label="Modalidade 2 (Para São Paulo)  onde Tarifa especial = A * E / C"
						value="2" />
					<form:radiobutton path="conc.calculoCatEspecial"
						onclick="opc_cat_esp_tp();" id="cats_opc_3"
						label="Outra Fórmula, Especificar:" value="4" />
					<form:input path="conc.calculoCatEspecialOutro"
						id="cats_opc_outra_value" />
				</fieldset>


				<fieldset>
					<legend>Categorias ambíguas</legend>
					<form:checkbox path="conc.categoriaAmbigua"
						onmouseup="opc_existe_cat_ambigua();"
						onmouseout="opc_existe_cat_ambigua();"
						onclick="opc_existe_cat_ambigua();" id="ch_cat_amb"
						label="Há categorias ambíguas na Concessionária?" />

					<div style="display: none;" id="frame_cat_ambigua">
						<form:checkbox path="conc.correcaoAutomaticaCatAmbigua"
							id="ch_correcao_cat_amb"
							onmouseup="opc_existe_correcao_cat_ambigua();"
							onclick="opc_existe_correcao_cat_ambigua();"
							onmouseout="opc_existe_correcao_cat_ambigua();"
							label="Haverá correção automática para categorias ambíguas?" />
					</div>
					<div style="display: none;" id="frame_percent_cat_ambigua">
						<label for="ch_cat_amb">Percentual:</label>
						<form:select path="conc.percentCorrecaoAutoCatAmb">
							<c:forEach items="${porcentagensCooreAuto}" var="pct">
								<form:option value="${pct.value}" label="${pct.label}" />
							</c:forEach>
						</form:select>
					</div>
				</fieldset>
			</form>
			<div style="text-align: right;">
				<button value="Salvar" onclick="saveConc2(${cid});">Salvar</button>
			</div>
		</div>

		<div id="cons_tabs-5">
			<div id="frame_config_img_content"></div>
		</div>




		<div id="cons_tabs-6">


			<!-- usar funcao onload='iframeAutoHeight(this)' caseo de problema na altura fixa. Esta funcao prove altura automatica -->
			<iframe src="main_operacional.htm?cid=${cid}" style="border: none;"
				height="700px" frameborder="0" width="700px" name="ifrm">
				Seu navegador não suporta Frames </iframe>



		</div>
		<div id="cons_tabs-7">
			<div>
				<input type="checkbox" id="download" name="download" /> Baixar Arquivo<br/>
				<select onchange="loadScripts(${cid}, '1');"
					id="select_versao_export">
					<option value="0">Escolha a versão que deseja exportar...</option>
					<c:forEach items="${listVersoes}" var="lv">
						<option value="${lv.id}">${lv.nome} (${lv.versao})</option>
					</c:forEach>
				</select>
			</div>
			
			<div id="content_scritps"></div>
			<div id="content_scritps_download"></div>
		</div>

	</div>
</body>
</html>