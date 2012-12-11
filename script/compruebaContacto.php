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
		if(isset($_POST['nombre']) && isset($_POST['contactoDe']))
		{
			//crea el objeto y establece la conexion seleccionando la base de datos agenda
			$conex= new MiBase();
			//crea el objeto Contacto y llama al metodo compruebaContactoNuevo
			$c=new Contacto();

			$valido=$c->compruebaContactoNuevo($_POST['nombre'],$_POST['contactoDe']);

			if(!$valido)
			{
				//el contacto NO tiene los campos obligatorios
				echo '0';
			}
			else
			{
				//el contacto tiene los campos obligatorios
				//asigna los datos al objeto c
				$c->asignaValores($_POST);
				//se añaden a la base de datos
				$c->agregaContactoNuevo($c,$conex);

				if(!$c)
					echo '0';
				else
					echo '1';
			}
		}
		else
		{
			echo 'no han llegado los campos obligatorios';
		}
	}
?>