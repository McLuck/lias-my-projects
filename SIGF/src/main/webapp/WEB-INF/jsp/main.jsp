
<%@include file="include_vtab.jsp" %>

<script type="text/javascript" src="<%=pathJS%>main.js"></script>
<style type="text/css" title="currentStyle"> 
    @import "<%=pathCSS%>demo_page.css";
    @import "<%=pathCSS%>demo_table.css";

</style> 

<script type="text/javascript">
                            
    $(document).ready(function() {
        clickVTab(1);
    });
    
    function showWait(){
    	$("#busy_frame").show();
    }
    function hideWait(){
    	setTimeout("setHide()", 300);
    }
    function setHide(){
    	$("#busy_frame").hide();
    }
</script>
</head>
<body>
    
    <input type="hidden" id="cidd" value="${cid}" name="cidd" />
	
	<div id="busy_frame" style="background-color:white; background-repeat: no-repeat; text-align: left; border solid blue 1px; padding-top: 2%; width: 90%; height: 100%; z-index: 91;position: absolute; top: 0px; left: 15em; display: none;">
		<img src="images/wait.gif" alt="WAIT" title="WAIT" style="border: 0px;" id="icon_wait" />
	</div>
    <div id="main">
        <div id="vtabs">
            <ul>
                <li><a href="#vtabs-1" onclick="clickVTab(1);">Concessionária</a></li>
                <li><a href="#vtabs-2" onclick="clickVTab(2);">Praça</a></li>
                <li><a href="#vtabs-3" onclick="clickVTab(3);">Configurações</a>
                </li>
            </ul>
            <div id="vtabs-1"></div>

            <div id="vtabs-2"></div>

            <div id="vtabs-3"></div>
        </div>
        <div id="contents">
            <div id="cont_t1" class="contents_tabs"></div>
            <div id="cont_t2" class="contents_tabs"></div>
            <div id="cont_t3" class="contents_tabs"></div>
        </div>
    </div>

</body>
</html>