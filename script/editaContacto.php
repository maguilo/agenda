<?php

require_once('../clases/MiBase.php');
require_once('../clases/Contacto.php');
include_once('../includes/sesion.php');

if (!isset($_SESSION['usuario']))
	{
	 	exit();
	}
else
	{
		//crea el objeto y establece la conexion seleccionando la base de datos agenda
		$conex= new MiBase();
		//crea el objeto Contacto y llama al metodo compruebaContactoNuevo
		$c=new Contacto();
		$c->asignaValores($_POST);

		$valido=$c->editaContacto($conex);

		if(!$valido)
		{
			echo '0';
		}
		else
		{
			echo '1';
		}
	}

?>