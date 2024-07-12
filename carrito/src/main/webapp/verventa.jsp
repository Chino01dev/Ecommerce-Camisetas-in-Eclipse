<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="modelo.*, controller.CarritoBD" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>VER</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
<body>
	<h1>Ver Datos de Venta</h1>
	<%
		String Id = request.getParameter("id");
		CarritoBD ObjA = new CarritoBD();
		Ventas Obk = new Ventas();
		Obk = ObjA.BuscarVenta(Id);
	%>
	<table class="table">
		<tr>
			<td>Id Venta</td><td><%=Obk.getIdVenta()%>
		</tr>
		<tr>
			<td>Id Cliente</td><td><%=Obk.getIdCliente()%>
		</tr>
		<tr>
			<td>Fecha de Venta</td><td><%=Obk.getFechaVenta()%>
		</tr>
		<tr>
			<td>Monto Total</td><td><%=Obk.getMontoTotal()%>
		</tr>
		<tr>
			<td>Estado</td><td><%=Obk.getEstado()%>
		</tr>
	</table>
	<a href=consultaventas.jsp>Regresar Pagina Principal</a>
</body>
</html>