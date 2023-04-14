<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="footer.css">
        <link rel="stylesheet" href="compra.css">
        <title>  </title>
    </head>
    <body>

        <%@page language="java" import="java.sql.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
        <%@page language="java" import="java.sql.*" %>
        <%@page language="java" import="java.util.*"%>

        <%
            String avaliacao = request.getParameter("avaliacao");
            Integer idCliente = Integer.parseInt(request.getParameter("idCliente"));
            Integer idProduto = Integer.parseInt(request.getParameter("id_produto"));
            SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date dataAtual = new java.util.Date();
            String datatxt = formato.format(dataAtual);
            java.sql.Date dataSql = new java.sql.Date( formato.parse(datatxt).getTime() );


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
            String sql = "INSERT INTO pedidos (id_produto, id_usuario, data_pedido) VALUES (?, ?, ?);";

            String sqlSelect = "SELECT * FROM produtos WHERE id_produto=" + idProduto;

            PreparedStatement stmSelect = conexao.prepareStatement(sqlSelect);

            ResultSet dadosProduto = stmSelect.executeQuery();

            dadosProduto.next();

            Integer qtd = dadosProduto.getInt("qtd"); 

            Integer novaQtd = (qtd - 1);

            if(avaliacao != ""){
                Integer avaliacaoInt = Integer.parseInt(avaliacao);
                
                Integer num_avaliacoes = dadosProduto.getInt("num_avaliacoes");
                
                Integer avaliacoes = dadosProduto.getInt("avaliacao");
                
                
                Integer totalNumAvaliacoes = num_avaliacoes + 1;

                Integer totalAvalicoes = avaliacoes + avaliacaoInt; 

                String sqlUpdate = "UPDATE produtos SET qtd=?, avaliacao=?, num_avaliacoes=? WHERE id_produto=" + idProduto;

                PreparedStatement stmUpdate = conexao.prepareStatement(sqlUpdate);

                stmUpdate.setInt(1, novaQtd);
                stmUpdate.setInt(2, totalAvalicoes);
                stmUpdate.setInt(3, totalNumAvaliacoes);

                stmUpdate.execute();
                stmUpdate.close();
            }else{
                String sqlUpdate = "UPDATE produtos SET qtd=? WHERE id_produto=" + idProduto;

                PreparedStatement stmUpdate = conexao.prepareStatement(sqlUpdate);

                stmUpdate.setInt(1, novaQtd);

                stmUpdate.execute();
                stmUpdate.close();
            }
            
            
            PreparedStatement stm = conexao.prepareStatement(sql);

            stm.setInt(1, idProduto);
            stm.setInt(2, idCliente); 
            stm.setDate(3, dataSql);

            stm.execute();
            stm.close();
        %>

        <main>
            <section>
                <div id="espaco-msg">
                    <h1> Casa Bela </h1>
                    <h2> Parábens sua compra foi realizada com sucesso </h1> 
                    <div id="espaco-emotes"> 🥳 🎉 </div>
                    <p> A transferência se dará na hora da entrega.<br>Será aceito cartão de crédito ou débito </p>
                    <div id="espaco-ou"> <hr noshade="" color="black" size="2px" width="100px"> <h6> ou </h6> <hr noshade="" color="black" size="2px" width="100px"> </div>
                    <p> Caso prefira fazer o pagamento agora será aceita a transferência via pix, somente pelo nosso CNPJ </p>
                    <% out.print("<div id='espaco-links-compra'> <a href='carrinho.jsp?idCliente=" + idCliente + "'> Ver carrinho </a> <a href='produtos.jsp?idCliente=" + idCliente + "'> Ver produtos </a> </div>"); %>
                </div>
            </section>
        </main>

        <footer style="margin-top: 500px; height: 560px;">
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
                <div id="no-margin-left" class="circ-rede-social"> <a href=""> <img style="height: 28px; margin-top: 3px;" src="icons8-facebook-num-círculo.svg" alt=""> </a> </div>
                <div class="circ-rede-social"> <a href=""> <img style="height: 18px; margin-top: 3px;" src="google-white.svg" alt=""> </a> </div>
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