<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.maquinas_maquina SET nome_maquina = '" & Request("nome_maquina") & "',"
strSQL = strSQL & " id_fabricante = " & Request("id_fabricante")
strSQL = strSQL & " WHERE id_maquina = " & Request("id_maquina") & ";"

conn.Execute(strSQL)

Response.Redirect("maquinas.asp?msg=Alterações salvas com sucesso!")

%>