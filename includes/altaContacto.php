<?php
require_once("../clases/Usuario.php");
require_once("../clases/Contacto.php");
include_once("../includes/sesion.php");
include_once("../includes/header.php");

if (!isset($_SESSION['usuario']))
	{
	 	exit();
	}
else
	{
		$u=$_SESSION['usuario'];
?>
	<!-- carga -->
	<form id="formularioAgregaContacto"class="form-horizontal" >
		 <div class="control-group">
			<label class="control-label" for="inputNombre">Informacion personal</label>
			<div class="controls">
				<input type="text" class="inp" id="inputAlias" placeholder="Alias" name="alias">
			</div>
			<div class="controls">
				<input type="text" class="inp" id="inputNombre" placeholder="Nombre" name="nombre">
				<input type="text" class="inp" id="inputApellido1" placeholder="Primer apellido" name="apellido1">
				<input type="text" class="inp" id="inputApellido2" placeholder="Segundo apellido" name="apellido2">
			</div>
		</div>


		<div class="control-group">
			<label class="control-label" for="inputEmpresa">Datos profesionales</label>
			<div class="controls">
				<input type="text" class="inp" id="inputEmpresa" placeholder="Empresa" name="empresa">
				<input type="text" class="inp" id="inputCargo" placeholder="Cargo" name="cargo">
				<input type="text" class="inp" id="inputMovil" placeholder="Móvil" name="movil">
			</div>
			<div class="controls">
				<input type="text" class="inp" id="inputTelefono" placeholder="Telefono" name="telefono">
				<input type="text" class="inp" id="inputFax" placeholder="Fax" name="fax">
				<input type="text" class="inp" id="inputTlfParticular" placeholder="Telefono particular" name="tlfParticular">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputDireccion">Correo postal</label>
			<div class="controls">
				<input type="text" class="inp" id="inputDireccion" placeholder="Dirección" name="direccion">

				<input type="text" class="inp" id="inputPoblacion" placeholder="Población" name="poblacion">
				<input type="text" class="inp" id="inputCp" placeholder="C.P." name="cp">
			</div>
			<div class="controls">
				<input type="text" class="inp" id="inputProvincia" placeholder="Provincia" name="provincia">
				<input type="text" class="inp" id="inputPais" placeholder="Pais" name="pais">
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="inputEmail">Correo electrónico</label>
			<div class="controls">
				<input type="text" class="input-xxlarge" id="inputEmail" placeholder="E-Mail" name="email">
			</div>
		</div>

	    <div class="control-group">
	    	<label class="control-label" for="inputContactoD">Contacto de</label>
			<div class="controls">
				<input type="text" class="inp" id="inputContactoDe" placeholder="¿quien lo agrego a la agenda?" name="contactoDe" value="<? echo $u->getNombre(); ?>" readonly>
			</div>
			<label class="control-label" for="inputNotas">Notas</label>
			<div class="controls">
				<textarea type="text" class="field span7" id="inputNotas" placeholder="Información adicional" name="notas">
				</textarea>
			</div>
		</div>


	</form>


<?php
include("includes/footer.php");
}
?>