<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "DELETE FROM zimbardi.fotos WHERE id_foto = " & Request.QueryString("id") & ";"

conn.Execute(strSQL)

Response.Redirect("fotos.asp?msg=Filme excluído com sucesso!")
%>