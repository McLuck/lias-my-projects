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

</head>
<body>
	<p id="msg_status_pracas_tab" style="text-align: center; color: red;">
	        &nbsp;
	</p>
	<div id="htabs2tabsPraca" class="teste" style="margin: 15px;">
		<form action="" method="post" onsubmit="return false;"
			id="form_geoSensores">
			<input type="hidden" name="cid" id="cid" value="${cid}" />
			<ul>
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
						<form:input path="confp.nobreakMarca" />
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
							cssStyle="float: left; clear:none;" />
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
		<button onclick="saveConfigSensores();" value="Salvar"
			style="margin-right: 15px;">Salvar</button>
	</div>
</body>
</html>