$(document).on("ready",function()
{
    $('#formulario').submit(function(){
       $.ajax({
            type: 'post',
            url: 'script/php/insertarPersona.php',
            data: $('#formulario').serialize(),
            success: function(data){
                if(data==1){
                    location.reload();
                    alert("se ha enviado el formulario correctamente");
                }
                else{
                    alert("se ha producido un error al enviar el formulario");
                }
            }
        });
        return false;
    });


    $('#mistabs a').click(function (e)
    {
        var str = ""+e.target;//carga el evento
        var cad = str.split("/#tab");//crea un array con el separador "/#tab"
        cargaInfo(cad[1]);//seleccionamos solo la letra
    });

    $("#guionInicio").click();

    // busca por caracter introducido  y si se queda en blanco recarga la pagina
    $('#inputPalabraClave').keyup(function()
    {
        if($('#inputPalabraClave').val()=='')
        {
            location.reload();
        }

        buscarContacto();
    });


    // detecta intro en el formulario login
    $('#inputPassword').bind('keyup', function (e)
    {
        var key = e.keyCode || e.which;
        if (key === 13)
        {
            login();
        };
    });
});


function cargaInfo(letra)
{
    $.ajax({
        type:'post',
        url:'script/obtenerListadoLetra.php',
        data:'letra='+letra,
        dataType:'json',
        success: function(data)
        {
            var r="";
            var tipo=$("#userType").html();



            for(var a=0; a<data.length; a++)
            {
                var id=data[a]["id"];
                var admin="<a class='btn btn-small btn-danger' onClick='borrarContacto("+id+")'>borrar</a>";

                r+="<tr>";
                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["nombre"]+"</td>";
                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["apellido1"]+"</td>";
                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["telefono"]+"</td>";
                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["email"]+"</td>";
                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["empresa"]+"</td>";
                r+="<td><a class='btn btn-small' onClick='editarContacto("+id+")'><i class='icon-pencil'></i>&nbsp;editar</a>&nbsp;";

                if(tipo=="administrador")
                    r= r+admin;

                r+="</td>";
                r+="</tr>";
            }
            $('#tbContactos').html(r);
        }
    });
}

function muestraContactoCompleto(id)
{
    $.ajax({
        type:'post',
        url:'script/buscarContactoId.php',
        data:'id='+id,
        dataType:'json',
        success: function(data)
        {
            var r="";

            for(var a=0; a<data.length; a++)
            {
                r+="<address>";
                r+="<strong>"+data[a]['nombre']+' '+data[a]['apellido1']+' '+data[a]['apellido2']+"</strong></br>";
                r+="Le suelen decir: <b>"+data[a]['alias']+"</b></br>";
                r+="Cargo: <b>" + data[a]['cargo']+"</b></br>";
                r+="Movil: <b>"+data[a]['movil']+"</b></br>";
                r+="Tlf particular: <b>"+data[a]['tlfParticular']+"</b></br>";
                r+="<a href='#'>"+data[a]['email']+"</a></br></br>";
                r+="</address>";

                r+="<address>";
                r+="<strong>"+data[a]['empresa']+"</strong></br>";
                r+=data[a]['direccion']+"</br>";
                r+=data[a]['poblacion']+" - "+data[a]['cp']+"</br>";
                r+=data[a]['provincia']+" - "+data[a]['pais']+"</br>";
                r+="Tlf: "+data[a]['telefono']+"</br>";
                r+="Fax: "+data[a]['fax']+"</br></br>";
                r+="</address>";

                r+="<address>";
                r+="Fue agregado a la agenda por: <b>"+data[a]['contactoDe']+"</b></br>";
                r+="Notas: "+data[a]['notas']+"</br>";
                r+="</address>";
            }
            $('#mimodal2 .modal-body').html(r);
            $("#mimodal2").modal("show");
        }
    });
}

function login()
{
    var id=$('#inputId').val();
    var password=$('#inputPassword').val();
    var accion='login';


    if( id!='' && password!='' )
    {

        $.ajax({
                type: 'post',
                url: 'script/compruebaUsuario.php',
                data: 'id='+id+'&password='+password+'&accion='+accion,

                success: function(data){
                    if(data>0)
                    {
                        location.reload();
                    }
                    else
                    {
                        alert("los datos no son correctos");
                    }
                }
            }
            );
    }
    else
    {
        alert('los dos campos son obligatorios');
    }
}


function logout()
{
    var accion='logout';

    $.ajax({
                type: 'post',
                url: 'script/compruebaUsuario.php',
                data: 'accion='+accion,

                success: function(data){

                    if(data==0)
                    {
                        alert("Saliendo de la agenda");
                        location.reload();
                    }

                }
            });
}

function altaContacto()
{
    //redirige al formulario de entrada
    //location.href="includes/altaContacto.php";

    //carga altaContacto en una ventana modal(emergente) de agenda.php

    $("#mimodal .modal-body").load("includes/altaContacto.php");
    $("#mimodal").modal("show");
}

function agregaContacto()
{
    var nombre=$('#inputNombre').val();
    var contactoDe=$('#inputContactoDe').val();

    if(nombre !='' && contactoDe !='')
    {
        var data=$("#formularioAgregaContacto").serialize();
        $.ajax({
                type: 'post',
                url: 'script/compruebaContacto.php',
                data: data,
                success: function(data)
                {
                    //alert(data);
                    if(data>0)
                    {
                        alert("el contacto ha sido agregado a la agenda");
                        location.reload();
                    }
                    else
                    {
                        alert("el contacto NO HA SIDO AGREGADO a la agenda");
                    }
                }
            });
    }
    else
    {
        alert('los campos Nombre: y Contacto de: son obligatorios');
    }
}

function editarContacto(id)
{
    $("#mimodal3 .modal-body").load("includes/editaContacto.php",{id:id});
    $("#mimodal3").modal("show");
}

function actualizaContacto()
{
    var data=$("#formularioEditaContacto").serialize();

    $.ajax({
            type: 'post',
            url: 'script/editaContacto.php',
            data: data,
            success: function(data)
            {
                if(data>0)
                {
                    alert("el contacto ha sido actualizado");
                    location.reload();
                }
                else
                {
                    alert("el contacto NO HA SIDO ACTUALIZADO!!!");
                }
            }
        });
}

function buscarContacto()
{
    var palabra=$('#inputPalabraClave').val();
    var buscarPor=$('input:radio[name=optionsRadios]:checked').val();
    var tipo=$("#userType").html();

    if(palabra !='' && buscarPor !='')
    {
        var data=$("#formularioBusquedaContacto").serialize();

        $.ajax({
                type: 'post',
                url: 'script/buscarContacto.php',
                data: data,
                dataType:'json',
                beforeSend: function()
                {
                    //$('#guionInicio').trigger('click');
                    // location.reload();
                },
                success: function(data)
                {
                    var r="";
                    if(data!='')
                    {
                        for(var a=0; a<data.length; a++)
                            {
                                var id=data[a]["id"];
                                var admin="<a class='btn btn-small btn-danger' onClick='borrarContacto("+id+")'>borrar</a>";


                                r+="<tr>";
                                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["nombre"]+"</td>";
                                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["apellido1"]+"</td>";
                                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["telefono"]+"</td>";
                                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["email"]+"</td>";
                                r+="<td onClick='muestraContactoCompleto("+id+")'>"+data[a]["empresa"]+"</td>";
                                r+="<td><a class='btn btn-small' onClick='editarContacto("+id+")'>editar</a>&nbsp;";
                                    if(tipo=="administrador")
                                        r= r+admin;

                                r+="</td>";
                                r+="</tr>";
                            }

                            $('#tbContactos').html(r);
                    }
                    else
                    {
                        alert("NINGUN RESULTADO DE: "+palabra+" FILTRADO POR: "+buscarPor);
                    }
                }

            });
    }
}

function borrarContacto(id)
{
    //muestra la ventana modal con la informacion del contacto a eliminar

    $("#mimodal4 .modal-body").load("includes/editaContacto.php",{id:id});

    $("#mimodal4").modal("show");
}

function eliminarContacto()
{
    var data=$("#formularioEditaContacto").serialize();

    $.ajax({
            type: 'post',
            url: 'script/eliminaContacto.php',
            data: data,
            success: function(data)
            {
                if(data>0)
                {
                    location.reload();
                }
                else
                {
                    alert("el contacto NO HA SIDO ELIMINADO de la base de datos");
                }
            }
        });
}

function volver()
{
    //funcion para volver a la ventana principal

    $("#mimodal2").modal("hide");
}
