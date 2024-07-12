<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="modelo.*, controller.CarritoBD" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
<body>
	<h1>Ver Datos de Alumno</h1>
	<%
		String Id = request.getParameter("id");
		CarritoBD ObjA = new CarritoBD();
		Clientes Obj = new Clientes();
		Obj = ObjA.BuscarCliente(Id);
	%>
	<table class="table">
		<tr>
			<td>Nombre</td><td><%=Obj.getNombres()%>
		</tr>
		<tr>
			<td>Apellidos</td><td><%=Obj.getApellidos()%>
		</tr>
		<tr>
			<td>Sexo</td><td><%=Obj.getSexo()%>
		</tr>
		<tr>
			<td>Correo</td><td><%=Obj.getCorreo()%>
		</tr>
		<tr>
			<td>Tipo Usuario</td><td><%=Obj.getTipo_user()%>
		</tr>
	</table>
	<a href=consultaclientes.jsp>Regresar Pagina Principal</a>
</body>
</html>