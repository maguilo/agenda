<?php

if (!isset($_SESSION['usuario']))
	{
	 	echo ("Tiene que hacer login para utilizar la agenda");
	    include("includes/login.php");
	}
else
	{
		$conexion = mysql_connect("localhost","root","");
		mysql_select_db("agenda", $conexion);
		$query = "select persona.nombre as nombre,
					persona.correo as correo,
					persona.telefono as telefono
					from persona ;";

		$resultado = mysql_query($query, $conexion);


		$cad = "";

		while($row=mysql_fetch_array($resultado)){
			$cad=$cad."

			<tr>
				<td>".$row['nombre']."</td>
				<td>".$row['correo']."</td>
				<td>".$row['telefono']."</td>
			</tr>
			";
		}
		echo $cad;
	}

?>