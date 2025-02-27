<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<%@ page import="modelo.*" %>
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
        /* Aqu� colocas tus reglas CSS */
        .table {
            border-collapse: collapse;
            width: 100%;
        }

        .table th, .table td {
            border: 10px solid #dee2e6;
            padding: 8px;
            text-align: center;
        }

        .thead-dark {
            background-color: black;
            color: white;
        }
    </style>
	</head>
<body>
<h1>Carrito de Compras-2</h1>
<%
	try {
            // Enlaces del carrito
            String enlace1 = "<a href=index.jsp>Seguir Comprando</a>";
            String enlace2 = "<a href=cancelar.jsp>Cancelar Compra</a>";      
            String enlace3 = "<a href=logeo.jsp>Pagar Compra</a>";                  
            // Variable de la clase BD
            CarritoBD ObjBD = new CarritoBD();
            // Recuperando los valores del formulario
            String IdPro = (String)request.getParameter("txtid");
            int Cant =  Integer.parseInt(request.getParameter("txtcan"));
            // Agregar los valores del formulario a un objeto de tipo carrito
            carrito ObjC = new carrito(IdPro, Cant);
            // Variable para acceder a la sesion del proyecto web
            HttpSession MiSesion = request.getSession();
            // Declarar un ArrayList de tipo carrito
            ArrayList<carrito> Lista = null;
            // Recuperando los elementos almacenados en la sesion
            Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
            // Verificar si logro recuperar valores de la sesion
            if(Lista == null){
                Lista = new ArrayList<carrito>();
                Lista.add(ObjC);
            }else{
                // Si ya existen elementos en la lista
                boolean encontrado = false;
                for(int i = 0; i < Lista.size();i++){
                    carrito Obj = new carrito();
                    Obj = Lista.get(i);
                    if(Obj.getIdProducto().equalsIgnoreCase(IdPro)){
                        encontrado = true;
                        Obj.setCantidad(Obj.getCantidad()+Cant);
                        Lista.set(i, Obj);
                        break;
                    }
                }    
                // Si no encontro el producto a�adirlo al cesto
                if(!encontrado && Cant!=0){
                    Lista.add(ObjC);
                }
            }
            // Actualizar el valor de la sesion
            if(Cant!=0)MiSesion.setAttribute("cesto", Lista);
            //	MiSesion.removeAttribute("cesto"); ==> Eliminar un elemento de la sesion
            // Construir la factura
            String tabla = "<table class='table table-striped table-bordered'>";
            	tabla+= "<thead class='thead-dark'>";
                tabla += "<tr bgcolor=Yellow>";
                    tabla += "<th scope='col'>Item</th>";
                    tabla += "<th scope='col'>IdProducto</th>";
                    tabla += "<th scope='col'>Descripcion</th>";
                    tabla += "<th scope='col'>Imagen</th>";
                    tabla += "<th scope='col'>Precio</th>";
                    tabla += "<th scope='col'>Cantidad</th>";
                    tabla += "<th scope='col'>Sub-Total</th>";
                    tabla += "<th scope='col'>Opciones</th>";
                tabla += "</tr>";
                tabla += "</thead>";
                double Total = 0; int i;
                // Recorrer todos los productos de Lista
                for(i = 0; i < Lista.size(); i++){
                    Productos Obj = new Productos();
                    // Recuperar la informacion de cada producto del cesto
                    Obj = ObjBD.InfoProducto(Lista.get(i).getIdProducto());
                    String enlace = "suprimir.jsp?id="+Obj.getIdProducto();
                    double Precio = Obj.getPrecioUnidad();
                    int Cantidad = Lista.get(i).getCantidad();
                    double SubTotal = Precio * Cantidad;
                    Total += SubTotal;
                    tabla += "<tr>";
                        tabla += "<td>"+(i+1)+"</td>";
                        tabla += "<td>"+Obj.getIdProducto()+"</td>";
                        tabla += "<td>"+Obj.getDescripcion()+"</td>";
                        tabla += "<td><img src=img/"+Obj.getImagen()+
                                " width=50 heigth=50></td>";
                        tabla += "<td>"+Precio+"</td>";
                        tabla += "<td>"+Cantidad+"</td>";
                        tabla += "<td>"+SubTotal+"</td>";
                        tabla += "<td><a href="+enlace+" class='btn btn-danger' role='button'>Suprimir</a></td>";
                    tabla +="</tr>";
                }
                tabla += "<tr bgcolor=Yellow><th colspan=6>TOTAL GENERAL</th><th>"+Total+"</th><th></th></tr>";
                tabla += "<tr><td colspan=8 align=center>[ "+enlace1+" ][ "+enlace2+" ][ "+enlace3+" ]</td></tr>";
            tabla += "</table>";
            out.print(tabla);
            // Guardar valores en sesion
            MiSesion.setAttribute("numarticulos", i);
            MiSesion.setAttribute("total", Total);
        } finally {            
            out.close();
        }
%>
</body>
</html>