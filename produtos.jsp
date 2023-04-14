<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/produtos.css">
        <link rel="stylesheet" href="css/footer.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap');
            #logo{
                font-family: "Dancing Script", cursive;
                font-size: 2rem;
            }
        </style>
        <title>
            
        </title>
    </head>
    <body>
        
        <%

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

        //Cria a variavel sql com o comando de Inserir
        String sql = "SELECT * FROM produtos" ;

        PreparedStatement stm = conexao.prepareStatement(sql);

        ResultSet dados = stm.executeQuery(); 

        %>

        <header style="background-image: url('img/Desing_produtos.png'); height: 645px ;background-size: cover; background-position: center;">
            <nav>
                <ul style="align-items: center;">
                    <%@page language="java" import="java.sql.*"%>

                    <%
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
                            out.print("<li>");
                                out.print("<a id='logo' href='index.jsp?idCliente=" + idCliente + "'> Casa Bela </a>");
                            out.print("</li>");
                            out.print("<li>");
                                out.print("<a href='contato.html?idCliente=" + idCliente + "'> Contate-nos </a>");
                            out.print("</li>");
                            out.print("<li style='display: flex; align-items: center;'>");
                                out.print("<a href='perfil.jsp?idCliente=" + idCliente + "'> <svg width='24' height='24' viewBox='0 0 48 48' fill='currentColor'><path fill-rule='evenodd' clip-rule='evenodd' d='M24 3c5.523 0 10 4.477 10 10s-4.477 10-10 10-10-4.477-10-10S18.477 3 24 3zm18 35c0-7.714-6.477-12-12-12H18c-5.523 0-12 4.292-12 12v6a2 2 0 002 2h32a2 2 0 002-2v-6zm-12-8c3.742 0 8 2.956 8 8v4H10v-4c0-5.188 4.34-8 8-8h12zM18 13a6 6 0 1112 0 6 6 0 01-12 0z' fill='currentColor'/></svg> </a> <p> Olá, " + dadosCliente.getString("nome") + "</p>");
                                out.print("<a style='margin-left: 30px;' href='produtos.jsp'> Sair </a>");
                                out.print("<a id='shop-car' style='margin-left: 30px;' href='carrinho.jsp?idCliente=" + idCliente + "'> <svg width='30' height='30' viewBox='0 0 32 32' fill='white'><path fill-rule='evenodd' clip-rule='evenodd' d='M7.373 8.317a2.667 2.667 0 00-2.578-1.984H4.5l-.099.008A.667.667 0 004.5 7.667h.295l.126.006a1.333 1.333 0 011.183 1.07l1.85 9.415.039.168a2.667 2.667 0 002.578 1.985h11.7l.176-.006a2.667 2.667 0 002.386-1.924l1.574-5.473.045-.181a2.665 2.665 0 00-2.608-3.223H7.612l-.2-1.018-.039-.169zm.501 2.52l1.388 7.064c.115.584.6 1.015 1.182 1.07l.127.006h11.7c.548 0 1.035-.335 1.236-.836l.045-.129 1.573-5.473a1.333 1.333 0 00-1.153-1.696l-.128-.005H7.874zm.626 12.83a2.333 2.333 0 114.667 0 2.333 2.333 0 01-4.667 0zm3.333 0a1 1 0 10-2 0 1 1 0 002 0zm11.334-2.334a2.333 2.333 0 100 4.667 2.333 2.333 0 000-4.667zm0 1.334a1 1 0 110 2 1 1 0 010-2z' fill='white'/></svg> </a>");
                            out.print("</li>");
                        }else{
                            out.print("<li>");
                                out.print("<a href='produtos.jsp'> Produtos </a>");
                            out.print("</li>");
                            out.print("<li>");
                                out.print("<a href='contato.html'> Contate-nos </a>");
                            out.print("</li>");
                            out.print("<li> <a href='login.jsp'> Entre </a> ou <a href='cadastro.jsp'> Cadastre-se </a> </li>");
                        }
                    %>


                </ul>
            </nav>

            <div id="espaco-msg-flyer">
                <h1> Bem-Vindo </h1>
                <div id="espaco-flyer-texto"> <p> Sinta-se em Casa </p> <p style="font-size: 2.4rem; margin-left: 5px; margin-top: -8px;"> 🏠 </p> </div>
                <hr width="60%" color="oldlace" size="2px" style="margin-top: 15px; margin-bottom: 15px;">
                <div id="espaco-slogan">
                    <h3 style="font-family: 'Dancing Script', cursive;"> Casa Bela </h3> <p id="slogan"> Com você nas grandes e pequenas mudanças. </p>
                </div>
            </div>
        </header>
        
        <section id="sessao_produtos">
            <!--
            <div id="no-margin-left" class="caixa_produto">
                <div class="imagem_produto" style="background-image: url('sofa4.jpg'); background-size: cover; background-position: center center;">
                    
                </div>

                <div class="informacoes_produto">
                    <p> Sofa Cama Belize Algodão - Cinza </p>
                    <p style="margin-bottom: 30px;"> R$ 535,00 </p>
                    <a href=""> Comprar </a>
                </div>
            </div>
            -->

            
        <%@page language="java" import="java.sql.*" %>

        <%


        out.print("<section id='sessao_produtos'>");
        if(idCliente != null){
            while( dados.next() )
            {
                Integer id_produto = dados.getInt("id_produto");
                String preco = dados.getString("preco");
                String final_preco = preco.replace(".", ",");
                out.print("<div style='margin-right: 20px;' id='no-margin-left' class='caixa_produto'>");
                    out.print("<div class='imagem_produto' style='background-image: url(img/" + dados.getString("imagem") + "); background-size: cover; background-position: center center;'> </div> ");
                    out.print("<div class='informacoes_produto'>");
                        out.print("<p>");
                            out.print( dados.getString("nome") );
                        out.print("</p>");
                        out.print("<p style='margin-bottom: 30px;'>");
                            out.print("R$ " + final_preco);
                        out.print("</p>");
                        out.print("<a href='produto.jsp?idCliente=" + idCliente + "&id_produto=" + id_produto + "'>");
                        out.print("Comprar");
                        out.print("</a>");
                    out.print("</div>");
                out.print("</div>");
            }
            out.print("</section>");
        }else{
            while( dados.next() )
            {
                Integer id_produto = dados.getInt("id_produto");
                String preco = dados.getString("preco");
                String final_preco = preco.replace(".", ",");
                out.print("<div style='margin-right: 20px;' id='no-margin-left' class='caixa_produto'>");
                    out.print("<div class='imagem_produto' style='background-image: url(img/" + dados.getString("imagem") + "); background-size: cover; background-position: center center;'> </div> ");
                    out.print("<div class='informacoes_produto'>");
                        out.print("<p>");
                            out.print( dados.getString("nome") );
                        out.print("</p>");
                        out.print("<p style='margin-bottom: 30px;'>");
                            out.print("R$ " + final_preco);
                        out.print("</p>");
                        out.print("<a href='produto.jsp?id_produto=" + id_produto + "'>");
                        out.print("Comprar");
                        out.print("</a>");
                    out.print("</div>");
                out.print("</div>");
            }
            out.print("</section>");
        }
        %>

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