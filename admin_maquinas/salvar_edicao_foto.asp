<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.fotos SET nome_foto = '" & Request("nome_foto") & "',"
strSQL = strSQL & " descricao = '" & Request("descricao") & "'"
strSQL = strSQL & " WHERE id_foto = " & Request("id_foto") & ";"

conn.Execute(strSQL)

Response.Redirect("fotos.asp?msg=Alterações salvas com sucesso!")

%>