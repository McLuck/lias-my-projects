<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String pathJS = "js/";
	String pathCSS = "css/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="stylesheet" href="css/thickbox.css" />

<title>Dados Gerais</title>
		<script type="text/javascript">
			function loadCategChield(){
				loadCATEGsTable(${cid});
			}
			function loadFrameOperacional(){
				var espaco_iframe;
				if (window.innerHeight){ 
				   //navegadores baseados em mozilla 
				   espaco_iframe = window.innerHeight - 110 
				}else{ 
				   if (document.body.clientHeight){ 
				      //Navegadores baseados em IExplorer, pois nao tenho innerheight 
				      	espaco_iframe = document.body.clientHeight - 110 
				   }else{ 
				      	//outros navegadores 
				      	espaco_iframe = 478 
				   } 
				} 
				document.write ('<iframe id="frame_operacional" frameborder="0" name="contentFrame" allowtransparency="true" src="main_operacional.htm?cid=${cid}" width="100%" style="border: none;background-color:transparent;" scrolling="auto" height="' + espaco_iframe + '">'); 
				document.write ('</iframe>') ;	
			}
		</script>
</head>

<body>

	<div id="wait_frame"
		style="background-color: white; text-align: center; border solid blue 1px; padding-top: 6%; width: 100%; height: 50%; z-index: 90; position: absolute; top: 0px; left: 180px; display: none;">
		<p>
			Por favor aguarde enquanto o script é gerado. <br /> Este processo
			pode demorar alguns segundos.
		</p>
		<img src="images/wait.gif" alt="WAIT" title="WAIT"
			style="border: 0px;" id="icon_wait" /> <br /> <img
			src="images/system_software_installer.png" alt="SIGF" title="SIGF"
			height="100" width="100" style="border: 0px;"
			id="icon_installer_home" /> <br /> <br /> <br /> <br />
		<p id="processo_status_script">&nbsp;</p>
	</div>

	<div id="dadosgeraisconcessionaria">



		<p style="color: red;" id="msg_status_conc1">&nbsp;</p>
		<form id="form_conc_dados1" method="POST" onsubmit="return false;">
			<div style="float: left; margin-bottom: 8px;">
				<form:hidden path="conc.id" id="cid" />
				<label for="c_dg_numeroCli">Código:</label>
				<form:input path="conc.numeroCliente" id="c_dg_numeroCli" cssStyle="width: 51px;"/>
				<input type="hidden" name="phase" value="1" /> <label
					for="c_dg_nome">Nome:</label>
				<form:input path="conc.nome" id="c_dg_nome" />
				<label for="c_dg_cnpj">CNPJ:</label>
				<form:input path="conc.cnpj" id="c_dg_cnpj" />
			</div>


			<fieldset style="clear: both;">
				<legend>A operação do sistema administrativo será
					centralizada ou distribuída?</legend>

				<div style="margin-top: 8px;">
					<form:radiobutton path="conc.operacaoSA" cssClass="SpecialCaseForLabel"
						onclick="opc_operacao_sa();" value="1" id="c_dg_link1"
						label="Centralizada - Um servidor para a concessionária toda. Necessário link entre as praças." />
					
					<form:radiobutton path="conc.operacaoSA" cssClass="SpecialCaseForLabel"
						onclick="opc_operacao_sa();" value="2" id="c_dg_link2"
						label="Distribuída - Um servidor por praça." />
				</div>				
				<div style="margin-bottom: 10px; margin-left: 0px;display: block;clear: both;float: none;">
					<fieldset id="fildset_link" <c:if test="conc.operacaoSA!=1">style="display: none;"</c:if>>
						<legend>Link</legend>
	
						<div id="htabtolinks" style="width: 99%">
				            <ul style="border: 0px;">
				                <li><a href="#tablink1">Primário</a></li>
				                <li><a href="#tablink2">Redundância</a></li>
				            </ul>
				            
				            <div id="tablink1" style="padding-left: 0px;">
				            	
											<label>Tipo:</label>
											<form:select path="conc.link1" id="tp_link_primario" cssStyle="margin-bottom: 5px;">
												<c:forEach items="${links}" var="lk">
													<form:option value="${lk.value}" label="${lk.label}" />
												</c:forEach>
											</form:select>
										
										
											<label>Capacidade:</label>
											<form:input path="conc.capacidadeLink1" id="capac_link_primario" />
																
				            </div>
				            
				            <div id="tablink2" style="padding-left: 0px;">
				            	
					            	
										<label>Tipo:</label>
										<form:select path="conc.link2" id="tp_link_redundancia" cssStyle="margin-bottom: 5px;">
											<c:forEach items="${links}" var="lk">
												<form:option value="${lk.value}" label="${lk.label}" />
											</c:forEach>
										</form:select>
						            						
										<label>Capacidade:</label>
										<form:input path="conc.capacidadeLink2" id="capac_link_redundancia" />
									
				            	
				            </div>
	            		</div>	
					</fieldset>
				</div>
			</fieldset>
		</form>
		<div id="frame_dados_sgbd_salvar" style="text-align: right;">
			<button onclick="saveConc1(${cid});">Salvar <img src="images/chk.jpg" alt="Salvar" title="Salvar" height="15" width="15" /></button>
		</div>
	</div>


	<div id="dadosgeraispraca" >
		<div id="tabela_geral_pracas">
		
		<a title="Configurar Praças" href="#" onclick="window.open('configPracas.htm?cid=3', 'Pracas', 'STATUS=NO, TOOLBAR=NO, LOCATION=NO, DIRECTORIES=NO, RESISABLE=NO, SCROLLBARS=YES, TOP=110, LEFT=110, WIDTH=1034, HEIGHT=600');" style="font-family: Verdana; font-size: 13px;">Editar</a>
									
				<table id="lista_pracas" style="width: 100%">
					<thead>
						<tr>
							<th>Detalhes</th>
						</tr>
					</thead>
					<tbody id="lista_pracas_trs">
						<c:forEach items="${pracas}" var="pc">
							<tr>
								<td>${pc.description}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
		
	</div>


	<div id="dadosgeraissgbd" style="display: none;">

		<div id="frame_dados_sgbd">

			<p style="color: red;" id="msg_status_bd">&nbsp;</p>
			<form action="" method="POST" id="form_server_bd"
				name="form_dados_praca">
				<fieldset>
					<legend>Qual será o SGBD utilizado?</legend>
					<form:hidden path="conc.servidorBD.id" />
					<form:radiobutton path="conc.servidorBD.bd" cssClass="SpecialCaseForLabel"
						onclick="opc_sgbd_so();" id="sgbd_o10" value="1"
						label="Oracle 10G" />

					<form:radiobutton path="conc.servidorBD.bd" onclick="opc_sgbd_so()" cssClass="SpecialCaseForLabel"
						id="sgbd_o11" value="2" label="Oracle 11G" />

					<form:radiobutton path="conc.servidorBD.bd" onclick="opc_sgbd_so()" cssClass="SpecialCaseForLabel"
						id="sgbd_ms" value="3" label="Microsoft SQL Server" />

					<br />
					<fieldset>
						<legend>Sistema operacional da instalação</legend>

						<div style="width: 50%; float: left;">

							<form:radiobutton path="conc.servidorBD.os" cssClass="SpecialCaseForLabel"
								onclick="opc_so_sgbd()" id="sgbd_so_w03" value="1"
								label="Windows Server 2003" />

							<form:radiobutton path="conc.servidorBD.os" cssClass="SpecialCaseForLabel"
								onclick="opc_so_sgbd()" id="sgbd_so_w08" value="2"
								label="Windows Server 2008 RC" />

							<form:radiobutton path="conc.servidorBD.os" cssClass="SpecialCaseForLabel"
								onclick="opc_so_sgbd()" id="sgbd_so_lnx" value="3" label="Linux" />
			
							<br />
							<label>Distribuição</label>
							<form:input path="conc.servidorBD.linuxDetalhe"
								id="sgbd_so_linux_name" />
							
							<br/>

				
							<form:radiobutton path="conc.servidorBD.os" cssClass="SpecialCaseForLabel"
								onclick="opc_sgbd_so()" id="sgbd_so" value="4" label="Outro" />

							<label>Outro sistema? Qual?</label>
							<form:input path="conc.servidorBD.osDetalhe" id="sgbd_so_name"  />


						</div>
						<div style="width: 50%; float: left;">

							<label>Versão:</label>
							<form:select path="conc.servidorBD.versao" id="versao_so" cssStyle="width: 100px;">
								<c:forEach items="${versoes}" var="v">
									<form:option value="${v.value}" label="${v.label}" />
								</c:forEach>
							</form:select>
							
							<label>Edição:</label>
							<form:select path="conc.servidorBD.edicao" id="edicao_so" cssStyle="width: 100px;">
								<c:forEach items="${edicoes}" var="ed">
									<form:option value="${ed.value}" label="${ed.label}" />
								</c:forEach>
							</form:select>
							<label>Idioma:</label>
							<form:select path="conc.servidorBD.idioma" id="idioma_so" cssStyle="width: 100px;">
								<c:forEach items="${idiomas}" var="ed">
									<form:option value="${ed.value}" label="${ed.label}" />
								</c:forEach>
							</form:select>
							<br />
						</div>

					</fieldset>

				</fieldset>
			</form>

		</div>
		<div id="frame_dados_sgbd_salvar" style="text-align: right;">
			<button onclick="saveBD(${cid});">Salvar</button>
		</div>

	</div>


	<div id="dadosgeraiscategorias" style="display: none">

		<fieldset>
			<legend>Configuração de categorias:</legend>
			<button value="Carregar Categorias" onclick="loadCATEGsTable(${cid});">Carregar categorias</button>
			
			<p id="msg_status_categ" style="color: red;">&nbsp;</p>
			<div id="screen_categorias_config_frame">
				
			</div>


		</fieldset>
		<p id="msg_status_conc2" style="color: red;">&nbsp;</p>
		<form action="" method="POST" name="form_conc_dados2"
			id="form_conc_dados2" onsubmit="return false;">
			<input type="hidden" name="phase" value="2" />
			<fieldset>
				<legend>Fórmula para o cálculo da tarifa da categoria
					especial</legend>
				<form:radiobutton path="conc.calculoCatEspecial" cssClass="SpecialCaseForLabel"
					onclick="opc_cat_esp_tp();"
					label="Modalidade 1 onde Tarifa especial = A + B * (E - C)"
					value="1" />
				<form:radiobutton path="conc.calculoCatEspecial" cssClass="SpecialCaseForLabel"
					onclick="opc_cat_esp_tp();"
					label="Modalidade 2 (Para São Paulo)  onde Tarifa especial = A * E / C"
					value="2" />
				<form:radiobutton path="conc.calculoCatEspecial" cssClass="SpecialCaseForLabel"
					onclick="opc_cat_esp_tp();" id="cats_opc_3"
					label="Outra Fórmula, Especificar:" value="4" />
				<form:input path="conc.calculoCatEspecialOutro"
					id="cats_opc_outra_value" />
			</fieldset>


			<fieldset>
				<legend>Categorias ambíguas</legend>
				<form:checkbox path="conc.categoriaAmbigua"  cssClass="SpecialCaseForLabel"
					onmouseup="opc_existe_cat_ambigua();"
					onmouseout="opc_existe_cat_ambigua();"
					onclick="opc_existe_cat_ambigua();" id="ch_cat_amb"
					label="Há categorias ambíguas na Concessionária?" />
					
					

				<div <c:if test="conc.categoriaAmbigua==false">style="display: none;"</c:if> id="frame_cat_ambigua">
					<form:checkbox path="conc.correcaoAutomaticaCatAmbigua" cssClass="SpecialCaseForLabel"
						id="ch_correcao_cat_amb"
						onmouseup="opc_existe_correcao_cat_ambigua();"
						onclick="opc_existe_correcao_cat_ambigua();"
						onmouseout="opc_existe_correcao_cat_ambigua();"
						label="Haverá correção automática para categorias ambíguas?" />
				</div>
				<div <c:if test="conc.categoriaAmbigua==false || conc.correcaoAutomaticaCatAmbigua==false">style="display: none;"</c:if> id="frame_percent_cat_ambigua">
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

	<div id="dadosgeraisimagens" style="display: none;">
		<div id="frame_config_img_content">
			<fieldset>
				<legend>Tipos de aquisição de imagens das pistas:</legend>
				<p id="msg_status_configImag1" style="color: red;"></p>
				<table width="100%" border="1">
					<thead>
						<tr>
							<th>Tipo de Pista</th>
							<th>VAS</th>
							<th>VES</th>
							<th>VAES</th>
							<th>OCR</th>
							<th>VBS</th>
						</tr>
					</thead>

					<form action="" onsubmit="return false;" method="POST"
						name="form_pts_img_adq" id="form_pts_img_adq">
						<c:forEach items="${conc.configImagem.tipoPista}" var="pts">
							<c:if test="${pts!=null}">
								<tr>
									<td>${pts.nome}</td>
									<td><input type="checkbox" 
										${pts.imgVASStr} name="imgVAS${pts.id}" class="SpecialCaseForLabel" />
									</td>
									<td><input type="checkbox"
										${pts.imgVESStr} name="imgVES${pts.id}" class="SpecialCaseForLabel" />
									</td>
									<td><input type="checkbox"
										${pts.imgVAESStr} name="imgVAES${pts.id}" class="SpecialCaseForLabel" />
									</td>
									<td><input type="checkbox"
										${pts.imgOCRStr} name="imgOCR${pts.id}" class="SpecialCaseForLabel" />
									</td>
									<td><input type="checkbox"
										${pts.imgVBSStr} name="imgVBS${pts.id}" class="SpecialCaseForLabel" />
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</form>
				</table>
			</fieldset>

			<form action="" onsubmit="return false;" id="form_cnfig_img_">
				<fieldset>
					<legend>Armazenamento</legend>
					<div style="width: 32%; float: left;">
						Servidor:<br />
						<form:select path="conc.configImagem.server">
							<form:option value="1" label="Aplicações" />
							<form:option value="2" label="Dedicado de imagens" />
						</form:select>

					</div>
					<div style="width: 32%; float: left;">
						IP:<br />
						<form:input path="conc.configImagem.ipServer" cssStyle="width: 100px;"  maxlength="15" onkeypress ="return ( maskIP(event,this) );" onblur="if (!validateIP(this.value)) this.style.backgroundColor='#FF9999';" onfocus="this.style.backgroundColor='transparent';"/>
					</div>
					<div style="width: 32%; float: left;">
						Qual será a estrutura dos diretórios na qual serão armazenadas as
						imagens?<br />
						<form:select path="conc.configImagem.estruturaDiretorio">
							<form:option value="1" label="aaaamm\ddhh" />
							<form:option value="2" label="aaaa\mm\dd\hh" />
						</form:select>
					</div>

					<div style="width: 99%; clear: both;">
						<form:checkbox path="conc.configImagem.concatenaCodigoUrl" cssClass="SpecialCaseForLabel"
							label="Código da praça será concatenado na URL da imagem?" />
						<br />
						<form:checkbox path="conc.configImagem.ordemExibicaCrescente" cssClass="SpecialCaseForLabel"
							label="Ordem para exibição das imagens na pista em ordem crescente:" />
						<br />
						<form:checkbox path="conc.configImagem.transacaoCorrecaoImg" cssClass="SpecialCaseForLabel"
							label="Habilitar transação de imagens na correção da transação:" />
						<br />
					</div>

				</fieldset>
			</form>
			<fieldset>
				<legend>Transações</legend>
				<div style="width: 50%; float: left;">
					<table border="0">
						<thead>
							<tr>
								<th>Transação</th>
								<th>Adquirir?</th>
							</tr>
						</thead>

						<form method="POST" action="" id="form_capt_por_tipo"
							name="form_capt_por_tipo" onsubmit="return false;">
							<c:forEach items="${conc.configImagem.tiposTransacoes}" var="tt">
								<c:if test="${tt!=null}">
									<tr>
										<td>${tt.nome}</td>
										<td><input type="checkbox" class="SpecialCaseForLabel"
											${tt.adqrImagStr} name="adquireImagem${tt.id}"
											id="adquireImagem${tt.id}" value="true" /></td>
									</tr>
								</c:if>
							</c:forEach>
						</form>
					</table>
				</div>
				<div style="float: left;">
					Quantidade a ser adquirida:<br />
					<form:input path="conc.configImagem.qtdAdquirida" cssStyle="width:170px;" />
				</div>
			</fieldset>
			<div style="text-align: right;">
				<button onclick="saveAllImgConfig(${cid});" value="Salvar">Salvar</button>
			</div>
		</div>
	</div>


	<div id="dadosgeraisoperacional" style="display: none;">
		<iframe id="frame_operacional" frameborder="0" name="contentFrame" allowtransparency="true" src="main_operacional.htm?cid=${cid}" width="100%" style="border: none;background-color:transparent;" scrolling="auto" height="600">
		</iframe>
	</div>


	<div id="dadosgeraiscript" style="display: none;">

		<div>
			<input type="checkbox" id="download" name="download" style="display: inline-block;clear: none;width: 20px;"/>
			<label style="display: inline-block;clear: none;">Baixar arquivo</label>
			<br /> 
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


</body>
</html>