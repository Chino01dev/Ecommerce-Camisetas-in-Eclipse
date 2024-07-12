<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.CarritoBD" %>
<%@ page import="modelo.Clientes" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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

.header {
    background-color: #ff4d4d;
    width: 100%;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.container {
    width: 50%;
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h1 {
    color: black;
    text-align: center;
}

.form-container {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 400px;
}

.form-control {
    border-color: #ff4d4d;
}

.error-message {
    color: red;
    text-align: center;
}

.btn-ingresar {
    display: block;
    margin: 0 auto; /* Para centrar horizontalmente */
}

.btn-volver {
    background-color: transparent;
    border: none;
    color: #000;
    font-size: 24px;
}

.store-name {
    color: #fff;
    font-size: 24px;
    margin-bottom: 10px;
}

.register-link {
    text-align: center;
    margin-top: 20px;
}

.register-link a {
    color: #000;
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

<div class="header">
    <h1 class="store-name">Camisetas Chino Street</h1>
    <a href="index.jsp" class="btn-volver"><i class="fas fa-store"></i></a>
</div>

<%
    HttpSession sesion = request.getSession();

    if (request.getMethod().equals("POST")) {
        String idCliente = request.getParameter("idCliente");
        String password = request.getParameter("password");

        CarritoBD carritoBD = new CarritoBD();

        Clientes user = carritoBD.VerificaUsuario(idCliente, password);

        if (user != null) {
            session.setAttribute("idCliente", idCliente);
            session.setAttribute("user", user); // Guarda el objeto Clientes en la sesión si es necesario
            if (user.getTipo_user() == 'U') {
                response.sendRedirect("index.jsp");
            } else if (user.getTipo_user() == 'A') {
                response.sendRedirect("administrador.jsp");
            } else {
                // Manejar otros tipos de usuario si es necesario
            }
            return;
        } else {
            out.println("<p class='error-message'>Credenciales inválidas. Por favor, inténtalo de nuevo.</p>");
        }
    }
%>



<div class="container">
    <div class="form-container">
        <h1>Iniciar Sesion</h1>
        <form action="" method="post">
            <div class="mb-3">
                <label for="idCliente" class="form-label">ID Cliente:</label>
                <input type="text" class="form-control" id="idCliente" name="idCliente" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-ingresar">Ingresar</button>
        </form>
        <div class="register-link">
            <a href="registrarcliente.jsp">¿No tienes cuenta? Regístrate aquí</a>
        </div>
    </div>
</div>

</body>
</html>

