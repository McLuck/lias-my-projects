<script type="text/javascript">
    //primeiro chamamos a classe jQuery
    $().ready(function() {
        //depois configuramos o plugin Validation
        //Dizemos que o cadastro a ser validade � o de id cadastroForm
        $("#cadastroForm").validate({
            //configuramos onde aparecer�o os avisos de erro
            wrapper: 'span',
            meta: "validate",
            //criamos as regras de valida��o
            rules: {
                nome: "required",
                email: {
                    required: true,
                    email: true
                },
                data_nascimento: {
                    required: true,
                    date: true
                },
                endereco: "required",
                numero: "required",
                bairro: "required",
                cidade: "required",
                estado: "required",
                telefone: {
                    required: true,
                    digits:true
                },
                senha: {
                    required: true,
                    minlength: 5
                },
                confirmacao_senha: {
                    required: true,
                    minlength: 5,
                    equalTo: "#senha"
                }
            },
            //o segredo do envio via ajax est� aqui
            //avisamos o plugin validate que quando estiver
            //tudo certo com o formul�rio, ele deve executar
            //uma fun��o nativa do jQuery ao inv�s de deixar
            //o HTML enviar o formul�rio como faria normalmente
            submitHandler: function() {
                //pegamos os valores de todos os campos
                var valores = $("#cadastroForm").serialize();
                //e enviamos para a p�gina demoajaxresult.php
                $.post("demoajaxresult.php", valores,
                function(data) {
                    //depois do envio, e receber o resultado
                    //escondemos o formul�rio
                    $("#cadastroForm").slideUp("fast");
                    //escrevemos o resultado dentro da tag content
                    $("#content").html(data);
                    //e pedimos para exibir
                    $("pre").slideDown("slow");
                });
            }
        });
    });
</script>