<%@include file="include.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <link rel="stylesheet" href="<%=pathCSS%>themes/base/jquery.ui.all.css">
        <link rel="stylesheet" href="<%=pathCSS%>support.css">
        <link rel="stylesheet" href="<%=pathCSS%>vtabs.css">

        <script type="text/javascript" src="<%=pathJS%>jquery.js"></script>
        <script type="text/javascript" src="<%=pathJS%>ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="<%=pathJS%>ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="<%=pathJS%>ui/jquery.ui.tabs.js"></script>


        <script type="text/javascript" src="<%=pathJS%>concessionaria.js"></script>
        <script type="text/javascript" src="<%=pathJS%>jquery.dataTables.js"></script>
        <link href="<%=pathCSS%>jquery-ui_1.8.css" rel="stylesheet" type="text/css"/>
        
        



        <script type="text/javascript">
            $(function() {
                $("#vtabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-tabs-nav');
                $("#vtabs li").removeClass('ui-corner-top').addClass('ui-corner-left');
		
            });
        </script>