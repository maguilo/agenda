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
		$obj="";
		$sql="";


		//hacer la consulta
		if($_POST['optionsRadios']=='nombre')
		{
			$sql="SELECT id, nombre, apellido1, telefono, email, empresa FROM contacto WHERE concat_ws(' ',nombre, apellido1, apellido2) like '%".$_POST['palabraClave']."%';";
		}

		else if($_POST['optionsRadios']=='telefono')
			{
				$sql="SELECT id, nombre, apellido1, telefono, email, empresa FROM contacto WHERE concat_ws(' ',telefono, fax, movil, tlfParticular) like '%".$_POST['palabraClave']."%';";
			}
			else
			{
				$sql="SELECT id, nombre, apellido1, telefono, email, empresa FROM contacto WHERE ".$_POST['optionsRadios']." like '%".$_POST['palabraClave']."%';";
			}



		$res=$conex->consultar($sql);

		if($res)
		{
			while($row=mysql_fetch_assoc($res))
			{
				$obj[]=$row;
			}
			echo json_encode($obj);
		}
	}
?>