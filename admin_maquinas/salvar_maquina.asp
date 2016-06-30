<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "INSERT INTO zimbardi.maquinas_maquina (id_fabricante, nome_maquina) VALUES ("
strSQL = strSQL &  Request("id_fabricante") & ", '"
strSQL = strSQL &  Request("nome_maquina") & "');"

conn.Execute(strSQL)

Response.Redirect("maquinas.asp?msg=M&aacute;quina salva com sucesso!")
%>