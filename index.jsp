<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>  </title>
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
        <header style="background-image: url('img/imagem_sala2.jpg');">
            <nav>
                <div id="espaco-logo">
                    <li> <a href="#"> <img style="margin-top: 5px; height: 45px;" src="img/logo.png" alt=""> </a> </li>
                </div>
                <ul style="align-items: center;">
                    <%@page language="java" import="java.sql.*"%>

                    <%
                        // Verifica se o usuario logou
                        String idCliente = request.getParameter("idCliente");

                        if(idCliente != null){
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

                            // Transforma String para Int
                            Integer idClienteInt = Integer.parseInt(idCliente);

                            //Cria a variavel sql com o comando de Inserir
                            String sql = "SELECT * FROM usuarios WHERE idCliente=" + idClienteInt;

                            PreparedStatement stm = conexao.prepareStatement(sql);

                            ResultSet dados = stm.executeQuery();

                            dados.next();
                            out.print("<li>");
                                out.print("<a href='produtos.jsp?idCliente=" + idCliente + "'> Produtos </a>");
                            out.print("</li>");
                            out.print("<li>");
                                out.print("<a href='contato.html?idCliente=" + idCliente + "'> Contate-nos </a>");
                            out.print("</li>");
                            out.print("<li style='display: flex; align-items: center;'>");
                                out.print("<a href='perfil.jsp?idCliente=" + idCliente + "'> <svg width='24' height='24' viewBox='0 0 48 48' fill='currentColor'><path fill-rule='evenodd' clip-rule='evenodd' d='M24 3c5.523 0 10 4.477 10 10s-4.477 10-10 10-10-4.477-10-10S18.477 3 24 3zm18 35c0-7.714-6.477-12-12-12H18c-5.523 0-12 4.292-12 12v6a2 2 0 002 2h32a2 2 0 002-2v-6zm-12-8c3.742 0 8 2.956 8 8v4H10v-4c0-5.188 4.34-8 8-8h12zM18 13a6 6 0 1112 0 6 6 0 01-12 0z' fill='currentColor'/></svg> </a> <p style='margin-left: 10px;'> Olá, " + dados.getString("nome") + "</p> ");
                                out.print("<a style='margin-left: 30px;' href='index.jsp'> Sair </a>");
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


            <div id="espaco-ver-mais">
                <h1> Venha conhecer nossos produtos </h1>
                <a href="produtos.html"> Ver Moveis </a>
            </div>

            <div id="espaco-gradiente">

            </div>
        </header>

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
                        <li> <a href="login.jsp"> Entrar </a> </li>
                        <li> <a href="cadastro.jsp"> Cadastro </a> </li>
                        <li> <a href="produtos.jsp"> Produtos </a> </li>
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