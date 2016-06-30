<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "UPDATE zimbardi.maquinas_modelos SET nome_modelo = '" & Request("nome_modelo") & "',"
strSQL = strSQL & " id_maquina = " & Request("id_maquina")
strSQL = strSQL & " WHERE id_modelo = " & Request("id_modelo") & ";"

conn.Execute(strSQL)

Response.Redirect("modelos.asp?msg=Alterações salvas com sucesso!")
%>