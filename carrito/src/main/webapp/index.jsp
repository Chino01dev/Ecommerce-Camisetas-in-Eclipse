<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%@ page import="modelo.Categorias" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Camisetas Chino Street</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
    .header {
        background-color: #ff4d4d;
        width: 100%;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    h2{
    background-size: cover;
    background: red;
    margin-left:50px;
    padding-right:50px;
    margin-right: 50px;
    border-radius: 10px;
    }
    img {
        width: 150px;
        height: 150px;
        margin-bottom: 10px;
        border-radius: 10px; 
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 2.7);
        transition: transform 0.3s ease-in-out;
    }

    img:hover {
        transform: translateY(-5px); 
    }

    .pastel-table {
        margin-top: 50px;
        background-color: #f0f0f0; /* Color pastel suave */
        border-color: #ccc; /* Color de borde */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra suave */
    }

    .pastel-table th, .pastel-table td {
        border-width: 10px; /* Grosor del borde */
        border-style: solid; /* Estilo del borde */
    }

    .pastel-table td {
        color: #333; /* Color de texto */
    }

</style>
    </head>
<body>

<div class="header">
    <h1 class="store-name">Camisetas Chino Street</h1>
    <a href="iniciarsesion.jsp" class="btn-salir"><i class="fas fa-sign-out-alt"></i></a>
</div>

<%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("numarticulos") == null){
        sesion.setAttribute("numarticulos", 0);
        sesion.setAttribute("total", 0.0);
    }
    //RECUPERANDO DE LA SESION LOS VALORES DE numarticulos y total
    int nroarticulos= (int)(sesion.getAttribute("numarticulos"));
    double total = (double)(sesion.getAttribute("total"));
    CarritoBD ObjBD = new CarritoBD();
    List<Categorias> Lista = new ArrayList<>();
    Lista = ObjBD.ListarCategorias();
    int columnas = 0;

%>   
    <h2 align="right">Numero de articulos adquiridos: <%=nroarticulos %>
    <br> TOTAL ACUMULADO: <%=total %>
    </h2>
    
    
    <table class="table table-bordered rounded shadow pastel-table">
    <% 
       for(Categorias c : Lista){
            String imagen = "<img src='img/" + c.getImagen() + "' width='150' height='150'>";
            String enlace = "<a href='verproductos.jsp?id=" + c.getIdCategoria() + "' class='btn btn-danger'>Ver Productos</a>";
            if(columnas % 3 == 0) out.print("<tr>");
    %>
        <td style="text-align: center; padding: 20px;">
            <h4><%=c.getDescripcion()%></h4>
            <%=imagen%><br/>
            <%=enlace%>
        </td>
    <% 
        columnas++;
        if(columnas % 3 == 0) out.print("</tr>");
       } 
       if(columnas % 3 != 0) out.print("</tr>");
    %>
</table>
    
</body>
</html>
