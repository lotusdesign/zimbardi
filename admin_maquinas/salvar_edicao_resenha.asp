<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.resenhas SET titulo = '" & Request("titulo") & "',"
strSQL = strSQL & " descricao = '" & Request("descricao") & "'"
strSQL = strSQL & " WHERE id_resenha = " & Request("id_resenha") & ";"

conn.Execute(strSQL)

Response.Redirect("resenhas.asp?msg=Alterações salvas com sucesso!")

%>