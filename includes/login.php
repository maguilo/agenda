<?php
include_once("includes/sesion.php");
include_once("includes/header.php");
?>

<div id="formularioLogin">
	<form style='padding: 20px' class="form-horizontal" id="formularioLogin" action="script/compruebaUsuario.php" method="post" style="margin: auto; ">
		<div class="control-group">
			<label class="control-label" for="inputId" ><b>Id</b></label>
			<div class="controls">
				<input autofocus type="text" id="inputId" placeholder="Id" name="id">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputPassword" ><b>Password</b></label>
			<div class="controls">
				<input type="password" id="inputPassword" placeholder="Password" name="password" >
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<span onclick='login()' class="btn" name="" id="btnLogin" >Acceder</span>
			</div>
		</div>
	</form>
</div>

<?php
include("includes/footer.php");
?>