<?php
include_once("../includes/sesion.php");
include_once("../includes/header.php");
require_once("../clases/Contacto.php");
require_once("../clases/MiBase.php");

$c= new Contacto();
$conex = new MiBase();
$c->asignarValoresPorId($_POST['id'],$conex);

?>
<!-- carga -->
<form id="formularioEditaContacto"class="form-horizontal" >
	 <div class="control-group">
		<label class="control-label" for="inputNombre">Informacion personal</label>
		<div class="controls">
			<input type="hidden" id="inputid" name="id"value="<?echo $c->getId(); ?>">
			<input type="text" class="inp" id="inputAlias" placeholder="Alias" name="alias" value="<?echo $c->getAlias(); ?>">
		</div>
		<div class="controls">
			<input type="text" class="inp" id="inputNombre" placeholder="Nombre" name="nombre" value="<?echo $c->getNombre(); ?>">
			<input type="text" class="inp" id="inputApellido1" placeholder="Primer apellido" name="apellido1" value="<?echo $c->getApellido1(); ?>">
			<input type="text" class="inp" id="inputApellido2" placeholder="Segundo apellido" name="apellido2" value="<?echo $c->getApellido2(); ?>">
		</div>
	</div>


	<div class="control-group">
		<label class="control-label" for="inputEmpresa">Datos profesionales</label>
		<div class="controls">
			<input type="text" class="inp" id="inputEmpresa" placeholder="Empresa" name="empresa" value="<?echo $c->getEmpresa(); ?>">
			<input type="text" class="inp" id="inputCargo" placeholder="Cargo" name="cargo"value="<?echo $c->getCargo(); ?>">
			<input type="text" class="inp" id="inputMovil" placeholder="Móvil" name="movil" value="<?echo $c->getMovil(); ?>">
		</div>
		<div class="controls">
			<input type="text" class="inp" id="inputTelefono" placeholder="Telefono" name="telefono" value="<?echo $c->getTelefono(); ?>">
			<input type="text" class="inp" id="inputFax" placeholder="Fax" name="fax"
			value="<?echo $c->getFax(); ?>">
			<input type="text" class="inp" id="inputTlfParticular" placeholder="Telefono particular" name="tlfParticular" value="<?echo $c->getTlfParticular(); ?>">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputDireccion">Correo postal</label>
		<div class="controls">
			<input type="text" class="inp" id="inputDireccion" placeholder="Dirección" name="direccion" value="<?echo $c->getDireccion(); ?>">

			<input type="text" class="inp" id="inputPoblacion" placeholder="Población" name="poblacion" value="<?echo $c->getPoblacion(); ?>">
			<input type="text" class="inp" id="inputCp" placeholder="C.P." name="cp" value="<?echo $c->getCp(); ?>">
		</div>
		<div class="controls">
			<input type="text" class="inp" id="inputProvincia" placeholder="Provincia" name="provincia" value="<?echo $c->getProvincia(); ?>">
			<input type="text" class="inp" id="inputPais" placeholder="Pais" name="pais" value="<?echo $c->getPais(); ?>">
		</div>
	</div>

	<div class="control-group">
		<label class="control-label" for="inputEmail">Correo electrónico</label>
		<div class="controls">
			<input type="text" class="input-xxlarge" id="inputEmail" placeholder="E-Mail" name="email" value="<?echo $c->getEmail(); ?>">
		</div>
	</div>

    <div class="control-group">
    	<label class="control-label" for="inputContactoD">Contacto de</label>
		<div class="controls">
			<input type="text" class="inp" id="inputContactoDe" placeholder="¿quien lo agrego a la agenda?" name="contactoDe" value="<?echo $c->getContactoDe(); ?>" readonly>
		</div>
		<label class="control-label" for="inputNotas">Notas</label>
		<div class="controls">
			<textarea type="text" class="field span7" id="inputNotas" placeholder="Información adicional" name="notas" ><?echo $c->getNotas();?>
			</textarea>
		</div>
	</div>


</form>


<?php
include("includes/footer.php");
?>