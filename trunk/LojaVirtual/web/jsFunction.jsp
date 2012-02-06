<script type="text/javascript">
    //primeiro chamamos a classe jQuery
    $().ready(function() {
        //depois configuramos o plugin Validation
        //Dizemos que o cadastro a ser validade é o de id cadastroForm
        $("#cadastroForm").validate({
            //configuramos onde aparecerão os avisos de erro
            wrapper: 'span',
            meta: "validate",
            //criamos as regras de validação
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
            //o segredo do envio via ajax está aqui
            //avisamos o plugin validate que quando estiver
            //tudo certo com o formulário, ele deve executar
            //uma função nativa do jQuery ao invés de deixar
            //o HTML enviar o formulário como faria normalmente
            submitHandler: function() {
                //pegamos os valores de todos os campos
                var valores = $("#cadastroForm").serialize();
                //e enviamos para a página demoajaxresult.php
                $.post("demoajaxresult.php", valores,
                function(data) {
                    //depois do envio, e receber o resultado
                    //escondemos o formulário
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