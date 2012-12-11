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

			//hacer la consulta

			$sql.="SELECT * FROM contacto WHERE id='".$_POST['id']."';";
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