<%@ Language=VBScript %>
<!--#include file='../includes/conn.asp'-->
<%
On Error Resume Next
Dim nome_arquivo, nome_foto, descricao

Set objUpload = Server.CreateObject("Dundas.Upload.2")

objUpload.UseVirtualDir = False
objUpload.UseUniqueNames = False

objUpload.Save Server.MapPath("/zimbardi/uploads/fotos")

nome_foto = objUpload.Form("nome_foto")
descricao = objUpload.Form("descricao")

nome_arquivo = objUpload.Files(0).OriginalPath

strSQL = "INSERT INTO zimbardi.fotos (nome_foto, nome_arquivo, descricao) VALUES ('"
strSQL = strSQL &  nome_foto & "','"
strSQL = strSQL &  nome_arquivo & "','"
strSQL = strSQL &  descricao & "');"

conn.Execute(strSQL)

Set objUpload = Nothing
If Err = 0 Then 
	Response.Write("<script>alert('Cadastro Efetudo com Sucesso');</script>")
ELSE
	Response.Write Err.description
End if

Response.Redirect("fotos.asp?msg=Arquivo " & nome_arquivo & " gravado com sucesso!")
%>