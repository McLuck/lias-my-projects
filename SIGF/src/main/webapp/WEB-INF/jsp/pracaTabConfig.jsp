<%@include file="include_htab2.jsp"%>
<title>Sort Table</title>
<script type="text/javascript">
	var tabs = new Array("tabsPraca1", "tabsPraca3", "tabsPraca2");
	
	function hideTabsPraca(){
		for(var i=0;i<tabs.length;i++){
	            document.getElementById(dadosGerais[i]).style.display = "none";
	        }
	}
	
	function ognPraca(name){
		hideTabsPraca();
	    document.getElementById(name).style.display = "block";
	}
</script>
</head>
<body>
    <form action="" method="post" onsubmit="return false;" id="form_geoSensores">
        <input type="hidden" name="cid" id="cid"  value="${cid}" />
        <div id="htabs2tabsPraca" class="teste" >
            <ul>
                <li><a href="#tabsPraca1">Periféricos</a></li>
                <li><a href="#tabsPraca2">Sensores</a></li>
                <li><a href="#tabsPraca3">CVs</a></li>
            </ul>


            <div id="tabsPraca1">


                <fieldset>
                    <legend>Periféricos</legend>

                    <p id="msg_status_ant_conf" style="color: red;">

                    </p>
                    <fieldset>
                        <legend>no-break</legend>
                        <label>Marca:</label>
                        <form:input path="confp.nobreakMarca" />
                        <input type="hidden" name="pracaid" value="${pracaid}" />
                        <input type="hidden" name="pid" value="${pracaid}" />
                        <input type="hidden" name="phase" value="1" />

                        <form:hidden path="confp.id" />
                        <br />
                        <form:checkbox path="confp.comunicacaoNobreak" /><br/>
                        <span style="color: red;">
                            Esta opção só está disponível para o no-Break APC, com comunicação USB. Para qualquer outro modelo, será necessário desenvolvimento.
                        </span>
                        <br /><br />
                        <form:checkbox path="confp.operacaoSimultaneaAntena" label="Há Operação simultânea de antenas na mesma pista."/>
                    </fieldset>


                    <div id="frame_antena_pista">     
                    </div>

                </fieldset>


            </div>
            
            <div id="tabsPraca3">

                <fieldset>
                    <legend>Quais são as configurações dos alarmes de pista?</legend>
                    <form:checkbox path="confp.cvAlarmeViolacao" label="Alarme de violação" /> 
                    <form:checkbox path="confp.cvAlarmeMudancaTarifa" label="Alarme de mudança de tarifa" /><br/>
                    <form:checkbox path="confp.cvAlarmePanico" label="Alarme de pânico" />
                    <form:checkbox path="confp.cvOutrosAlarmes" label="Outros" />
                    <form:input path="confp.cvDesOutrosAlarmes" />
                </fieldset>

                <fieldset>
                    <legend>Qual modelo de AVC utilizado?</legend>
                    <form:select path="confp.cvModelo" id="cvClassificaArmazenaSA" onchange="clickModeloAVC();" onclick="clickModeloAVC();">
                        <form:option value="1" label="Rabbit - com classificação" />
                        <form:option value="2" label="Rabbit - sem classificação" />
                        <form:option value="3" label="AVC - Linux" />
                    </form:select>

                    <div id="cvModeloFrameConfig" style="display: none; float: left;">
                        <form:checkbox path="confp.cvClassificaArmazenaSA" label="Armazenar transações no SA" />
                    </div>
                </fieldset>

                <fieldset>
                    <legend>Motivos de fechamento da pista</legend>
                    <form:checkbox path="confp.cvFechamentoFimTurno" label="Fim de Turno" /> 
                    <form:checkbox path="confp.cvFechamentoRefeicao" label="Refeição" /><br/>
                    <form:checkbox path="confp.cvTrocaPista" label="Troca de Pista" />
                    <form:checkbox path="confp.cvFechamentoQTO" label="QTO (Banheiro)" />
                </fieldset>
                
                <fieldset>
                    <legend>Violações Ignoradas</legend>
                    <form:checkbox path="confp.cvIgnorarFalhaEquipamento" label="Falha de Equipamento" /> 
                    <form:checkbox path="confp.cvIgnorarMarchaRe" label="Marcha Ré" /><br/>
                    <form:checkbox path="confp.cvIgnorarManutencao" label="Manutenção" />
                </fieldset>
            </div>

            <div id="tabsPraca2">
                <p id="msg_status_config_sensores" style="color: red;">
                </p>


                <fieldset>
                    <legend>Qual a geometria de sensores de eixos utilizada?</legend>


                    <fieldset>
                        <legend>Geometria de Sensores de eixo utilizada?</legend>
                        <label>Pistas Automáticas</label><br/>
                        <form:select path="confp.sensorAVI">
                            <form:option value="1" label="reduzida, sem redundância - Sensores borracha" />
                            <form:option value="2" label="reduzida, com redundância - Sensores borracha" />
                            <form:option value="3" label="completa, com redundância - Sensores borracha" />
                            <form:option value="4" label="reduzida, com redundância - Sensores óticos" />
                        </form:select>

                        <br />
                        <label>Pistas Manual</label><br/>
                        <form:select path="confp.sensorPistManual">
                            <form:option value="1" label="reduzida, sem redundância - Sensores borracha" />
                            <form:option value="2" label="reduzida, com redundância - Sensores borracha" />
                            <form:option value="3" label="completa, com redundância - Sensores borracha" />
                            <form:option value="4" label="reduzida, com redundância - Sensores óticos" />
                        </form:select>

                        <br />
                        <label>Pistas Moto</label><br/>
                        <form:select path="confp.sensorPistMoto">
                            <form:option value="1" label="Somente dois sensores de eixo" />
                        </form:select>
                    </fieldset>
                </fieldset>

                <fieldset>
                    <legend>Detecção de Eixos Suspensos</legend>
                    <form:checkbox path="confp.detectEixoSuspenso" label="Existe detecção de eixos suspensos" />
                    <form:checkbox path="confp.detectJuntoEixoChao" label="Eixos suspensos serão detectados junto com os eixos do chão" />
                </fieldset>
                </form>
            </div>
            
        </div>
    </form>
    <div style="text-align: right;">
        <button onclick="saveConfigSensores();" value="Salvar">Salvar</button>
    </div>

</body>
</html>