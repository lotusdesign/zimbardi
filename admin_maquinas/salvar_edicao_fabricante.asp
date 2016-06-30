<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.maquinas_fabricantes SET nome_fabricante = '" & Request("nome_fabricante") & "'"
strSQL = strSQL & " WHERE id_fabricante = " & Request("id_fabricante") & ";"

conn.Execute(strSQL)

Response.Redirect("fabricantes.asp?msg=Alterações salvas com sucesso!")

%>