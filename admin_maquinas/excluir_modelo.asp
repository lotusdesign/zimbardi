<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "DELETE FROM zimbardi.maquinas_modelos WHERE id_modelo = " & Request.QueryString("id") & ";"

conn.Execute(strSQL)

Response.Redirect("maquinas.asp?msg=Modelo excluído com sucesso!")
%>