<%@ Language=VBScript %>
<!--#include file='../includes/conn.asp'-->
<%
On Error Resume Next
Dim nome_arquivo, titulo, descricao

Set objUpload = Server.CreateObject("Dundas.Upload.2")

objUpload.UseVirtualDir = False
objUpload.UseUniqueNames = False

objUpload.Save Server.MapPath("/zimbardi/uploads/resenhas")

titulo = objUpload.Form("titulo")
descricao = objUpload.Form("descricao")
nome_arquivo = objUpload.Files(0).OriginalPath

strSQL = "INSERT INTO zimbardi.resenhas (titulo, nome_arquivo, descricao) VALUES ('"
strSQL = strSQL &  titulo & "','"
strSQL = strSQL &  nome_arquivo & "','"
strSQL = strSQL &  descricao & "');"

conn.Execute(strSQL)

Set objUpload = Nothing
If Err = 0 Then 
	Response.Write("<script>alert('Cadastro Efetudo com Sucesso');</script>")
ELSE
	Response.Write Err.description
End if

Response.Redirect("resenhas.asp?msg=Resenha gravada com sucesso!")
%>