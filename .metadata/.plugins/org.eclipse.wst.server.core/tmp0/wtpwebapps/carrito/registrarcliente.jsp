<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page session="true" %>
<%@ page import="modelo.Productos" %>
<%@ page import="modelo.Clientes" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>AÑADIR - CLIENTE </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<style>
         body {
    	background: linear-gradient(to bottom right, #ff4d4d, #ffffff);
    	margin: 0;
    	padding: 0;
   	 	height: 100vh;
   	 	display: flex;
    	flex-direction: column;
    	align-items: center;
		}
        .container {
            margin-top: 50px;
        }
        .form-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 5px;
        }
        .submit-btn {
            width: 100%;
        }
    </style>
	</head>
	
	
<body>

 <%
        HttpSession sesion = request.getSession();  
    
		CarritoBD ObjBD = new CarritoBD(); // CONTROLADOR
		Clientes   user = new  Clientes();		
				
		String ape = (String) request.getParameter   ("apellido");
		String name = (String) request.getParameter  ("nombre");
		String direc = (String) request.getParameter ("direc");
		String fec = (String) request.getParameter   ("fecnaci");
		String sexo = (String) request.getParameter("sexo");
		String correo = (String) request.getParameter("correo");
        String IdPass = (String) request.getParameter("password");		
		
        
        
        if (ape != null && !ape.isEmpty() &&
        	    name != null && !name.isEmpty() &&
        	    direc != null && !direc.isEmpty() &&
        	    fec != null && !fec.isEmpty() &&
        	    sexo != null && !sexo.isEmpty() &&
        	    correo != null && !correo.isEmpty() &&
        	    IdPass != null && !IdPass.isEmpty()) {
        	
            Clientes nuevo = new Clientes();
            
            nuevo.setApellidos(ape);
            nuevo.setNombres(name);
            nuevo.setDireccion(direc);
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fec);
            	
            nuevo.setFechaNacimiento(fec);
            
            char sexo1 = sexo.charAt(0);
            nuevo.setSexo(sexo1);
            nuevo.setCorreo(correo);
            nuevo.setPassword(IdPass);
            
            ObjBD.InsertarCliente(nuevo);        	
        	
        }

        
         
	%>	


<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container">
                    <h2 class="form-title">Registrar Cliente</h2>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellidos:</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" required>
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombres:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="direc" class="form-label">Dirección:</label>
                            <input type="text" class="form-control" id="direc" name="direc" required>
                        </div>
                        <div class="mb-3">
                            <label for="fecnaci" class="form-label">Fecha de nacimiento:</label>
                            <input type="date" class="form-control" id="fecnaci" name="fecnaci" required>
                        </div>
                        <div class="mb-3">
                            <label for="sexo" class="form-label">Sexo:</label>
                            <input type="text" class="form-control" id="sexo" name="sexo" required>
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo:</label>
                            <input type="email" class="form-control" id="correo" name="correo" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Contraseña:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary submit-btn">Registrar Cliente</button>
                    </form>
                </div>
            </div>
        </div>
	<a class="btn btn-secondary back-button" href="javascript:history.go(-1)">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L14.293 8 8.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M1.5 8a.5.5 0 0 1 .5-.5h12a.5.5 0 0 1 0 1h-12a.5.5 0 0 1-.5-.5z"/>
        </svg>
    </a>
    </div>
	
</body>

</html>