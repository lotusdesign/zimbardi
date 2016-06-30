<!--#include file='../includes/conn.asp'-->
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
If Session("UserLoggedIn") <> "true" Then
    Response.Redirect("index.asp")
End If

strSQL = "SELECT * FROM zimbardi.resenhas WHERE id_resenha = " & Request.QueryString("id") & ";"
Set resenha = Server.CreateObject("ADODB.Recordset")
resenha.Open strSQL, conn
%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Zimbardi - Administrador</title>
<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/sb-admin.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="wrapper">
		<!-- Navegação -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="inicial.asp">Zimbardi Admin</a>
			</div>
			<ul class="nav navbar-right top-nav">
				<li class="dropdown">
					<ul class="dropdown-menu message-dropdown">
						<li class="message-preview"><a href="#">
								<div class="media">
									<span class="pull-left"> <img class="media-object" src="http://placehold.it/50x50" alt="">
									</span>
									<div class="media-body">
										<h5 class="media-heading">
											<strong>Resenha - Artigo</strong>
										</h5>
									</div>
								</div>
						</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <b><% Response.write Session("nome_do_usuario") %></b></a></li>
			</ul>
			<!--#include file='menu.asp'-->
			<!-- /.navbar-collapse -->
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Edição de Resenhas/Artigos</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="inicial.asp">Tela Inicial</a></li>
							<li class="active"><i class="fa fa-file"></i> Resenhas/Artigos </li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-6">
						<form role="form" class="formcliente" action="salvar_edicao_resenha.asp" method="post" name="frm_usuario">
							<input type="hidden" name="id_resenha" value="<% Response.write Request.QueryString("id") %>">
							<div class="form-group">
								<label>Título</label> <input type="text" class="form-control" name="titulo" value="<% Response.write resenha("titulo") %>">
							</div>
							<div class="form-group">
								<label>Descrição</label><br/> <textarea name="descricao" rows="5" cols="70"><% Response.write resenha("descricao") %></textarea>
							</div>
                            <br/>
							<input type="submit" name="salvar" class="btn btn-sm btn-primary" value="SALVAR" />
							<button type="reset" class="btn btn-sm btn-primary">CANCELAR</button>
						</form>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script src="../js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>