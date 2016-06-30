<!--#include file='conn.asp'-->
<%
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
strSQL = "SELECT * FROM zimbardi.maquinas_segmentos;"

Set segmentos = Server.CreateObject("ADODB.Recordset")
Set fabricantes = Server.CreateObject("ADODB.Recordset")
Set maquinas = Server.CreateObject("ADODB.Recordset")
Set modelos = Server.CreateObject("ADODB.Recordset")

segmentos.Open strSQL, conn
%>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
    <ul class="nav navbar-nav navbarpesquisa">
<%      Do While not segmentos.EOF
			Response.Write("<li>")
            Response.Write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>" & segmentos("nome_segmento") & "<b class='caret'></b></a>")
            Response.Write("<ul class='dropdown-menu multi-level'>")
			
			strSQLSub = "SELECT DISTINCT B.id_fabricante, B.nome_fabricante FROM maquinas_maquina C, maquinas_modelos A, maquinas_fabricantes B "
			strSQLSub = strSQLSub & " WHERE "
			strSQLSub = strSQLSub & " 	  C.id_segmento = " & segmentos("id_segmento")
			strSQLSub = strSQLSub & " AND A.id_fabricante = B.id_fabricante"
			strSQLSub = strSQLSub & " AND C.id_maquina = A.id_maquina"
			fabricantes.Open strSQLSub, conn
			
			Do While not fabricantes.EOF
	            Response.Write("<li class='dropdown-submenu'>")
            	Response.Write("<a href='javaScript:void(0)' class='dropdown-toggle' data-toggle='dropdown'>" & fabricantes("nome_fabricante") & "</a>")
				Response.Write("<ul class='dropdown-menu'>")
				
				strSQLMaq = "SELECT DISTINCT A.id_maquina, A.nome_maquina FROM maquinas_maquina A, maquinas_modelos B "
				strSQLMaq = strSQLMaq & " WHERE "
				strSQLMaq = strSQLMaq & " A.id_maquina = B.id_maquina "
				strSQLMaq = strSQLMaq & " AND B.id_fabricante = " & fabricantes("id_fabricante")
				strSQLMaq = strSQLMaq & " AND A.id_segmento = " & segmentos("id_segmento")
				
				maquinas.Open strSQLMaq, conn
				
				Do While not maquinas.EOF
					Response.Write("<li class='dropdown-submenu'>")
					Response.Write("<a href=='javaScript:void(0)' class='dropdown-toggle' data-toggle='dropdown'>" & maquinas("nome_maquina") & "</a>")				
					Response.Write("<ul class='dropdown-menu'>")
					
						strSQLMod = "SELECT DISTINCT C.id_modelo, C.nome_modelo FROM maquinas_maquina A, maquinas_fabricantes B, maquinas_modelos C "
						strSQLMod = strSQLMod & " WHERE "
						strSQLMod = strSQLMod & " 	  C.id_maquina = A.id_maquina "
						strSQLMod = strSQLMod & " AND A.id_segmento = " & segmentos("id_segmento")
						strSQLMod = strSQLMod & " AND C.id_fabricante = " & fabricantes("id_fabricante")
						strSQLMod = strSQLMod & " AND A.id_maquina = " & maquinas("id_maquina")
						modelos.Open strSQLMod, conn
						
						Do While not modelos.EOF
							Response.Write("<li>")
							Response.Write("<a href='modelos.asp?"& modelos("id_modelo") & "' class='dropdown-toggle' data-toggle='dropdown'>" & modelos("nome_modelo") & "</a>")
							Response.Write("</li>")
							modelos.MoveNext
						LOOP
						modelos.Close
	
					Response.Write("</ul>")					
					maquinas.MoveNext
				LOOP
				maquinas.Close
						
				Response.Write("</ul>")
				fabricantes.MoveNext
			LOOP
			fabricantes.Close
			
            Response.Write("</ul>")
			segmentos.MoveNext
         LOOP   %>
            <form class="navbar-form" role="search">
                <div class="input-group">
                    <input type="search" class="form-control" placeholder="Pesquisar" name="pesquisar">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                </div>
            </form>
        </li>
    </ul>
</div>
<!-- /.container -->