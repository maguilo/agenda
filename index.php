<?php
require("clases/Usuario.php");
include("includes/sesion.php");
include("includes/header.php");

//print_r($_SESSION['usuario']);

if (!isset($_SESSION['usuario']))
	{

	    include("includes/login.php");
	}
else
	{
		$usuario = $_SESSION["usuario"];
		$mensaje="_ Bienvenido ".$usuario->getNombre();
		$mensaje.="<a onclick='logout()' style='color:aqua; cursor:pointer;'>  logout   </a>";

		$mensaje.="<span id='userType'>".$usuario->getTipo()."</span>";
		echo ('<div style="background-color: #96202d; color:white;" >'.$mensaje.'</div>');
	    include("includes/agenda.php");
	}
?>
<?php
include("includes/footer.php");
?>
