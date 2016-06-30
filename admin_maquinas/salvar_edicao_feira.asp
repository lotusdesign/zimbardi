<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.feiras SET nome_feira = '" & Request("nome_feira") & "',"
strSQL = strSQL & " descricao = '" & Request("descricao") & "';"

conn.Execute(strSQL)

Response.Redirect("feiras.asp?msg=Alterações salvas com sucesso!")

%>