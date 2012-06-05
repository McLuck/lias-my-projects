<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	long now = new java.util.Date().getTime();
	
%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="description"
		content="SIGF." />
		<title>SIGF</title>
	
		<meta http-equiv="Cache-Control" content="No-Cache">
		<meta http-equiv="Pragma" content="No-Cache">
		<meta http-equiv="Expires" content="0">
		 
		<script type="text/javascript" src="js/jquery.js?n=<%=now%>"></script>
		<script type="text/javascript" src="js/concessionaria.js?n=<%=now%>"></script>
		<script type="text/javascript" src="js/desktop_tratamento.js?n=<%=now%>"></script>
		<script type="text/javascript" src="js/main.js?n=<%=now%>"></script>
		<script type="text/javascript" src="js/wysiwyg.js?n=<%=now%>"></script>
		
		<!--[if lt IE 7]>
		<script>
		window.top.location = 'http://desktop.sonspring.com/ie.html';
		</script>
		<![endif]-->
		<link rel="stylesheet" href="assets/css/reset.css?n=<%=now%>" />
		<link rel="stylesheet" href="assets/css/desktop.css?n=<%=now%>" />
		<link rel="stylesheet" href="css/support.css?n=<%=now%>" />
		<!--[if lt IE 9]>
		<link rel="stylesheet" href="assets/css/ie.css?n=<%=now%>" />
		<![endif]-->
		<script type="text/javascript" src="js/thickbox.js?n=<%=now%>"></script>
		<link rel="stylesheet" href="css/thickbox.css?n=<%=now%>" />
		
		
		<link rel="stylesheet" href="css/themes/base/jquery.ui.core.css?n=<%=now%>">
		<link rel="stylesheet" href="css/themes/base/jquery.ui.theme.css?n=<%=now%>">
		<link rel="stylesheet" href="css/themes/base/jquery.ui.allplugins.css?n=<%=now%>">
		<link rel="stylesheet" href="css/themes/base/jquery.ui.theme.css?n=<%=now%>">

		<link rel="stylesheet" href="css/themes/def1/icones.css?n=<%=now%>">

		<script src="js/ui/jquery.ui.core.js?n=<%=now%>"></script>
		<script src="js/ui/jquery.ui.widget.js?n=<%=now%>"></script>
		<script src="js/ui/jquery.ui.tabs.js?n=<%=now%>"></script>
		<link rel="stylesheet" href="css/htabs.css?n=<%=now%>">
		<link rel="stylesheet" href="css/demo_table.css?n=<%=now%>">
		
		<script src="js/ui/jquery.ui.mouse.js?n=<%=now%>"></script>
		<script src="js/ui/jquery.ui.sortable.js?n=<%=now%>"></script>
		<script type="text/javascript" src="js/jquery.dataTables.js?n=<%=now%>"></script>

		<script type="text/javascript" src="js/globaljs.js?n=<%=now%>"></script>
		
		
		
		<!-- HTML5 Shim, IE8 and bellow recognize HTML5 elements -->
	<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->		
	<!-- Modernizr -->
	<script src="js/modernizr-1.5.min.js?n=<%=now%>"></script>
	<!-- Webforms2 -->
	<script src="webforms2/webforms2-p.js?n=<%=now%>"></script>	
	<!-- jQuery and jQuery UI -->
	<link rel="stylesheet" href="ui-themes/aristo/jquery.ui.all.css?n=<%=now%>"> 
	<script src="js/jquery-1.4.3.min.js?n=<%=now%>"></script>
	<script src="js/jquery-ui-1.8.5.min.js?n=<%=now%>"></script>
	<!-- jQuery Numeric Spinner -->	
	<link rel="stylesheet" href="components/spinner/ui.spinner.css?n=<%=now%>"> 
	<script src="components/spinner/ui.spinner.js?n=<%=now%>"></script>
	<!-- jQuery Color Picker -->
	<link rel="stylesheet" href="components/colorpicker/colorpicker.css?n=<%=now%>">
	<script src="components/colorpicker/colorpicker.js?n=<%=now%>"></script>
	<!-- jQuery Placehol -->
	<script src="components/placeholder/jquery.placehold-0.2.min.js?n=<%=now%>"></script>

	<!-- Demo page layout -->
	<link rel="stylesheet" href="css/html5forms.layout.css?n=<%=now%>">
	<!-- <script src="js/html5forms.js"></script> -->
	<script src="js/html5forms.fallback.js"></script>	
	<script type="text/javascript" src="js/jquery.meio.mask.js?n=<%=now%>"></script>
	</head>
	<body>
		<input type="hidden" id="_cid" name="_cid" value="3" />
		<div class="abs" id="wrapper">
			<div class="abs" id="desktop">
				<a class="abs icon" style="left: 20px; top: 20px;"
				href="#icon_dock_computer"> <img
				src="assets/images/icons/icon_16_page.png" /> Dados Gerais </a>
				
				<a class="abs icon" style="left: 20px; top: 100px;" href="#icon_dock_drive"> <img src="images/bandeira.png" />Configuração Praça <span id="titConfigPraca">&nbsp;</span></a>
				<a
				class="abs icon" style="left: 20px; top: 180px;"
				href="#icon_dock_disc"> <img
				src="assets/images/icons/icon_16_system.png" /> Configurações Gerais </a>
				
				<a
				class="abs icon" style="left: 20px; top: 260px;"
				href="#icon_dock_network"> <img
				src="assets/images/icons/Settings.png" /> Preferências </a>
				 <!--a
				class="abs icon" style="left: 20px; top: 260px;"
				href="#icon_dock_network"> <img
				src="assets/images/icons/icon_32_network.png" /> Network </a-->
				
				<div id="window_computer" class="abs window">
					<div class="abs window_inner">
						<div class="window_top">
							<span class="float_left"> <img
								src="assets/images/icons/icon_16_page.png" /> Dados Gerais <span id="titConfigGeral">&nbsp;</span> </span>
							<span class="float_right"> <a href="#" class="window_min"></a> <a href="#" class="window_resize"></a> <a
								href="#icon_dock_computer" class="window_close"></a> </span>
						</div>
						<div class="abs window_content">
							<div class="window_aside">
								<ul id="navulmenucontainer">
									<li id="li_dadosgeraisconcessionaria">
										<a href="#" onclick="ogn('dadosgeraisconcessionaria');" id="link_dadosgeraisconcessionaria">Concessionária</a>
									</li>
									<li id="li_dadosgeraispraca">
										<!--<a title="Configurar Pracas" href="configPracas.htm?cid=3&keepThis=true&TB_iframe=true&height=600&width=1024" id="link_dadosgeraispraca" class="thickbox" style="z-index: 200;">Pracas</a>-->
										<a title="Configurar Praças" onclick="ogn('dadosgeraispraca');" href="#" id="link_dadosgeraispraca" style="z-index: 200;">Praças</a>
									</li>
									<li id="li_dadosgeraissgbd">
										<a href="#" onclick="javascript:ogn('dadosgeraissgbd');" id="link_dadosgeraissgbd">SGBDs</a>
									</li>
									<li id="li_dadosgeraiscategorias">
										<a href="#" onclick="javascript:ogn('dadosgeraiscategorias');" id="link_dadosgeraiscategorias">Categorias</a>
									</li>
									<li id="li_dadosgeraisimagens">
										<a href="#" onclick="javascript:ogn('dadosgeraisimagens');" id="link_dadosgeraisimagens">Imagens</a>
									</li>
									<li id="li_dadosgeraisoperacional">
										<a href="#" onclick="javascript:ogn('dadosgeraisoperacional');" id="link_dadosgeraisoperacional">Operacional</a>
									</li>
									<li id="li_dadosgeraiscript">
										<a href="#" onclick="javascript:ogn('dadosgeraiscript');" id="link_dadosgeraiscript">Script</a>
									</li>
								</ul>
							</div>
							<div class="window_main">
								<div id="frameDataContent" class="espacoesquerdo espacodireito"></div>
							</div>
						</div>
						<div class="abs window_bottom"></div>
					</div>
					<span class="abs ui-resizable-handle ui-resizable-se"></span>
				</div>
				
				
				
				<div id="window_drive" class="abs window">
					<div class="abs window_inner">
						<div class="window_top">
							<span class="float_left"> <img
								src="images/bandeira.png" width="16px" height="16px" /> Configuração Praça </span><span
							class="float_right"> <a href="#" class="window_min"></a> <a
								href="#" class="window_resize"></a> <a href="#icon_dock_drive"
								class="window_close"></a> </span>
						</div>
						<div class="abs window_content">
							<div class="window_aside" id="prc_lateral">
								
							</div>
							<div class="window_main" id="prc_content">
							    <div id="tab_ConfigPracas">
							    		
							    </div>
								
							</div>
						</div>
						<div class="abs window_bottom">
							<!--Barra Rodape-->
						</div>
					</div>
					<span class="abs ui-resizable-handle ui-resizable-se"></span>
				</div>
				
				
				<!--Configuracoes Gerais-->
				<div id="window_disc" class="abs window">
					<div class="abs window_inner">
						<div class="window_top">
							<span class="float_left"> <img
								src="assets/images/icons/icon_16_system.png" /> Configurações Gerais</span><span class="float_right"> 
								<a href="#" class="window_min"></a> <a href="#" class="window_resize"></a> 
								<a href="#icon_dock_disc" class="window_close"></a> </span>
						</div>
						<div class="abs window_content">
							<div class="window_aside">
								<ul id="navulmenucontainer2">
									<li id="li_tabs-1">
										<a href="#" onclick="loadConfigGeral('tabs-1');" >Controle de Acesso</a>
									</li>
									<li id="li_rec_dividass">
										<!--<a title="Configurar Pracas" href="configPracas.htm?cid=3&keepThis=true&TB_iframe=true&height=600&width=1024" id="link_dadosgeraispraca" class="thickbox" style="z-index: 200;">Pracas</a>-->
										<a title="Configurar Praças" onclick="loadConfigGeral('rec_dividass');" href="#" style="z-index: 200;">Reconhecimento Dívidas</a>
									</li>
									<li id="li_tabs-3">
										<a href="#" onclick="loadConfigGeral('tabs-3');" id="link_dadosgeraissgbd">Interoperabilidade</a>
									</li>
									<li id="li_tabRelatorio">
										<a href="#" onclick="loadConfigGeral('tabRelatorio');" id="link_dadosgeraiscategorias">Relatórios</a>
									</li>
									<li id="li_tabs-5">
										<a href="#" onclick="loadConfigGeral('tabs-5');" id="link_dadosgeraisimagens">Funcionalidades e Módulos Adicionais</a>
									</li>
								</ul>
							</div>
							<div class="window_main" style="padding: 10px;">
								<div id="tabRelatorio" style="display: none;">
						            <p id="msg_status_relatorios" style="color: red; font-weight: bold;">
						                &nbsp;
						            </p>
						            <div id="content_relatorios">
						            </div>
						            <!--button onclick="saveRelatorios(${cid});" value="Salvar">Salvar</button-->
						        </div>
						        
						        <div id="tabs-1" style="display: none;">
						            <div id="contentConfigAcesso">
						            </div>
						        </div>
						
						        <div id="rec_dividass" style="display: none;">
						            <div id="framRecDivida">
						            </div>
						        </div>
						
						        <div id="tabs-3" style="display: none;">
						            <p>Configurações das Interoperabilidades.</p>
						        </div>
						
						        <div id="tabs-5" style="display: none;">
						            <p id="msg_status_funcionalidades" style="color: red; font-weight: bold;">
						                &nbsp;
						            </p>
						            <div id="content_funcionalidade">
						            </div>
						        </div>
							</div>
						</div>
						<div class="abs window_bottom">
							<!-- Rodape -->
						</div>
					</div>
					<span class="abs ui-resizable-handle ui-resizable-se"></span>
				</div>
				
				
				<!--Preferencias-->
				<div id="window_network" class="abs window">
					<div class="abs window_inner">
						<div class="window_top">
							<span class="float_left"> <img
								src="assets/images/icons/Settings.png" width="16px" height="16px" /> Preferências </span><span
							class="float_right"> <a href="#" class="window_min"></a> <a
								href="#" class="window_resize"></a> <a href="#icon_dock_network"
								class="window_close"></a> </span>
						</div>
						<div class="abs window_content">
							<div class="window_aside">
								Configurações do plano de fundo
							</div>
							<div class="window_main">
								<table class="data">
									<thead>
										<tr>
											<th colspan="2">Selecione um wallpaper para ser aplicado</th>
										</tr>
									</thead>
									<tbody>										
										<tr  onclick="changeWallpaper('images/bkg/bkg0.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg0.jpg" /></td><td>Background Compsis</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg1.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg1.jpg" /></td><td>Background 1</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg2.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg2.jpg" /></td><td>Background 2</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg3.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg3.jpg" /></td><td>Background 3</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg4.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg4.jpg" /></td><td>Background 4</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg5.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg5.jpg" /></td><td>Background 5</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg6.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg6.jpg" /></td><td>Background 6</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg7.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg7.jpg" /></td><td>Background 7</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg8.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg8.jpg" /></td><td>Background 8</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg9.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg9.jpg" /></td><td>Background 9</td>
										</tr>
										<tr  onclick="changeWallpaper('images/bkg/bkg10.jpg');">
											<td><img width="50px" height="50px" src="images/bkg/bkg10.jpg" /></td><td>Background 9</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="abs window_bottom">
							Troque seu Wallpaper
						</div>
					</div>
					<span class="abs ui-resizable-handle ui-resizable-se"></span>
				</div>
			</div>
			<div class="abs" id="bar_bottom">
				<a class="float_left" href="#" id="show_desktop" title="Show Desktop"> <img src="assets/images/icons/icon_22_desktop.png" /> </a>
				<ul id="dock">
					<li id="icon_dock_computer">
						<a href="#window_computer"> <img
						src="assets/images/icons/icon_16_page.png" height="22px" width="22px" /> Dados Gerais </a>
					</li>
					<li id="icon_dock_drive">
						<a href="#window_drive"> <img
						src="images/bandeira.png" height="22px" width="22px" /> Configuração Praça </a>
					</li>
					<li id="icon_dock_disc">
						<a href="#window_disc"> <img
						src="assets/images/icons/icon_16_system.png" height="22px" width="22px" /> Configurações Gerais </a>
					</li>
					<li id="icon_dock_network">
						<a href="#window_network"> <img
						src="assets/images/icons/Settings.png" height="22px" width="22px" /> Preferências </a>
					</li>
				</ul>
			</div>
		</div>
		<script
		src="js/jquery-ui.min_1.8.js"></script>
		<script>
			!window.jQuery && document.write(unescape('%3Cscript src="assets/js/jquery.js"%3E%3C/script%3E')); !window.jQuery.ui && document.write(unescape('%3Cscript src="assets/js/jquery.ui.js"%3E%3C/script%3E'));

		</script>
		<script src="assets/js/jquery.desktop.js"></script>
		<script>
			var _gaq = [['_setAccount', 'UA-166674-8'], ['_trackPageview']]; (function(d, t) {
				var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
				g.async = true;
				//g.src = '//www.google-analytics.com/ga.js';
				g.src = 'js/ga.js';
				s.parentNode.insertBefore(g, s);
			})(this.document, 'script');

		</script>
	</body>
	<head>
	<meta http-equiv="Cache-Control" content="No-Cache">
	<meta http-equiv="Pragma" content="No-Cache">
	<meta http-equiv="Expires" content="0">
	</head>
</html>