<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <head>
        <link rel="stylesheet" href="css/cadastro.css">
        <link rel="stylesheet" href="css/footer.css">
        <meta charset="utf-8">
        <title>  </title>
        <a target="_blank" href="https://icons8.com/icon/114441/facebook-num-círculo"></a><a target="_blank" href="https://icons8.com"></a>
    </head>
    <body>
        <section> 
            <div>

                <h2> Casa Bela </h2>
                <h1> Vamos Começar </h1>
                <p>
                    Preencha os campos abaixo com suas informações para que possamos identifica-lo dentro do site.
                </p>
                <form method="GET">
                    
                    <!-- Importa resetarCor e validaDados -->
                    <script src="js/cadastro.js">

                    </script>
                    
                    <script> 
                        var idNome = "nome"; 
                        var idSenha = "senha";
                        var idConfirmaSenha = "confirma-senha";
                        var idEmail = "email";
                        var idNascimento = "nascimento";
                        var idEndereco = "endereco";
                        var idNumero = "numero";
                        var idComplemento = "complemento";
                        var idBairro = "bairro";
                        var idEstado = "estado";
                        var idCidade = "cidade";
                        var idCpf = "cpf";
                        var idCep = "cep";
                    </script>
                
                    <input onkeyup="resetarCor(idNome)" type="text" placeholder="Nome" name="nome" id="nome"> <div id="alerta-nome" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(idSenha)" type="password" placeholder="Senha" name="senha" id="senha"> <div id="alerta-senha" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(idConfirmaSenha)" type="password" placeholder="Confirmar Senha" name="confirma-senha" id="confirma-senha"> <div id="alerta-confirma-senha" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>

                    <input onkeyup="resetarCor(idEmail)" type="text" placeholder="Email" name="email" id="email"> <div id="alerta-email" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>

                    <input onkeyup="resetarCor(idNascimento)" id="nascimento" type="date" name="nascimento"> <div id="alerta-nascimento" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(idEndereco)" type="text" placeholder="Endereço" name="endereco" id="endereco"> <div id="alerta-endereco" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(idNumero)" type="text" placeholder="Numero Residencial" name="numero" id="numero"> <div id="alerta-numero" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>

                    <input onkeyup="resetarCor(idComplemento)" type="text" placeholder="Complemento" name="complemento" id="complemento"> <div id="alerta-complemento" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>

                    <input onkeyup="resetarCor(idBairro)" type="text" placeholder="Bairro" name="bairro" id="bairro"> <div id="alerta-bairro" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(idEstado)" type="text" placeholder="Estado" name="estado" id="estado"> <div id="alerta-estado" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>

                    <input onkeyup="resetarCor(idCidade)" type="text" placeholder="Cidade" name="cidade" id="cidade"> <div id="alerta-cidade" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>

                    <input onkeyup="resetarCor(idCpf)" type="text" placeholder="CPF (somente numeros)" name="cpf" id="cpf"> <div id="alerta-cpf" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                    
                    <input onkeyup="resetarCor(idCep)" type="text" placeholder="CEP (somente numeros)" name="cep" id="cep"> <div id="alerta-cep" class="espaco-alerta"> <svg width="28" height="28" viewBox="0 0 48 48" fill="none"><path d="M42 24c0 9.941-8.059 18-18 18S6 33.941 6 24 14.059 6 24 6s18 8.059 18 18z" fill="#dd4f4f" stroke="#dd4f4f" stroke-width="2"/><path d="M24 28V14M24 30v4" stroke="#fff" stroke-width="2"/></svg> </div>
                </form>
                <a id="continuar" onclick="validaDados()"> Continuar </a>

                <div id="espaco-ou">
                    <hr width="150px" color="black" size="1px" noshade=""> <span> ou </span> <hr width="150px" color="black" size="1px" noshade="">
                </div>
                <div id="espaco-entrar-com">

                    <style>
                        #facebook-caixa:hover{
                            background-image: linear-gradient(to bottom, #3b5998, #344d83);
                        }
                        #google-caixa:hover{
                            background-image: linear-gradient(to bottom, #DB4437, #c74034);
                        }
                    </style>

                    <div id="facebook-caixa" style="background-color: #3b5998;"> <img style="margin-right: 20px; margin-left: 20px;" src="img/icons8-facebook-num-círculo.svg" alt=""> <span> Acessar com Facebook </span> </div> 
                    <div id="google-caixa" style="background-color: #DB4437;"> <img style="margin-right: 27px; margin-left: 27px; height: 26px;" src="img/google-white.svg" alt=""> <span> Acessar com Google </span> </div>
                </div>
                <p id="msg-login"> Já tem uma conta? </p> <a id="link-login" href="login.jsp"> Login </a>
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