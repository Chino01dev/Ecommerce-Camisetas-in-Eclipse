<%@page import="java.security.ProtectionDomain"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>

<%@ page session="true" %>    
<%@ page import="modelo.*" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>CRUD PRODUCTOS</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
		 integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>


<body>
		<h1>VENTAS - ACTUAL </h1>
	   <%
	    CarritoBD ObjBD = new CarritoBD(); // CONTROLADOR
		Ventas ObjA = new Ventas();
		ArrayList<Ventas> Lista = new ArrayList<>();
		Lista = ObjBD.ListarVentas();
		%>
	
	<table class="table table-bordered border-secondary">
		<tr>

   				  <th>IdVenta</th>
   				  <th>IdClientes</th>
  				  <th>Fecha de venta</th>
  				  <th>Monto Final</th>
  				  <th>Estado</th>
  				  <th>Opciones</th>
  		<tr>		  
		<% for(Ventas a : Lista){
			String LinkVer = "<a  class='btn btn-primary'   href=verventa.jsp?id=" + a.getIdVenta() + ">Ver</a>";
			String LinkUpt = "<a  class='btn btn-secondary' href=upt.jsp?id=" + a.getIdCliente() + ">Editar</a>";
			String LinkDel = "<a  class='btn btn-success'   href=del.jsp?id=" + a.getIdCliente() + ">Suprimir</a>";
			%>
			<tr>
				<td scope="row"><%=a.getIdCliente()%></td>
				<td><%=a.getIdVenta()%></td>
				<td><%=a.getFechaVenta()%></td>
				<td><%=a.getMontoTotal()%></td>
				<td><%=a.getEstado()%></td>
			    <td><%=LinkVer%> | <%=LinkUpt%> | <%=LinkDel%></td>
			</tr>
		<% }  %>
	</table>
	
	<a class="btn btn-secondary back-button" href="javascript:history.go(-1)">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L14.293 8 8.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M1.5 8a.5.5 0 0 1 .5-.5h12a.5.5 0 0 1 0 1h-12a.5.5 0 0 1-.5-.5z"/>
        </svg>
    </a>

</body>
</html>