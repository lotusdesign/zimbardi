<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.videos SET nome_video = '" & Request("nome_video") & "',"
strSQL = strSQL & " descricao = '" & Request("descricao") & "'"
strSQL = strSQL & " WHERE id_video = " & Request("id_video") & ";"

conn.Execute(strSQL)

Response.Redirect("filmes.asp?msg=Alterações salvas com sucesso!")

%>