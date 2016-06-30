<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "INSERT INTO zimbardi.usuarios (nome_usuario, login, email, senha) VALUES ('"
strSQL = strSQL &  Request("nome_usuario") & "','"
strSQL = strSQL &  Request("login") & "','"
strSQL = strSQL &  Request("email") & "','"
strSQL = strSQL &  Request("senha") & "');"

conn.Execute(strSQL)

Response.Redirect("usuarios.asp?msg=Usu&aacute;rio salvo com sucesso!")
%>