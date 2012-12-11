<?php

class Usuario {

    private $id;
    private $nombre;
    private $apellidos;
    private $email;
    private $password;
    private $activo;
    private $tipo;

    function asignaValores($fila)
    {
        $this->id=$fila['id'];
        $this->nombre=$fila['nombre'];
        $this->apellidos=$fila['apellidos'];
        $this->email=$fila['email'];
        $this->password=md5($fila['password']);
        $this->activo=$fila['activo'];
        $this->tipo=$fila['tipo'];
    }

    function getId()
    {
        return $this->id;
    }
    function getNombre()
    {
        return $this->nombre;
    }
    function getApellidos()
    {
        return $this->apellidos;
    }
    function getEmail()
    {
        return $this->email;
    }
    function getPassword()
    {
        return $this->password;
    }
    function getActivo()
    {
        return $this->activo;
    }
    function getTipo()
    {
        return $this->tipo;
    }

    function compruebaLogin($id, $password, $db)
    {
        $sql="select * from usuario where id='".$id."' and password='".md5($password)."' and activo='si';";
        //$conex=new MiBase();
        $resul=$db->consultar($sql);

        //si el numero de filas es 0 es que los datos no son correctos
        $numfilas=mysql_num_rows($resul);

        if($numfilas>0)
        {
            //el usuario existe
            //se asignan los datos obtenidos al objeto y devuelve true
            $fila = mysql_fetch_array($resul);
            $this->asignaValores($fila);

            return true;
        }
        else
        {
            //el usuario no existe
            return false;
        }
    }

}

?>
