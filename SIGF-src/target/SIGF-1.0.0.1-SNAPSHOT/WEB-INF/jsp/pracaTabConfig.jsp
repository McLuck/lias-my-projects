<%@include file="include_htab2.jsp"%>
<title>Tabs</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#htabs2tabsPraca").tabs();
		loadAntenaPistaFrame(${pid});
	});
</script>
<!--[if IE]>
	<style type="text/css">
		label {
			margin-bottom: 2px;
		}
		input{
			margin-top: 0px;
			padding-top: 0px;
			padding-bottom: 0px;
			margin-bottom: 0px;
		}
	</style>
<![endif]-->
	<!-- HTML5 Shim, IE8 and bellow recognize HTML5 elements -->
	<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->		
	<!-- Modernizr -->
	<script src="js/modernizr-1.5.min.js"></script>
	<!-- Webforms2 -->
	<script src="webforms2/webforms2-p.js"></script>	
	<!-- jQuery and jQuery UI -->
	<link rel="stylesheet" href="ui-themes/aristo/jquery.ui.all.css"> 
	<script src="js/jquery-1.4.3.min.js"></script>
	<script src="js/jquery-ui-1.8.5.min.js"></script>
	<!-- jQuery Numeric Spinner -->	
	<link rel="stylesheet" href="components/spinner/ui.spinner.css"> 
	<script src="components/spinner/ui.spinner.js"></script>
	<!-- jQuery Color Picker -->
	<link rel="stylesheet" href="components/colorpicker/colorpicker.css">
	<script src="components/colorpicker/colorpicker.js"></script>
	<!-- jQuery Placehol -->
	<script src="components/placeholder/jquery.placehold-0.2.min.js"></script>

	<!-- Demo page layout -->
	<link rel="stylesheet" href="css/html5forms.layout.css">
	<!-- <script src="js/html5forms.js"></script> -->
	<script src="js/html5forms.fallback.js"></script>	
</head>
<body>
	<p id="msg_status_pracas_tab" style="text-align: center; color: red;">
	        &nbsp;
	</p>
	<div id="htabs2tabsPraca" class="teste" style="margin: 15px;">
		<form action="" method="post" onsubmit="return false;"
			id="form_geoSensores">
			<input type="hidden" name="cid" id="cid" value="${cid}" />
			<ul style="border: 0px; border-bottom: 1px #AAA solid;">
				<li><a href="#tabsPraca1">Perif�ricos</a>
				</li>
				<li><a href="#tabsPraca2">Sensores</a>
				</li>
				<li><a href="#tabsPraca3">CVs</a>
				</li>
			</ul>


			<div id="tabsPraca1">


				<fieldset>
					<legend>Perif�ricos</legend>

					<p id="msg_status_ant_conf" style="color: red;"></p>
					<fieldset>
						<legend>no-break</legend>
						<label>Marca:</label>
						<form:input path="confp.nobreakMarca" placeholder="APC" />
						<input type="hidden" name="pracaid" value="${pracaid}" /> <input
							type="hidden" name="pid" value="${pracaid}" /> <input
							type="hidden" name="phase" value="1" />

						<form:hidden path="confp.id" />
						<div style="color: red; word-wrap: break-word; width: 90%;">
							Esta op��o s� est� dispon�vel para o no-Break APC, com
							comunica��o USB. Para qualquer outro modelo, ser� necess�rio
							desenvolvimento.</div>
						<div>
							<form:checkbox path="confp.comunicacaoNobreak"
								label="H� comunica��o com no-break?"
								cssClass="SpecialCaseForLabel" />
						</div>

						<form:checkbox cssClass="SpecialCaseForLabel"
							path="confp.operacaoSimultaneaAntena"
							label="H� Opera��o simult�nea de antenas na mesma pista." />
					</fieldset>

					<%-- <c:if test="${confp.praca.concessionaria.existeAVI}"> --%>
						<div id="frame_antena_pista"></div>
					<%-- </c:if> --%>

				</fieldset>


			</div>

			<div id="tabsPraca3">
				<%-- <c:if test="${confp.praca.concessionaria.existeAVI}"> --%>
					<fieldset>
						<legend>Quais s�o as configura��es dos alarmes de pista?</legend>
						<form:checkbox path="confp.cvAlarmeViolacao"
							label="Alarme de viola��o" cssClass="SpecialCaseForLabel" />
						<form:checkbox path="confp.cvAlarmeMudancaTarifa"
							label="Alarme de mudan�a de tarifa" cssClass="SpecialCaseForLabel" />
						<form:checkbox path="confp.cvAlarmePanico" label="Alarme de p�nico"
							cssClass="SpecialCaseForLabel" />
						<div style="float: left; clear: both; width: 80px;">
							<form:checkbox path="confp.cvOutrosAlarmes" label="Outros"
								cssClass="SpecialCaseForLabel" />
						</div>
						<form:input path="confp.cvDesOutrosAlarmes"
							cssStyle="float: left; clear:none;" placeholder="Outros alarmes" />
					</fieldset>
	
					<fieldset>
						<legend>Qual modelo de AVC utilizado?</legend>
						<form:select path="confp.cvModelo" id="cvClassificaArmazenaSA"
							onchange="clickModeloAVC();" onclick="clickModeloAVC();" cssStyle="width:385px;" >
							<form:option value="1" label="Rabbit - com classifica��o"
								cssClass="SpecialCaseForLabel" />
							<form:option value="2" label="Rabbit - sem classifica��o"
								cssClass="SpecialCaseForLabel" />
							<form:option value="3" label="AVC - Linux"
								cssClass="SpecialCaseForLabel" />
						</form:select>
	
						<div id="cvModeloFrameConfig" style="display: none; float: left;">
							<form:checkbox path="confp.cvClassificaArmazenaSA"
								label="Armazenar transa��es no SA" />
						</div>
					</fieldset>
				<%-- </c:if> --%>
				
				
				<fieldset>
					<legend>Motivos de fechamento da pista</legend>
					<form:checkbox path="confp.cvFechamentoFimTurno"
						label="Fim de Turno" cssClass="SpecialCaseForLabel" />
					<form:checkbox path="confp.cvFechamentoRefeicao" label="Refei��o"
						cssClass="SpecialCaseForLabel" />
					<form:checkbox path="confp.cvTrocaPista" label="Troca de Pista"
						cssClass="SpecialCaseForLabel" />
					<form:checkbox path="confp.cvFechamentoQTO" label="QTO (Banheiro)"
						cssClass="SpecialCaseForLabel" />
				</fieldset>

				<fieldset>
					<legend>Viola��es Ignoradas</legend>
					<form:checkbox path="confp.cvIgnorarFalhaEquipamento"
						label="Falha de Equipamento" cssClass="SpecialCaseForLabel" />
					<form:checkbox path="confp.cvIgnorarMarchaRe" label="Marcha R�"
						cssClass="SpecialCaseForLabel" />
					<form:checkbox path="confp.cvIgnorarManutencao" label="Manuten��o"
						cssClass="SpecialCaseForLabel" />
				</fieldset>
			</div>

			
			
			
			<div id="tabsPraca2">
			<!-- <p id="msg_status_config_sensores" style="color: red;">&nbsp;</p> -->
				<fieldset>
					<legend>Qual a geometria de sensores de eixos utilizada?</legend>

					<fieldset>
						<legend>Geometria de Sensores de eixo utilizada?</legend>
						
						<%-- <c:if test="${confp.praca.concessionaria.existeAVI}"> --%>
							<label>Pistas Autom�ticas</label>
								<form:select path="confp.sensorAVI">
									<form:option value="1"
										label="reduzida, sem redund�ncia - Sensores borracha" />
									<form:option value="2"
										label="reduzida, com redund�ncia - Sensores borracha" />
									<form:option value="3"
										label="completa, com redund�ncia - Sensores borracha" />
									<form:option value="4"
										label="reduzida, com redund�ncia - Sensores �ticos" />
								</form:select>
						<%-- </c:if> --%>
						
						<label>Pistas Manual</label>
						<form:select path="confp.sensorPistManual">
							<form:option value="1"
								label="reduzida, sem redund�ncia - Sensores borracha" />
							<form:option value="2"
								label="reduzida, com redund�ncia - Sensores borracha" />
							<form:option value="3"
								label="completa, com redund�ncia - Sensores borracha" />
							<form:option value="4"
								label="reduzida, com redund�ncia - Sensores �ticos" />
						</form:select>

						<label>Pistas Moto</label>
						<form:select path="confp.sensorPistMoto">
							<form:option value="1" label="Somente dois sensores de eixo" />
						</form:select>
					</fieldset>
				</fieldset>

				<fieldset>
					<legend>Detec��o de Eixos Suspensos</legend>
					<form:checkbox path="confp.detectEixoSuspenso"
						label="Existe detec��o de eixos suspensos"
						cssClass="SpecialCaseForLabel" />
					<form:checkbox path="confp.detectJuntoEixoChao"
						label="Eixos suspensos ser�o detectados junto com os eixos do ch�o"
						cssClass="SpecialCaseForLabel" />
				</fieldset>
			
			</div>
				
		</form>
	</div>
	
	<div style="text-align: right;">
		<input type="image" src="images/salvar_img.png" style="width: 60px;padding-top: 0px;padding-right: 16px;display: inline;" onclick="saveConfigSensores();" />
		<!-- <button onclick="saveConfigSensores();" value="Salvar"
			style="margin-right: 15px; ">Salvar</button> -->
	</div>
</body>
</html>