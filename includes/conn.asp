<% 
Response.Charset="ISO-8859-1"
'Criamos o objeto de conexão
Set conn = Server.CreateObject("ADODB.Connection") 
 
'Abrimos uma conexão com o banco de dados - [IMPORTANTE] altere os dados abaixo com as informações de sua base de dados
conn.Open("DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=localhost;PORT=3306;DATABASE=zimbardi;USER=root;PASSWORD=root;OPTION=3;")

%>