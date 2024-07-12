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
	.pastel-table th, .pastel-table td {
    border-width: 5px; /* Grosor del borde */
    border-style: solid; /* Estilo del borde */
}
	</style> 
	</head>
<body>
	<%
		String IdPro = request.getParameter("id");
		CarritoBD ObjBD = new CarritoBD();
		Productos ObjP = new Productos();
		ObjP = ObjBD.InfoProducto(IdPro);
		int columnas = 0;
	%>	
	<h1 text align="center">Carrito de Compras</h1>
	<form action="carrito.jsp">
		<table class="table table-bordered rounded shadow pastel-table">
			<tr>
				<td>IdProducto</td>
				<td><input name=txtid value=<%=ObjP.getIdProducto()%> readonly/></td>
			</tr>
			<tr>
				<td>Descripcion</td>
				<td><%=ObjP.getDescripcion()%></td>
			</tr>
			<tr>
				<td>Precio</td>
				<td><%=ObjP.getPrecioUnidad()%></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td><%=ObjP.getStock()%></td>
			</tr>
			<tr>
				<td>Imagen</td>
				<td><img src=img/<%=ObjP.getImagen()%> width="100" height="100"></td>
			</tr>
			<tr>
				<td>Cantidad</td>
				<td><input name=txtcan /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Añadir Carrito"/></td>
			</tr>
		</table>
	</form>
	<a href="javascript:history.back()">Seleccionar Otro Producto</a>
</body>
</html>