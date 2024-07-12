<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page session="true" %>
<%@ page import="modelo.*" %>
<%@ page import="controller.CarritoBD" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 

<%@ page import= "java.time.LocalDate"%>
<%@ page import= "java.sql.Date "%>

 

<% 
      HttpSession sesion = request.getSession();  
      ArrayList<carrito> Lista = (ArrayList<carrito>) sesion.getAttribute("cesto");
      double total_venta = (double) sesion.getAttribute("total");
      char estado = '1';

    
      String fecha = "2024-04-20";

      
      CarritoBD ObjBD = new CarritoBD();; // CONTROLADOR     
      String IdClie = request.getParameter("username");
      
      int filas = ObjBD.NumeroFilas("ventas");
      String idventa ;
      if(filas == 0){  	  
    	  idventa = "VTA0000001";
      }else{
    	  idventa = "VTA"+String.format("%07d",filas+1);
      }
      
      
   // Convertir la cadena a un objeto Date
      String fechaCom = "2024-04-20";
      LocalDate fechaLocal = LocalDate.parse(fecha);
      Date fechaVenta = Date.valueOf(fechaLocal);


      
      double montototal = 0;
 	// Recorrer todos los productos de Lista
 	
 	  if(Lista != null){
 	        Ventas venta = new Ventas();
 	    	
 	        venta.setIdVenta(idventa);
 	    	venta.setIdCliente(IdClie);   	
 	    	venta.setMontoTotal(total_venta);
 	    	venta.setEstado(estado);  
 	    	venta.setFechaVenta(fechaCom);
 	    	
 	    	//aca ya tengo mi venta lista
 	  	
 	    	ObjBD.InsertarVenta(venta);
 	    	
        for (int i = 0; i < Lista.size(); i++) {
        	
        	Detalle detalle = new Detalle();
        	
        	detalle.setCantidad(Lista.get(i).getCantidad());
        	detalle.setIdVenta(idventa);
        	
            Productos item =   new Productos();
            item = ObjBD.InfoProducto(Lista.get(i).getIdProducto());
            
        	detalle.setEstado(item.getEstado());
        	detalle.setIdProducto(Lista.get(i).getIdProducto());
        	detalle.setPrecioUnidad(item.getPrecioUnidad());
        	
        	
        	ObjBD.InsertarDetalle(detalle);
        }
        
    	   	
 	  }
		
 	
 %>   
 
 <% 
 String idClienteAutenticado = (String) session.getAttribute("idCliente");
Clientes ObjP = new Clientes();
ObjP = ObjBD.InfoCliente(idClienteAutenticado);
 %>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Compra Exitosa</title>
<style>
body {
    background-color: #f8f9fa; /* Fondo de color claro */
    font-family: Arial, sans-serif; /* Tipo de fuente */
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px; /* Ancho máximo del contenido */
    margin: 0 auto; /* Centrado horizontal */
    padding: 50px;
}

.success-message {
    background-color: #28a745; /* Color de fondo verde */
    color: #fff; /* Color del texto blanco */
    border-radius: 10px; /* Bordes redondeados */
    padding: 20px; /* Espaciado interno */
    text-align: center; /* Alineación central del texto */
    margin-bottom: 30px; /* Margen inferior */
}

.success-message b {
    font-size: 1.2em; /* Tamaño de fuente grande */
}

.return-link {
    display: block; /* Convertir en bloque para ocupar el ancho completo */
    background-color: #007bff; /* Color de fondo azul */
    color: #fff; /* Color del texto blanco */
    text-decoration: none; /* Sin subrayado */
    border-radius: 5px; /* Bordes redondeados */
    padding: 10px 20px; /* Espaciado interno */
    width: fit-content; /* Ajustar al contenido */
    margin: 0 auto; /* Centrado horizontal */
}

.return-link:hover {
    background-color: #0056b3; /* Color de fondo azul más oscuro en el hover */
}
</style>
</head>
<body>

<div class="container">
    <div class="success-message">
        <h2>Felicidades por su compra <b><%= ObjP.getApellidos()%>, <%=ObjP.getNombres()%></b>!</h2>
        <p>Agradecemos su compra y esperamos verlo nuevamente pronto.</p>
    </div>

    <a href="cancelar.jsp" class="return-link">REGRESAR A LA PÁGINA PRINCIPAL</a>
</div>

</body>
</html>
 