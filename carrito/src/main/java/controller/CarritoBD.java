package controller;

import java.sql.CallableStatement;	
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.Categorias;
import modelo.Clientes;
import modelo.Detalle;
import modelo.Productos;
import modelo.Ventas;


public class CarritoBD {
	// Campos o atributos
	private String Driver = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/tienda2024";
	private String Usuario = "root";
	private String Password = "1234";
	
	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	
	private List<Categorias> ListaC;
	private List<Productos> ListaP;
	
	// Método Constructor
	public CarritoBD() {
		try {
				Class.forName(Driver);
				Cn = DriverManager.getConnection(URL, Usuario, Password);
		} catch (Exception e) {
				System.out.println("ERROR EN LA CONEXION:" + e.getMessage());
		}
	}
	
	
	// MÃ©todo ListarCategorias
	public List<Categorias> ListarCategorias(){
		String SQL = "CALL ListarCategorias()";
		ListaC = new ArrayList<Categorias>();
		try {
				Stmt = Cn.prepareCall(SQL);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaC.add(new Categorias(Rs.getString("IdCategoria"), 
											Rs.getString("Descripcion"),
											Rs.getString("Imagen"),
											Rs.getString("Estado").charAt(0)));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA CATEGORIAS :" + e.getMessage());
		}
		return ListaC;
	}
	
	
	
	
	// MÃ©todo ListarProductos
	public List<Productos> ListarProductos(String IdCat){
		String SQL = "CALL ListarProductosXCategoria(?)";
		ListaP = new ArrayList<Productos>();
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, IdCat);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaP.add(new Productos(Rs.getString("IdProducto"), 
											Rs.getString("IdCategoria"),
											Rs.getString("Descripcion"),
											Rs.getDouble("PrecioUnidad"),
											Rs.getInt("Stock"),
											Rs.getString("Imagen"),
											Rs.getString("Estado").charAt(0)));
				}
				Rs.close();
		} catch (Exception e) {
				System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
		return ListaP;
	}
	
	
	
	// MÃ©todo InfoProducto
	public Productos InfoProducto(String IdPro) {
		String SQL = "CALL InfoProducto(?)";
		Productos ObjP = null;
		try {
				Stmt = Cn.prepareCall(SQL);
				Stmt.setString(1, IdPro);
				Rs = Stmt.executeQuery();
				if(Rs.next()) {
					ObjP = new Productos(Rs.getString("IdProducto"), 
										Rs.getString("IdCategoria"),
										Rs.getString("Descripcion"),
										Rs.getDouble("PrecioUnidad"),
										Rs.getInt("Stock"),
										Rs.getString("Imagen"),
										Rs.getString("Estado").charAt(0));
				}
				Rs.close();
		} catch (Exception e) {
			System.out.println("ERROR EN CARGA DE TABLA PRODUCTOS :" + e.getMessage());
		}
		return ObjP;
	}
	
	

	// Validar IdUsuario y Password
    public Clientes VerificaUsuario(String IdCliente,String Password)
    { Clientes usuario = null;
        String SQL = "SELECT * FROM Clientes WHERE IdCliente='"+
                    IdCliente+"' AND Password='"+Password+"'";
        try {
            this.Cmd = this.Cn.createStatement();
            this.Rs = this.Cmd.executeQuery(SQL);
            if(this.Rs.next()){
              usuario = new Clientes(Rs.getString("IdCliente"), 
            		  Rs.getString("Apellidos"),
            		  Rs.getString("Nombres"),
            		  Rs.getString("Direccion"),
            		  Rs.getString("FechaNacimiento"),
            		  Rs.getString("Sexo").charAt(0),
            		  Rs.getString("Correo"),
            		  Rs.getString("Password"),
            		  Rs.getString("Estado").charAt(0),
            		  Rs.getString("Tipo_user").charAt(0)                		  
            		  );	            	
            }
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());
        }
      return usuario;
    }
    
    // Devolver Informacion de Cliente
    public Clientes InfoCliente(String IdCliente)
    { Clientes ObjP = null;      
        try {
            // Establece el nombre del SP a invocar
            Stmt = Cn.prepareCall("CALL InfoCliente(?)");
            // Asigna el valor del unico parametro del SP
            Stmt.setString(1, IdCliente);
            // Ejecuta el SP y almacena los resultados
            Rs = Stmt.executeQuery();
            // Si recupero filas guardalo en un objeto de tipo Clientes
            if(Rs.next()){
                ObjP = new Clientes(
                            Rs.getString("IdCliente"),
                            Rs.getString("Apellidos"),
                            Rs.getString("Nombres"),
                            Rs.getString("Direccion"),
                            Rs.getString("FechaNacimiento"),
                            Rs.getString("Sexo").charAt(0),
                            Rs.getString("Correo"),
                            Rs.getString("Password"),
                            Rs.getString("Estado").charAt(0),
                            Rs.getString("Tipo_user").charAt(0)	                            
                        );
            }
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());
        }
      return ObjP;  
    }
    
    // MÃ©todo para insertar filas en la tabla ventas
    public void InsertarVenta(Ventas ObjV)
    {
        try {
            Stmt = this.Cn.prepareCall("CALL InsertaVenta(?,?,?,?,?)");
            Stmt.setString(1, ObjV.getIdVenta());
            Stmt.setString(2, ObjV.getIdCliente());
            Stmt.setString(3, ObjV.getFechaVenta());
            Stmt.setDouble(4, ObjV.getMontoTotal());
            Stmt.setString(5, ObjV.getEstado()+"");
            Stmt.executeUpdate(); // INSERT, DELETE o UPDATE
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());        
        }
    }
    
    // MÃ©todo para insertar filas en la tabla detalle
    public void InsertarDetalle(Detalle ObjD)
    {
        try {
            Stmt = this.Cn.prepareCall("CALL InsertaDetalle(?,?,?,?,?)");
            Stmt.setString(1, ObjD.getIdVenta());
            Stmt.setString(2, ObjD.getIdProducto());
            Stmt.setInt(3, ObjD.getCantidad());
            Stmt.setDouble(4, ObjD.getPrecioUnidad());
            Stmt.setString(5, ObjD.getEstado()+"");
            Stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("***ERROR:"+e.getMessage());  
        }
    }
    
    // MÃ©todo para devolver el numero de filas de un tabla
    public int NumeroFilas(String NombreTabla)
    { int filas = 0;
      String SQL = "SELECT Count(*) FROM "+NombreTabla;
        try {
            this.Cmd = this.Cn.createStatement();
            this.Rs = this.Cmd.executeQuery(SQL);
            if(this.Rs.next()){
                filas = Rs.getInt(1);
            }
        } catch (Exception e) {
           System.out.println("***ERROR:"+e.getMessage());   
        }
      return filas;  
    }
//**********************************METODOS PARA EL ADMINISTRADOR ***************************************//
    
	// Objetos de gestion de la informacion
	private ArrayList<Productos> ListaA;
	
    // MÃ©todo para listar productos
	public ArrayList<Productos> ListarProductos(){
		ListaA = new ArrayList<Productos>();
		String SQL = "call ListarProductos()";
		try {
				Stmt = Cn.prepareCall(SQL);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaA.add(new Productos(
							Rs.getString("IdProducto"),
							Rs.getString("IdCategoria"),
							Rs.getString("Descripcion"),
							Rs.getDouble("PrecioUnidad"),
							Rs.getInt("Stock"),
							Rs.getString("Imagen"),
							Rs.getString("Estado").charAt(0)
							));
				}
				Rs.close();
		} catch (Exception e) {
			System.out.println("*** ERROR:" + e.getMessage());
		}
		return ListaA;
	}
	
	// Objetos de gestion de la informacion
	private ArrayList<Clientes> ListaB;
	
	 // MÃ©todo para listar productos
	public ArrayList<Clientes> ListarClientes(){
		ListaB = new ArrayList<Clientes>();
		String SQL = "call ListarClientes()";
		try {
				Stmt = Cn.prepareCall(SQL);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaB.add(new Clientes(
							Rs.getString("IdCliente"),
                            Rs.getString("Apellidos"),
                            Rs.getString("Nombres"),
                            Rs.getString("Direccion"),
                            Rs.getString("FechaNacimiento"),
                            Rs.getString("Sexo").charAt(0),
                            Rs.getString("Correo"),
                            Rs.getString("Password"),
                            Rs.getString("Estado").charAt(0),
                            Rs.getString("Tipo_user").charAt(0)));
				}
				Rs.close();
		} catch (Exception e) {
			System.out.println("*** ERROR:" + e.getMessage());
		}
		return ListaB;
	}
	
	private ArrayList<Categorias> ListaJ;
	public ArrayList<Categorias> Listarcategoria(){
		ListaJ = new ArrayList<Categorias>();
		String SQL = "call ListarCategorias()";
		try {
				Stmt = Cn.prepareCall(SQL);
				Rs = Stmt.executeQuery();
				while(Rs.next()) {
					ListaJ.add(new Categorias(
							Rs.getString("IdCategoria"),
                            Rs.getString("Descripcion"),
                            Rs.getString("Imagen"),
                            Rs.getString("Estado").charAt(0)));
                            
				}
				Rs.close();
		} catch (Exception e) {
			System.out.println("*** ERROR:" + e.getMessage());
		}
		return ListaJ;
	}
	
	// Objetos de gestion de la informacion
			private ArrayList<Ventas> ListaV;
			
			 // MÃ©todo para listar productos
			public ArrayList<Ventas> ListarVentas(){
				ListaV = new ArrayList<Ventas>();
				String SQL = "call ListarVentas()";
				try {
						Stmt = Cn.prepareCall(SQL);
						Rs = Stmt.executeQuery();
						while(Rs.next()) {
							ListaV.add(new Ventas(
								    Rs.getString("IdVenta"), 
									Rs.getString("IdCliente"), 
									Rs.getString("FechaVenta"), 
									Rs.getDouble("MontoTotal"), 
									Rs.getString("Estado").charAt(0))										
									);
						}
						Rs.close();
				} catch (Exception e) {
					System.out.println("*** ERROR:" + e.getMessage());
				}
				return ListaV;
			}
			    
		    
		 // MÃ©todo para insertar filas en la tabla ventas
		    public void InsertarCliente(Clientes ObjC)
		    {
		        try {
		            Stmt = this.Cn.prepareCall("CALL RegistrarClientes(?,?,?,?,?,?,?)");
		            Stmt.setString(1, ObjC.getApellidos());
		            Stmt.setString(2, ObjC.getNombres());
		            Stmt.setString(3, ObjC.getDireccion());
		            Stmt.setString(4, ObjC.getFechaNacimiento());
		            Stmt.setString(5, ObjC.getSexo()+"");
		            Stmt.setString(6, ObjC.getCorreo());
		            Stmt.setString(7, ObjC.getPassword());
		            Stmt.executeUpdate(); // INSERT, DELETE o UPDATE
		        } catch (Exception e) {
		            System.out.println("***ERROR:"+e.getMessage());        
		        }
		    }
		    
		    public Clientes BuscarCliente(String Id) {
				Clientes ObjA = null;
				String SQL = "call BuscarCliente(?)";
				try {
						Stmt = Cn.prepareCall(SQL);
						Stmt.setString(1, Id);
						Rs = Stmt.executeQuery();
						if(Rs.next()) {
							ObjA = new Clientes(
									Rs.getString("IdCliente"),
		                            Rs.getString("Apellidos"),
		                            Rs.getString("Nombres"),
		                            Rs.getString("Direccion"),
		                            Rs.getString("FechaNacimiento"),
		                            Rs.getString("Sexo").charAt(0),
		                            Rs.getString("Correo"),
		                            Rs.getString("Password"),
		                            Rs.getString("Estado").charAt(0),
		                            Rs.getString("Tipo_user").charAt(0)
								);
						}
						Rs.close();
				} catch (Exception e) {
					System.out.println("*** ERROR:" + e.getMessage());
				}
				return ObjA;
			}

		    public Ventas BuscarVenta(String Id) {
				Ventas ObjA = null;
				String SQL = "call BuscarVenta(?)";
				try {
						Stmt = Cn.prepareCall(SQL);
						Stmt.setString(1, Id);
						Rs = Stmt.executeQuery();
						if(Rs.next()) {
							ObjA = new Ventas(
									Rs.getString("IdVenta"),
		                            Rs.getString("IdCliente"),
		                            Rs.getString("FechaVenta"),
		                            Rs.getInt("MontoTotal"),
		                            Rs.getString("Estado").charAt(0)		                            
								);
						}
						Rs.close();
				} catch (Exception e) {
					System.out.println("*** ERROR:" + e.getMessage());
				}
				return ObjA;
			}

}

