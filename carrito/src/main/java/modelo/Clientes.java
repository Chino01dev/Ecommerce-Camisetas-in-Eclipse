package modelo;

public class Clientes {
	private String IdCliente;
	private String Apellidos;
	private String Nombres;
	private String Direccion;
	private String FechaNacimiento;
	private char Sexo;
	private String Correo;
	private String Password;
	private char Estado;
	private char Tipo_user;
	
	

	public Clientes() {

	}


	public Clientes(String idCliente, String apellidos, String nombres, String direccion, String fechaNacimiento,
			char sexo, String correo, String password, char estado, char tipo_user) {
		super();
		IdCliente = idCliente;
		Apellidos = apellidos;
		Nombres = nombres;
		Direccion = direccion;
		FechaNacimiento = fechaNacimiento;
		Sexo = sexo;
		Correo = correo;
		Password = password;
		Estado = estado;
		Tipo_user = tipo_user;
	}



	public String getIdCliente() {
		return IdCliente;
	}



	public void setIdCliente(String idCliente) {
		IdCliente = idCliente;
	}



	public String getApellidos() {
		return Apellidos;
	}



	public void setApellidos(String apellidos) {
		Apellidos = apellidos;
	}



	public String getNombres() {
		return Nombres;
	}



	public void setNombres(String nombres) {
		Nombres = nombres;
	}



	public String getDireccion() {
		return Direccion;
	}



	public void setDireccion(String direccion) {
		Direccion = direccion;
	}



	public String getFechaNacimiento() {
		return FechaNacimiento;
	}



	public void setFechaNacimiento(String fechaNacimiento) {
		FechaNacimiento = fechaNacimiento;
	}



	public char getSexo() {
		return Sexo;
	}



	public void setSexo(char sexo) {
		Sexo = sexo;
	}



	public String getCorreo() {
		return Correo;
	}



	public void setCorreo(String correo) {
		Correo = correo;
	}



	public String getPassword() {
		return Password;
	}



	public void setPassword(String password) {
		Password = password;
	}



	public char getEstado() {
		return Estado;
	}



	public void setEstado(char estado) {
		Estado = estado;
	}



	public char getTipo_user() {
		return Tipo_user;
	}



	public void setTipo_user(char tipo_user) {
		Tipo_user = tipo_user;
	}

	
	
	
	
}
