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
		//captura letra pulsada
		$letra=$_POST['letra'];

		//crea el objeto y establece la conexion seleccionando la base de datos agenda
		$conex= new MiBase();

		$sql="";

		//hacer la consulta
		if($letra=='-' || $letra=='')
		{
			$sql.="select id, nombre, apellido1, telefono, email, empresa from contacto where visible='si' ORDER BY id desc limit 12;";
		}
		else
		{
			$sql.="SELECT id, nombre, apellido1, telefono, email, empresa FROM contacto WHERE nombre LIKE '".$letra."%' AND visible='si';";
		}



		$res=$conex->consultar($sql);
		$obj="";

		while($row=mysql_fetch_assoc($res))
		{
			$obj[]=$row;
		}

		echo json_encode($obj);
	}
?>