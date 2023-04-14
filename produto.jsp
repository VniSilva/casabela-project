<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/produto.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>  </title>
    <style>
        #botao_comprar:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
    <header style="height: 60px; background-color: #333333; color: #ddd9cf;">
        <nav style="height: 100%;">

                <script>
                    const urlParams = new URLSearchParams(window.location.search);
                    const myParam = urlParams.get("naoLogado");
                    if(myParam == "True"){
                        confirmacao = window.confirm("Você não está logado.\nGostaria de fazer login?");
                        if(confirmacao){
                            window.location = "login.jsp";
                        }else{
                            window.location = "produtos.jsp";
                        }
                    }
                </script>

                <%@page language="java" import="java.sql.*"%>

                    <%

                        Integer id_produto = Integer.parseInt(request.getParameter("id_produto"));

                        // variaveis para o banco de dados
                        String banco    = "bd_casabela";
                        String endereco = "jdbc:mysql://localhost:3306/" + banco ;
                        String usuario  = "root" ;
                        String senha    = "" ;

                        String driver   = "com.mysql.jdbc.Driver" ;

                        //Carregar o driver na memoria
                        Class.forName( driver );

                        //cria a variavel para conectar com o banco
                        Connection conexao ;
                        //Abrir a conexao com o banco de dados
                        conexao = DriverManager.getConnection(endereco, usuario, senha) ;
                        // Verifica se o usuario logou

                        String idCliente = request.getParameter("idCliente");

                        if(idCliente != null){

                            // Transforma String para Int
                            Integer idClienteInt = Integer.parseInt(idCliente);

                            //Cria a variavel sql com o comando de Inserir
                            String sqlCliente = "SELECT * FROM usuarios WHERE idCliente=" + idClienteInt;

                            PreparedStatement stmCliente = conexao.prepareStatement(sqlCliente);

                            ResultSet dadosCliente = stmCliente.executeQuery();

                            dadosCliente.next();
                            out.print("<div id='espaco-logo'>");
                                out.print("<li> <a href='index.jsp?idCliente=" + idCliente + "'> <img style='margin-top: 5px; height: 45px;'' src='img/logo.png' alt=''> </a> </li>");
                            out.print("</div>");
                            out.print("<ul style='display: flex; align-items: center;'>");
                                out.print("<li>");
                                    out.print("<a href='produtos.jsp?idCliente=" + idCliente + "'> Produtos </a>");
                                out.print("</li>");
                                out.print("<li>");
                                    out.print("<a href='contato.html?idCliente=" + idCliente + "'> Contate-nos </a>");
                                out.print("</li>");
                                out.print("<li style='display: flex; align-items: center;'>");
                                    out.print("<a href='perfil.jsp?idCliente=" + idCliente + "'> <svg width='24' height='24' viewBox='0 0 48 48' fill='currentColor'><path fill-rule='evenodd' clip-rule='evenodd' d='M24 3c5.523 0 10 4.477 10 10s-4.477 10-10 10-10-4.477-10-10S18.477 3 24 3zm18 35c0-7.714-6.477-12-12-12H18c-5.523 0-12 4.292-12 12v6a2 2 0 002 2h32a2 2 0 002-2v-6zm-12-8c3.742 0 8 2.956 8 8v4H10v-4c0-5.188 4.34-8 8-8h12zM18 13a6 6 0 1112 0 6 6 0 01-12 0z' fill='currentColor'/></svg> </a> <p> Olá, " + dadosCliente.getString("nome") + "</p>");
                                    out.print("<a style='margin-left: 30px;' href='produto.jsp?id_produto=" + id_produto + "'> Sair </a>");
                                    out.print("<a id='shop-car' style='margin-left: 30px;' href='carrinho.jsp?idCliente=" + idCliente + "'> <svg width='30' height='30' viewBox='0 0 32 32' fill='white'><path fill-rule='evenodd' clip-rule='evenodd' d='M7.373 8.317a2.667 2.667 0 00-2.578-1.984H4.5l-.099.008A.667.667 0 004.5 7.667h.295l.126.006a1.333 1.333 0 011.183 1.07l1.85 9.415.039.168a2.667 2.667 0 002.578 1.985h11.7l.176-.006a2.667 2.667 0 002.386-1.924l1.574-5.473.045-.181a2.665 2.665 0 00-2.608-3.223H7.612l-.2-1.018-.039-.169zm.501 2.52l1.388 7.064c.115.584.6 1.015 1.182 1.07l.127.006h11.7c.548 0 1.035-.335 1.236-.836l.045-.129 1.573-5.473a1.333 1.333 0 00-1.153-1.696l-.128-.005H7.874zm.626 12.83a2.333 2.333 0 114.667 0 2.333 2.333 0 01-4.667 0zm3.333 0a1 1 0 10-2 0 1 1 0 002 0zm11.334-2.334a2.333 2.333 0 100 4.667 2.333 2.333 0 000-4.667zm0 1.334a1 1 0 110 2 1 1 0 010-2z' fill='white'/></svg> </a>");
                                out.print("</li>");
                            out.print("</ul>");
                        }
                        else{
                            out.print("<div id='espaco-logo'>");
                                out.print("<li> <a href='index.jsp'> <img style='margin-top: 5px; height: 45px;'' src='logo.png' alt=''> </a> </li>");
                            out.print("</div>");
                            out.print("<ul>");
                                out.print("<li>");
                                    out.print("<a href='produtos.jsp'> Produtos </a>");
                                out.print("</li>");
                                out.print("<li>");
                                    out.print("<a href='contato.html'> Contate-nos </a>");
                                out.print("</li>");
                                out.print("<li> <a href='login.jsp'> Entre </a> ou <a href='cadastro.jsp'> Cadastre-se </a> </li>");
                            out.print("</ul>");
                        }
                    %>
        </nav>
    </header>

    <script>
        function avaliarProduto(estrelas){
                        
            var numEstrelas = estrelas;
            var iterador = 1;

            while(iterador <= numEstrelas){
                document.getElementById("estrela-" + String(iterador)).src = "img/star-fill.png";
                iterador++;
            }

            iterador = 1;
            while(iterador <= 5){
                if(iterador > numEstrelas){
                    document.getElementById("estrela-" + String(iterador)).src = "img/collection.png";
                }
                iterador++;
            }

            document.getElementById("avaliacao").value = numEstrelas;
        }
    </script>

    <%@page language="java" import="java.sql.*" %>

    <% 

        //Cria a variavel sql com o comando de Inserir
        String sql = "SELECT * FROM produtos WHERE id_produto=" + id_produto ;

        PreparedStatement stm = conexao.prepareStatement(sql);

        ResultSet dados = stm.executeQuery(); 

        while(dados.next()){
            String preco = dados.getString("preco");
            Integer num_avaliacoes = dados.getInt("num_avaliacoes");
            Integer media = dados.getInt("avaliacao") / dados.getInt("num_avaliacoes");
            

            
            
            String final_preco = preco.replace(".", ",");
            out.print("<div id='espaco-path'> <a id='no-margin-left' href='index.jsp'> <svg width='20' height='20' viewBox='0 0 48 48' fill='none'><path d='M7 17L24 7l17 10v24H7V17z' stroke='#7b2020' stroke-width='3'/><path d='M20 28h8v13h-8V28z' stroke='#7b2020' stroke-width='3'/></svg> </a> <p> / </p> <a href='produtos.jsp'> produtos </a> <p> / </p> <h4> compra </h4>  </div>");
            out.print("<form action='compra.jsp' style='width: 100%; height: 100%; display: flex; justify-content: center;' method='GET'>");
            out.print("<section id='sessao-produto'>");
                out.print("<input type='hidden' name='avaliacao' value='' id='avaliacao'>");
                out.print("<input type='hidden' name='idCliente' value='" + idCliente + "'>");
                out.print("<input type='hidden' name='id_produto' value='" + id_produto + "'>");
                out.print("<div class='produto-container' id='espaco-nome-imagem-produto'>");
                    out.print("<div id='espaco-nome-preco'> <h2>" + dados.getString("nome") + "</h2> <h3> " + final_preco + " </h3> </div>");
                    out.print("<div id='espaco-imagem-produto'>");
                        out.print("<img src='img/" + dados.getString("imagem") + "' alt='" + dados.getString("nome") + "'>");
                    out.print("</div>");
                    out.print("<div id='espaco-avaliacoes'> ");
                        out.print("<div> <p> Avalie este item </p> </div>");
                        out.print("<div>");
                            out.print("<img id='estrela-1' onclick='avaliarProduto(1)' style='height: 24px; cursor: pointer; margin-right: 10px;' src='img/collection.png' alt=''>");
                            out.print("<img id='estrela-2' onclick='avaliarProduto(2)' style='height: 24px; cursor: pointer; margin-right: 10px;' src='img/collection.png' alt=''>");
                            out.print("<img id='estrela-3' onclick='avaliarProduto(3)' style='height: 24px; cursor: pointer; margin-right: 10px;' src='img/collection.png' alt=''>");
                            out.print("<img id='estrela-4' onclick='avaliarProduto(4)' style='height: 24px; cursor: pointer; margin-right: 10px;' src='img/collection.png' alt=''>");
                            out.print("<img id='estrela-5' onclick='avaliarProduto(5)' style='height: 24px; cursor: pointer; margin-right: 10px;' src='img/collection.png' alt=''>");
                            out.print("<h6 style='font-size: 1.05rem; margin-right: 20px;'> (" + media + ") </h6> <span> n° de avaliações " + dados.getInt("num_avaliacoes") + " </span> ");
                        out.print("</div>");
                    out.print("</div>");
                out.print("</div>");
                out.print("<div id='espaco-descricao-produto' class='produto-container'>");
                    out.print("<div id='descricao-produto'>");
                        out.print("<h2 style='margin-bottom: 30px;'> Descrição do produto </h2> ");
                        out.print("<p>" + dados.getString("descricao") + "</p>");
                    out.print("</div>");
                    out.print("<div>");
                        out.print("<p> Quantidade em estoque: " + dados.getInt("qtd") + " </p>");
                    out.print("</div>");
                    out.print("<div id='espaco-carrinho'>");
                        out.print("<a href=''>");
                            out.print("<svg width='28' height='28' viewBox='0 0 32 32' fill='currentColor'><path fill-rule='evenodd' clip-rule='evenodd' d='M7.373 8.317a2.667 2.667 0 00-2.578-1.984H4.5l-.099.008A.667.667 0 004.5 7.667h.295l.126.006a1.333 1.333 0 011.183 1.07l1.85 9.415.039.168a2.667 2.667 0 002.578 1.985h11.7l.176-.006a2.667 2.667 0 002.386-1.924l1.574-5.473.045-.181a2.665 2.665 0 00-2.608-3.223H7.612l-.2-1.018-.039-.169zm.501 2.52l1.388 7.064c.115.584.6 1.015 1.182 1.07l.127.006h11.7c.548 0 1.035-.335 1.236-.836l.045-.129 1.573-5.473a1.333 1.333 0 00-1.153-1.696l-.128-.005H7.874zm.626 12.83a2.333 2.333 0 114.667 0 2.333 2.333 0 01-4.667 0zm3.333 0a1 1 0 10-2 0 1 1 0 002 0zm11.334-2.334a2.333 2.333 0 100 4.667 2.333 2.333 0 000-4.667zm0 1.334a1 1 0 110 2 1 1 0 010-2z' fill='currentColor'/></svg> <p> Adicionar ao Carrinho </p> ");
                        out.print("</a>");
                    out.print("</div>");

                    // Verifica se usuario esta logado
            if(idCliente != null){
                        out.print("<div id='espaco-compra'>");
                            out.print("<input style='display: none;' type='submit' id='enviar' name='enviar' value='Comprar'>");
                            out.print("<label style='height: 40px; width: 250px; background-color: #b02f38; border-radius: 5px;'  id='botao_comprar' for='enviar'> <a> <svg width='26' height='26' viewBox='0 0 32 32' fill='currentColor'><path fill-rule='evenodd' clip-rule='evenodd' d='M24.603 12.195l.742-3.15a1.67 1.67 0 00-2.008-2.008l-3.15.742a13.67 13.67 0 00-6.248 3.366l-.006.023-.015-.003c-.087.082-.173.165-.257.25l-3.826 3.822 7.31 7.31 3.823-3.825c.085-.085.168-.17.25-.257l-.003-.016.023-.005a13.67 13.67 0 003.365-6.249zm-4.72-5.71a15 15 0 00-6.34 3.227l-3.388-.79a2.665 2.665 0 00-2.489.712l-1.123 1.123a2.165 2.165 0 000 3.062l1.414 1.414-.004.004 9.193 9.192.003-.003 1.415 1.414a2.165 2.165 0 003.061 0l1.124-1.124c.65-.65.92-1.592.71-2.489l-.788-3.387a15 15 0 003.227-6.34l.742-3.15c.511-2.169-1.438-4.119-3.608-3.607l-3.15.742zm-10.03 3.733l2.533.59-3.488 3.485-1.415-1.414a.835.835 0 010-1.181l1.124-1.124c.326-.326.797-.46 1.246-.356zm11.722 9.778l-3.486 3.489 1.415 1.414a.835.835 0 001.18 0l1.124-1.123c.326-.326.461-.798.357-1.247l-.59-2.533zm-4.196-4.992a1.17 1.17 0 101.655-1.655 1.17 1.17 0 00-1.655 1.655zm-.94.94a2.5 2.5 0 103.535-3.536 2.5 2.5 0 00-3.535 3.536zm-8.097 9.341a.667.667 0 01-1.008-.868l.065-.074 3.298-3.299a.667.667 0 011.007.869l-.064.074-3.298 3.298zm-1.338-4.621c.26.26.683.26.943 0l1.185-1.185.064-.074a.667.667 0 00-1.007-.868L7.004 19.72l-.064.075a.667.667 0 00.064.868zm4.947 4.95c.26.26.683.26.943 0l1.184-1.185.065-.075a.667.667 0 00-1.007-.868l-1.185 1.185-.064.075a.667.667 0 00.064.868z' fill='currentColor'/></svg> <p> Comprar </p> </a> </label>");
                        out.print("</div>");
                    out.print("<div>");
                    out.print("</div>");
                out.print("</section>");
                out.print("</form>");
            }else{
                out.print("<div id='espaco-compra'>");
                            out.print("<a href='produto.jsp?id_produto=" + id_produto + "&naoLogado=True'>");
                                out.print("<svg width='26' height='26' viewBox='0 0 32 32' fill='currentColor'><path fill-rule='evenodd' clip-rule='evenodd' d='M24.603 12.195l.742-3.15a1.67 1.67 0 00-2.008-2.008l-3.15.742a13.67 13.67 0 00-6.248 3.366l-.006.023-.015-.003c-.087.082-.173.165-.257.25l-3.826 3.822 7.31 7.31 3.823-3.825c.085-.085.168-.17.25-.257l-.003-.016.023-.005a13.67 13.67 0 003.365-6.249zm-4.72-5.71a15 15 0 00-6.34 3.227l-3.388-.79a2.665 2.665 0 00-2.489.712l-1.123 1.123a2.165 2.165 0 000 3.062l1.414 1.414-.004.004 9.193 9.192.003-.003 1.415 1.414a2.165 2.165 0 003.061 0l1.124-1.124c.65-.65.92-1.592.71-2.489l-.788-3.387a15 15 0 003.227-6.34l.742-3.15c.511-2.169-1.438-4.119-3.608-3.607l-3.15.742zm-10.03 3.733l2.533.59-3.488 3.485-1.415-1.414a.835.835 0 010-1.181l1.124-1.124c.326-.326.797-.46 1.246-.356zm11.722 9.778l-3.486 3.489 1.415 1.414a.835.835 0 001.18 0l1.124-1.123c.326-.326.461-.798.357-1.247l-.59-2.533zm-4.196-4.992a1.17 1.17 0 101.655-1.655 1.17 1.17 0 00-1.655 1.655zm-.94.94a2.5 2.5 0 103.535-3.536 2.5 2.5 0 00-3.535 3.536zm-8.097 9.341a.667.667 0 01-1.008-.868l.065-.074 3.298-3.299a.667.667 0 011.007.869l-.064.074-3.298 3.298zm-1.338-4.621c.26.26.683.26.943 0l1.185-1.185.064-.074a.667.667 0 00-1.007-.868L7.004 19.72l-.064.075a.667.667 0 00.064.868zm4.947 4.95c.26.26.683.26.943 0l1.184-1.185.065-.075a.667.667 0 00-1.007-.868l-1.185 1.185-.064.075a.667.667 0 00.064.868z' fill='currentColor'/></svg> <p> Comprar </p>");
                            out.print("</a>");
                        out.print("</div>");
                    out.print("<div>");
                    out.print("</div>");
                out.print("</section>");
                out.print("</form>");
            }
        }

        /*
        
        */
    %>

    <footer style="margin-top: 100px;">
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
                    <li> <a href="cadastro.jsp"> Cadastro </a> </li>
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
            <div id="no-margin-left" class="circ-rede-social"> <a href=""> <img  style="margin-top: 5px; height: 28px;" src="img/icons8-facebook-num-círculo.svg" alt=""> </a> </div>
            <div class="circ-rede-social"> <a href=""> <img style="margin-top: 5px; height: 18px;" src="img/google-white.svg" alt=""> </a> </div>
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