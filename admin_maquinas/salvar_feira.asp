<%@ Language=VBScript %>
<!--#include file='../includes/conn.asp'-->
<%
On Error Resume Next
Dim nome_feira, descricao

nome_feira = Request.Form("nome_feira")
descricao = Request.Form("descricao")

nome_arquivo = objUpload.Files(0).OriginalPath

strSQL = "INSERT INTO zimbardi.feiras (nome_feira, descricao) VALUES ('"
strSQL = strSQL &  nome_feira & "','"
strSQL = strSQL &  descricao & "');"

conn.Execute(strSQL)

Set objUpload = Nothing
If Err = 0 Then 
	Response.Write("<script>alert('Cadastro Efetudo com Sucesso');</script>")
ELSE
	Response.Write Err.description
End if

Response.Redirect("feiras.asp?msg=Feira " & nome_feira & " salva com sucesso!")
%>