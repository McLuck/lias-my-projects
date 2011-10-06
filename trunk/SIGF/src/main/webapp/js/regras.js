var printResult = function(transport){
                var result = 
                        "Status : " + transport.status
                        + "\n"
                        + "\n"
                        + "Json-Result:"
                        + "\n" + transport.responseText;
                alert(result);
};
var addErrors = function(transport){
        var json = transport.responseText.evalJSON();
        
        var error = "Errorhandler Info: </br>"
        + "failture: " + json.failure +"</br>"
        + "status : + " + transport.status +"</br>"
        +"</br>"
        +"Spring Errorhandling: </br>"
        + "hasGlobalErrors : " + json.hasGlobalErrors +"</br>"
        + "</br>"
        + "hasFieldErrors : " + json.hasFieldErrors +"</br>";
        if(json.fielderrors.birthday)
                error = error + "birthday : " + json.fielderrors.birthday +"</br>";
        if(json.fielderrors.placeofbirth)
                error = error + "placeofbirth : " + json.fielderrors.placeofbirth +"</br>";
        
        $('error').innerHTML = error;
};
var myrules = {
        'button#clearData' : function(element){
                element.onclick = function(){
                        $('t_placeofbirth').innerHTML = '';
                        $('t_birthday').innerHTML = '';
                        $('error').innerHTML = '';
        },
        'button#sfc_postData' : function(element){
        
            new Ajax.Request('hello1.json', { 
                                method:'get',
                                onSuccess: function(transport){
                                        var json = transport.responseText.evalJSON();
                                        printResult(transport);
                                $('placeofbirth').value = json.command.placeofbirth;
                                $('birthday').value = json.command.birthday;
                        },
                        onFailure: function(transport){
                                var json = transport.responseText.evalJSON();
                                        printResult(transport);
                                        addErrors(transport);
                        }
                        
                        }); 
            
                element.onclick = function(){
                        new Ajax.Request('hello1.json', { 
                                method:'post',
                                parameters: $('form').serialize(false),
                                onSuccess: function(transport){
                                        var json = transport.responseText.evalJSON();
                                        printResult(transport);
                                        $('t_placeofbirth').innerHTML = json.command.placeofbirth;
                                $('t_birthday').innerHTML =  json.command.birthday;
                                $('error').innerHTML = '';
                        },
                        onFailure: function(transport){
                                var json = transport.responseText.evalJSON();
                                        printResult(transport);
                                        addErrors(transport);
                        }
                        
                        });
                }
        }
};
Behaviour.register(myrules);