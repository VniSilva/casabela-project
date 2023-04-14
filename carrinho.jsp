<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/carrinho.css">
    <title>  </title>
</head>
<body>
    <header style="background-color: black;">
    <nav style="margin-bottom: 80;">
        <div id="espaco-logo">
            <li> <a href="index.html"> <img style="margin-top: 5px; height: 45px;" src="img/logo.png" alt=""> </a> </li>
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
    </header>

    <script>
        function excluir_item(id_pedido, id_cliente) {
            confirmacao = window.confirm("Tem certeza que deseja excluir este item? ");
            if(confirmacao){
                window.location = "excluir_produto.jsp?id_pedido=" + id_pedido + "&id_cliente=" + id_cliente;
            }else{
                
            }
        }
    </script>

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
        String sql = "SELECT * FROM pedidos WHERE id_usuario=" + idCliente ;

        PreparedStatement stm = conexao.prepareStatement(sql);

        ResultSet dados = stm.executeQuery() ;

        Float valor = 0F;
        
        out.print("<section>");
            out.print("<div id='espaco-titulo-items'> <h1> Itens comprados </h1> </div>");
        if(!dados.isBeforeFirst() ){
                out.print("<div style='width: 100%; text-align: center; margin-bottom: 20px;'> <h1> Seu carrinho está vázio </h1> </div>");
                out.print("<div style='width: 100%; text-align: center; margin-bottom: 20px;'> <p style='font-size: 5rem;'> 🛠 </p> </div>");
                out.print("<div> <a href='produtos.jsp?idCliente=" + idCliente + "'> ver Produtos </a> </div>");
            out.print("</section>");
        }else{
            while(dados.next()){

            Integer id_produto = dados.getInt("id_produto");
            Integer id_pedido = dados.getInt("id_pedido");

            String slqProduto = "SELECT * FROM produtos WHERE id_produto=" + id_produto;
            PreparedStatement stmProdutos = conexao.prepareStatement(slqProduto);
            ResultSet dadosProduto = stmProdutos.executeQuery();

            dadosProduto.next();

            valor +=  dadosProduto.getFloat("preco");

            String preco = dadosProduto.getString("preco");
            String final_preco = preco.replace(".", ",");

            out.print("<div id='container-item'>");
                out.print("<div id='espaco-excluir'> <button onclick='excluir_item(" + id_pedido + ", " + idCliente + ")'> X </button> </div>");
                out.print("<div id='campo-imagem'> <img src='img/" + dadosProduto.getString("imagem") + "' alt=''> </div>");
                out.print("<table>");
                    out.print("<tr>");
                        out.print("<td> Produto </td>");
                        out.print("<td> Preço </td>");
                        out.print("<td> Data </td>");
                    out.print("</tr>");
                    out.print("<tr>");
                        out.print("<td> <p> " + dadosProduto.getString("nome") + " </p> </td>");
                        out.print("<td> R$ " + final_preco + " </td>");
                        out.print("<td> " + dados.getDate("data_pedido") + " </td> ");
                    out.print("</tr>");
                out.print("</table>");
                out.print("</div>");
            }
            out.print("</section>");
        }
    %>
    <!--
    <section>
        <div id="espaco-titulo-items"> <h1> Itens comprados </h1> </div>
        <div id="container-item">
            <div id="campo-imagem"> <img src="sofa.webp" alt=""> </div>
            <table>
                <tr>
                    <td> Produto </td>
                    <td> Preço </td>
                    <td> Data </td> 
                </tr>
                <tr>
                    <td> <p> Sofa retratil marrom </p> </td>
                    <td> 99,00 </td>
                    <td> 05/11/2022 </td>
                </tr>
            </table>
        </div>
    </section>
    -->

    <div id="espaco-valores">
        <div> <h1> Total </h1> </div>
        <table>
            <tr>
                <td> Valor total </td>
            </tr>
            <tr>
                <% 
                    String valorTxt = Float.toString(valor);
                    String valorTxtFinal = valorTxt.replace(".",",");
                %>
                <td> <% out.print("R$ " + valorTxtFinal); %> </td>
            </tr>
        </table>
    </div>

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