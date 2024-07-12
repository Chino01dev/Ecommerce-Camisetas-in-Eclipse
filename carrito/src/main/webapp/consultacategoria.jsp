<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>    
<%@ page import="modelo.*, controller.CarritoBD" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    .back-button {
        position: fixed;
        bottom: 20px;
        left: 20px;
    }
</style>
</head>
<body>
<h1 class="mt-4">CATEGORIAS - ACTUAL</h1>


    <table class="table table-bordered border-secondary">
        <thead>
            <tr>
                <th>IdCategoria</th>
                <th>Descripcion</th>
                <th>Imagen</th>
                <th>Estado</th>        
            </tr>
        </thead>
        <tbody>
            <% 
            CarritoBD ObjBD = new CarritoBD(); // CONTROLADOR
            ArrayList<Categorias> Lista = ObjBD.Listarcategoria();
            for(Categorias categoria : Lista){
                String idCategoria = categoria.getIdCategoria();
            %>
            <tr>
                <td><%=categoria.getIdCategoria()%></td>
                <td><%=categoria.getDescripcion()%></td>
                <td><%=categoria.getImagen()%></td>
                <td><%=categoria.getEstado()%></td>
                
            </tr>
            <% } %>
        </tbody>
    </table>
    <!-- Icono de retroceso -->
    <a class="btn btn-secondary back-button" href="javascript:history.go(-1)">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L14.293 8 8.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M1.5 8a.5.5 0 0 1 .5-.5h12a.5.5 0 0 1 0 1h-12a.5.5 0 0 1-.5-.5z"/>
        </svg>
    </a>
</body>
</html>