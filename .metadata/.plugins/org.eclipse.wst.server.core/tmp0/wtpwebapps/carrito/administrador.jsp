<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>    
<%@ page import="modelo.*, controller.CarritoBD" %>   

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tienda Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">   
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .container {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center; /* Centrar contenido */
        }
        .btn {
            margin: 5px;
        }
        .store-title {
            margin-bottom: 30px;
        }
        .store-description {
            text-align: justify;
            margin-bottom: 50px;
        }
        .row {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
<% 
CarritoBD ObjBD = new CarritoBD();
 String idClienteAutenticado = (String) session.getAttribute("idCliente");
Clientes ObjP = new Clientes();
ObjP = ObjBD.InfoCliente(idClienteAutenticado);
 %>
    <div class="container">
        <h1 class="store-title">Bienvenido a nuestra tienda online <b><%= ObjP.getApellidos()%>, <%=ObjP.getNombres()%></b></h1>
        <p class="store-description">¡Hola y bienvenido de vuelta! Nos alegra verte iniciando sesión. Tu dedicación y esfuerzo son 
        fundamentales para el éxito de nuestro equipo. Estamos emocionados de tener la oportunidad de colaborar contigo nuevamente
         y seguir trabajando juntos en proyectos emocionantes. Recuerda que tu contribución es valiosa y apreciada, cada tarea que
          realizas nos acerca un paso más a nuestros objetivos comunes. Confiamos en tu capacidad para enfrentar los desafíos que 
          se presenten y para seguir creciendo profesionalmente. ¡Gracias por ser parte de nuestro equipo y por tu compromiso 
          constante! Juntos, alcanzaremos grandes logros.

</p>

        <div class="row justify-content-center"> <!-- Centrar botones -->
            <div class="col">
                <a class="btn btn-primary" href="consultaclientes.jsp?tabla=clientes">Consulta Clientes</a>
                <a class="btn btn-warning" href="consultastock.jsp">Consulta Stock</a>
                <a class="btn btn-secondary" href="consultaventas.jsp">Consulta Ventas</a>
                <a class="btn btn-danger" href="consultacategoria.jsp">Consulta Categoria</a>
            </div>
        </div>
<a href="iniciarsesion.jsp" class="btn-salir"><i class="fas fa-sign-out-alt"></i></a>
    </div>
</body>
</html>

