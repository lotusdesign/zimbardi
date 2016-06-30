<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "INSERT INTO zimbardi.maquinas_modelos (id_maquina, nome_modelo) VALUES ("
strSQL = strSQL &  Request("id_maquina") & ", '"
strSQL = strSQL &  Request("nome_modelo") & "');"

conn.Execute(strSQL)

Response.Redirect("modelos.asp?msg=Modelo salvo com sucesso!")
%>