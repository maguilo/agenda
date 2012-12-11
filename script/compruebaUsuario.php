<?php
 require_once('../clases/MiBase.php');
 require_once('../clases/Usuario.php');
 include_once('../includes/sesion.php');


if ($_POST['accion']!='login')
	{
		unset($_SESSION['usuario']);//destruye las variables
		session_destroy();//destruye la sesion por completo
		echo '0';
	}
else
	{
		if(isset($_POST['id']) && isset($_POST['password']) )
			{
				//captura de id y password
				$id=$_POST['id'];
				$password=$_POST['password'];

				//crea el objeto y establece la conexion seleccionando la base de datos agenda
				$conex= new MiBase();
				//$conex->seleccionarBd("agenda");
				//$conex->conexionbd();

				//crea el objeto Usuario y llama al metodo compruebaLogin
				$u=new Usuario();
				$existe=$u->compruebaLogin($id,$password,$conex);



				if(!$existe)
					{
						//el usuario no existe, devuelve 0 y se mantiene en la ventana login
						echo '0';//para que lo pueda recibir js
					}
				else
					{
						$_SESSION['usuario']=$u;
						//si existe, devuelve 1 e inicia la sesion
						echo '1';
					}
			}

	}

?>