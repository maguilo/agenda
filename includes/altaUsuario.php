<?php
include("includes/sesion.php");
include("includes/header.php");
?>

<form class="form-horizontal">
	<div class="control-group">
		<label class="control-label" for="inputAlias">Alias</label>
		<div class="controls">
			<input type="text" id="inputAlias" placeholder="Alias">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputNombre">Nombre</label>
		<div class="controls">
			<input type="text" id="inputNombre" placeholder="Nombre">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputApellido1">Apellido1</label>
		<div class="controls">
			<input type="text" id="inputApellido1" placeholder="Primer apellido">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputApellido2">Apellido2</label>
		<div class="controls">
			<input type="text" id="inputApellido2" placeholder="Segundo apellido">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputEmpresa">Empresa</label>
		<div class="controls">
			<input type="text" id="inputEmpresa" placeholder="Empresa">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputCargo">Cargo</label>
		<div class="controls">
			<input type="text" id="inputCargo" placeholder="Cargo">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputDireccion">Dirección</label>
		<div class="controls">
			<input type="text" id="inputDireccion" placeholder="Direccion">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputPoblacion">Población</label>
		<div class="controls">
			<input type="text" id="inputPoblacion" placeholder="Población">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputCp">C.P.</label>
		<div class="controls">
			<input type="text" id="inputCp" placeholder="C.P.">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputProvincia">Provincia</label>
		<div class="controls">
			<input type="text" id="inputProvincia" placeholder="Provincia">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputPais">Pais</label>
		<div class="controls">
			<input type="text" id="inputPais" placeholder="Pais">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputTelefono">Teléfono</label>
		<div class="controls">
			<input type="password" id="inputTelefono" placeholder="Telefono">
		</div>
	</div>

    <div class="control-group">
		<label class="control-label" for="inputFax">Fax</label>
		<div class="controls">
			<input type="password" id="inputFax" placeholder="Fax">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputMovil">Móvil</label>
		<div class="controls">
			<input type="password" id="inputMovil" placeholder="Móvil">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputTlfParticular">Tlf particular</label>
		<div class="controls">
			<input type="password" id="inputTlfParticular" placeholder="Telefono particular">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputEmail">E-Mail</label>
		<div class="controls">
			<input type="text" id="inputEmail" placeholder="E-Mail">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputContactoD">Contacto de</label>
		<div class="controls">
			<input type="text" id="inputContactoD" placeholder="¿quien lo agrego a la agenda?">
		</div>
	</div>

    <div class="control-group">
		<label class="control-label" for="inputNotas">Notas</label>
		<div class="controls">
			<textarea type="text" id="inputNotas" placeholder="Información adicional">
			</textarea>
		</div>
	</div>


	<div class="control-group">
		<div class="controls">
			<label class="controls">
				<br/>
				<button type="submit" class="btn">Registrar</button>
			</label>

		</div>
	</div>
</form>


<?php
include("includes/footer.php");
?>