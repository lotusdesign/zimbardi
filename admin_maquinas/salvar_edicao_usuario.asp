<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.usuarios SET nome_usuario = '" & Request("nome_usuario") & "',"
strSQL = strSQL & " login = '" & Request("login") & "',"
strSQL = strSQL & " email = '" & Request("email") & "',"
strSQL = strSQL & " senha = '" & Request("senha") & "'"
strSQL = strSQL & " WHERE id_usuario = " & Request("id_usuario") & ";"

conn.Execute(strSQL)

Response.Redirect("usuarios.asp?msg=Alterações salvas com sucesso!")

%>