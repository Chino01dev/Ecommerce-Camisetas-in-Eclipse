<%@page import="modelo.Productos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%@ page import="modelo.Productos" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Carrito de Compras</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	
	<style>
	img{
	margin-right: 10px;
	margin-bottom: 20px;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 2.7);
	}
	.pastel-table{
	
	text-align: center;
	background-color: #f0f0f0; /* Color pastel suave */
    border-color: #ccc; /* Color de borde */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	.pastel-table th, .pastel-table td {
    border-width: 10px; /* Grosor del borde */
    border-style: solid; /* Estilo del borde */
}
	</style> 
	</head>
<body>
	<%
		String IdCat = request.getParameter("id");
		CarritoBD ObjBD = new CarritoBD();
		List<Productos> Lista = new ArrayList<>();
		Lista = ObjBD.ListarProductos(IdCat);
		int columnas = 0;
	%>	
	<h1>PRODUCTOS</h1>
	<table class="table table-bordered rounded shadow pastel-table">
		<tr>
		<% for(Productos c : Lista){
			String imagen = "<img src=img/" + c.getImagen() + " width=150 height=150";
			String enlace = "<a href=verdetalle.jsp?id=" + c.getIdProducto() + 
							" class='btn btn-danger'>Ver Detalle</a>"; 
			if(columnas % 3 == 0) out.print("</tr><tr>");
		%>
			<td><%=c.getDescripcion()%><br/>
				<%=imagen%><br/>
				<%=enlace%>
			</td>
		<% columnas++; 
			} %>
	</table>
	<a href="index.jsp">REGRSAR A LA PAGINA PRINCIPAL</a>
</body>
</html>