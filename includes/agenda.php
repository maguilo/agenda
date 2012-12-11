
<!--______________ botonera busqueda _______________-->
	<div >
		<form class="navbar-form pull-left" id="formularioBusquedaContacto" onsubmit="return false" method="post">
			<fieldset>

		    <input id="inputPalabraClave" type="text" class="span4" name="palabraClave" placeholder="Buscar" >

		    <label class="radio inline">
		        <input type="radio" name="optionsRadios" id="optionsRadios1" value="nombre" checked>
		        Nombre
		    </label>

		    <label class="radio inline">
		        <input type="radio" name="optionsRadios" id="optionsRadios1" value="telefono" >
		        Teléfono
		    </label>
		    <label class="radio inline">
		        <input type="radio" name="optionsRadios" id="optionsRadios1" value="empresa" >
		        Empresa
		    </label>

		    <span onclick='buscarContacto()' class="btn btn-small" id="btnBuscarContacto">Buscar</span>
		    <span onclick='altaContacto()' class="btn btn-small" id="btnAltaContacto" name="" >Alta nuevo usuario</span>
		    </fieldset>

		</form>
	</div>


<!--______________abecedario________________-->



    <div class="tabbable"> <!-- Only required for left/right tabs -->
	    <ul id="mistabs" class="nav nav-tabs" style="padding: 0% 9%; background-color: #F6F6F6;">
	    	<li class="active"><a href="#tab-" data-toggle="tab" id="guionInicio" >-</a></li>
<?
	for ($i=A;$i<=Y;$i++)
	{
		echo '<li><a href="#tab'.$i.'" data-toggle="tab">'.$i.'</a></li>';
	}
?>
			<li><a href="#tabZ" data-toggle="tab">Z</a></li>
	    </ul>
	    <div class="tab-content">
		    <div class="tab-pane active" id="tab-" >
		    	<h4 style="background-color: #4d4e53; color: white;"><center>Últimos contactos</center></h4>
		    </div>


<?
	for ($i=A;$i<=Y;$i++)
	{
		echo '<div class="tab-pane" id="tab'.$i.'">
		    	<h4 style="background-color: #4d4e53; color: white; ">Letra '.$i.'</h4>
		    </div>';
	}
?>
		    <div class="tab-pane" id="tabZ">
		    	<h4 style="background-color: #4d4e53; color: white; ">Letra Z</h4>
		    </div>
	    </div>
    </div>


<!--______________espacio para el contenido modal para busquedas por letra________________-->
<div id="mimodal" class="modal fade hide">
	<div class="modal-header">
		<h2>Crear contacto nuevo</h2>
	</div>
	<div class="modal-body">

	</div>
	<div class="modal-footer">
		<div onclick='agregaContacto()' class="btn btn-success" id="btnAltaUsuario" name="">Guardar</div>
	</div>
</div>


<!--______________espacio para el contenido modal para informacion completa________________-->
<div id="mimodal2" class="modal fade hide" >
	<div class="modal-header">
		<h2>Información Contacto</h2>
	</div>
	<div class="modal-body">

	</div>
	<div class="modal-footer">
		<div onclick='volver()' class="btn btn-success" id="btnAltaUsuario" name="">Volver</div>
	</div>
</div>


<!--______________espacio para el contenido modal para actualizar contacto________________-->
<div id="mimodal3" class="modal fade hide" >
	<div class="modal-header">
		<h2>Editar contacto</h2>
	</div>
	<div class="modal-body">

	</div>
	<div class="modal-footer">
		<div onclick='actualizaContacto()' class="btn btn-success" id="btnActualizaUsuario" name="">Actualizar</div>
	</div>
</div>


<!--______________espacio para el contenido modal para borrar contacto________________-->
<div id="mimodal4" class="modal fade hide" >
	<div class="modal-header">
		<h2>Eliminar contacto</h2>
	</div>
	<div class="modal-body">

	</div>
	<div class="modal-footer">
		Pulse el boton 'Borrar' para eliminar el contacto de la base de datos.&nbsp; ATENCIÓN!!! esta operación no se puede deshacer.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div onclick='eliminarContacto()' class="btn btn-success" id="btnActualizaUsuario" name="">Borrar</div>
	</div>
</div>


<!--______________tabla para mostrar los resultados________________-->
<table class='table table-hover'>
	<thead style="color: #8c8d8e; background-color: #e9e9e9;">
		<tr>
	    	<th>Nombre</th>
	    	<th>Apellido 1</th>
	    	<th>Teléfono</th>
	    	<th>Email</th>
	    	<th>Empresa</th>
	    	<th></th>
	    	<th></th>

		</tr>
	</thead>
	<tbody id="tbContactos" ><!-- el contenido se carga en esta id-->

	</tbody>
</table>