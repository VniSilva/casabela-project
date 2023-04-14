<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <head>
        <link rel="stylesheet" href="css/cadastro.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/footer.css">
        <a target="_blank" href="https://icons8.com/icon/118497/facebook-novo"></a><a target="_blank" href="https://icons8.com"></a>
        <a target="_blank" href="https://icons8.com/icon/V5cGWnc9R4xj/google-logo"></a><a target="_blank" href="https://icons8.com"></a>
        <meta charset="utf-8">
        <title>  </title>
    </head>
    <body>
        <script>
            const urlParams = new URLSearchParams(window.location.search);
            const myParam = urlParams.get("naoEncontrado");
            if(myParam == "True"){
                window.alert("Usuario não existe");
                document.getElementById("nao-existe").style.display = "flex";
            }

        </script>

        <section> 
            <div>
                <!-- <img style="height: 80px; margin-bottom: 20px;" src="logo.png" alt=""> -->
                <h2> Casa Bela </h2>
                <h1> Bem-Vindo </h1>
                <p>
                    Preencha os campos abaixo com suas informações para que possamos identifica-lo dentro do site.
                </p>


                <!-- Importa validarDados e resetaCor -->
                <script src="js/cadastro.js"></script>
                
                <script>
                    function validaLogin(){
                        var nome = document.getElementById("nome").value;
                        var senha = document.getElementById("senha").value;

                        if(senha == "" || nome == ""){
                            window.alert("Preencha todos os campos");
                        if(senha == ""){
                            document.getElementById("senha").style.border = "1px solid red";
                            document.getElementById("alerta-senha").style.display = "flex";
                            document.getElementById("senha").style.marginLeft = "36px";
                        }
                        if(nome == ""){
                            document.getElementById("nome").style.border = "1px solid red";
                            document.getElementById("alerta-nome").style.display = "flex";
                            document.getElementById("nome").style.marginLeft = "36px";
                        }
                        }else{
                            window.location = "grava_dados.jsp?nome=" + nome + "&senha=" + senha;
                        }
                    }
                </script>

                <script>
                    var nomeId = "nome";
                    var senhaId = "senha";
                </script>

                <form method="GET">
                    <input onkeyup="resetarCor(nomeId)" type="text" placeholder="Nome" id="nome" name="nome"> <div id="alerta-nome" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(senhaId)" type="password" placeholder="Senha" id="senha" name="senha"> <div id="alerta-senha" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                
                </form>

                <a onclick="validaLogin()" onclick="entrarUsuario()" id="continuar"> Continuar </a>

                <div id="espaco-ou">
                    <hr width="150px" color="black" size="1px" noshade=""> <span> ou </span> <hr width="150px" color="black" size="1px" noshade="">
                    <span> Entrar com </span>
                </div>

                <style>
                    #facebook-caixa:hover{
                        background-image: linear-gradient(to bottom, #3b5998, #344d83);
                    }
                    #google-caixa:hover{
                         background-image: linear-gradient(to bottom, #DB4437, #c74034);
                    }
                </style>

                <div id="espaco-entrar-com">
                    <div id="facebook-caixa" style="background-color: #3b5998;"> <img style="margin-right: 20px; margin-left: 20px;" src="img/icons8-facebook-num-círculo.svg" alt=""> <span> Entrar pelo Facebook </span> </div> 
                    <div id="google-caixa" style="background-color: #DB4437;"> <img style="margin-right: 27px; margin-left: 27px; height: 26px;" src="img/google-white.svg" alt=""> <span> Entrar pelo Google </span> </div>
                </div>
                <p id="msg-login"> Não tem uma conta? </p> <a id="link-login" href="cadastro.jsp"> Cadastre-se </a>
            </div>
        </section>

        <footer>
            <section>
                <nav id="no-margin-left" class="espaco-topico">
                    <ul>
                        <li> <h5> Empresa </h5> </li>
                        <li> <a href=""> Trabalhe conosco </a> </li>
                        <li> <a href=""> Sobre </a> </li>
                        <li> <a href=""> Parceria </a> </li>
                    </ul>
                </nav>

                <nav class="espaco-topico">
                    <ul>
                        <li> <h5> Links úteis </h5> </li>
                        <li> <a href="login.html"> Entrar </a> </li>
                        <li> <a href="cadastro.html"> Cadastro </a> </li>
                        <li> <a href="produtos.html"> Produtos </a> </li>
                    </ul>
                </nav>

                <nav class="espaco-topico">
                    <ul>
                        <li> <h5> Ajuda </h5> </li>
                        <li> <a href=""> Suporte </a> </li>
                        <li> <a href=""> Politica </a> </li>
                        <li> <a href=""> Cookies </a> </li>
                    </ul>
                </nav>
            </section>

            <div id="espaco-redes-sociais">
                <div id="titulos-redes-sociais"> <span> Redes Sociais </span> </div>
                <div id="no-margin-left" class="circ-rede-social"> <a href=""> <img style="height: 28px;" src="img/icons8-facebook-num-círculo.svg" alt=""> </a> </div>
                <div class="circ-rede-social"> <a href=""> <img style="height: 18px;" src="img/google-white.svg" alt=""> </a> </div>
            </div>

            <div id="espaco-linha-footer">
                <hr width="90%" size="1px" color="#7E7C75">
            </div>

            <div id="footer-principais-infos">
                <h4> Casa Bela </h4> 
                <span> 
                    Av. Pres. Humberto de Alencar Castelo Branco, 2367 - Vila Augusta, Guarulhos - SP, 07040-030 
                </span> 
                <span> © Casa Bela 2022 </span>
            </div>
        </footer>
    </body>
</html>