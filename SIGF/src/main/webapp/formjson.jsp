<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <title>
                First Test Spring Json Demo
        </title>
        <script type="text/javascript" src="js/prototype.js"></script>
        <script type="text/javascript" src="js/behaviour.js"></script>
        <script type="text/javascript" src="js/regras.js"></script>
        <meta content="text/html; charset=ISO-8859-1" http-equiv="Content-Type"/>
</head>
</head>
<body>
        <h1>Spring JSON DEMO</h1>
        <h2>Spring Ajax Post (SimpleFormControler and CommandController)</h2>
        <form method="post" id="form">
                <input id="placeofbirth" type="text" name="placeofbirth" ><br>
                <input id="birthday" type="text" name="birthday" ><br/>
                <br/>
                <b>place of birth : </b><span id="t_placeofbirth"></span><br/>
                <b>birthday : </b><span id="t_birthday"></span><br/>
        
        </form>
        <br/>
        <span id ="error" ></span>
        <br/>
        <button id="clearData">clear name</button>
        <<button id="sfc_postData">send data to SimpleFormController</button>
</body>
</html>