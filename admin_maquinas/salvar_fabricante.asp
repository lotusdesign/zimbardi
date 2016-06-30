<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "INSERT INTO zimbardi.maquinas_fabricantes (nome_fabricante) VALUES ('"
strSQL = strSQL &  Request("nome_fabricante") & "');"

conn.Execute(strSQL)

Response.Redirect("fabricantes.asp?msg=Fabricante salvo com sucesso!")
%>