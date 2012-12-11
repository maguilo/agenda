<?php
class Contacto {

    private $id;
    private $alias;
    private $nombre;
    private $apellido1;
    private $apellido2;
    private $empresa;
    private $cargo;
    private $direccion;
    private $poblacion;
    private $cp;
    private $provincia;
    private $pais;
    private $telefono;
    private $fax;
    private $movil;
    private $tlfParticular;
    private $email;
    private $contactoDe;
    private $notas;
    private $visible;

    function asignaValores($fila)
    {
        $this->id = $fila['id'];
        $this->alias = $fila['alias'];
        $this->nombre = $fila['nombre'];
        $this->apellido1 = $fila['apellido1'];
        $this->apellido2 = $fila['apellido2'];
        $this->empresa = $fila['empresa'];
        $this->cargo = $fila['cargo'];
        $this->direccion = $fila['direccion'];
        $this->poblacion = $fila['poblacion'];
        $this->cp = $fila['cp'];
        $this->provincia = $fila['provincia'];
        $this->pais = $fila['pais'];
        $this->telefono = $fila['telefono'];
        $this->fax = $fila['fax'];
        $this->movil = $fila['movil'];
        $this->tlfParticular = $fila['tlfParticular'];
        $this->email = $fila['email'];
        $this->contactoDe = $fila['contactoDe'];
        $this->notas= $fila['notas'];
        $this->visible= $fila['visible'];
    }

    function asignarValoresPorId($id,$conexion)
    {
        $sql="select * from contacto where id='".$id."' limit 1";
        $res=$conexion->consultar($sql);

        while($fila=mysql_fetch_array($res))
        {
            $this->id = $fila['id'];
            $this->alias = $fila['alias'];
            $this->nombre = $fila['nombre'];
            $this->apellido1 = $fila['apellido1'];
            $this->apellido2 = $fila['apellido2'];
            $this->empresa = $fila['empresa'];
            $this->cargo = $fila['cargo'];
            $this->direccion = $fila['direccion'];
            $this->poblacion = $fila['poblacion'];
            $this->cp = $fila['cp'];
            $this->provincia = $fila['provincia'];
            $this->pais = $fila['pais'];
            $this->telefono = $fila['telefono'];
            $this->fax = $fila['fax'];
            $this->movil = $fila['movil'];
            $this->tlfParticular = $fila['tlfParticular'];
            $this->email = $fila['email'];
            $this->contactoDe = $fila['contactoDe'];
            $this->notas = $fila['notas'];
            $this->visible = $fila['visible'];
        }
    }

    function getId()
    {
        return $this->id;
    }
    function getAlias()
    {
        return $this->alias;
    }
    function getNombre()
    {
        return $this->nombre;
    }
    function getApellido1()
    {
        return $this->apellido1;
    }
    function getApellido2()
    {
        return $this->apellido2;
    }
    function getEmpresa()
    {
        return $this->empresa;
    }
    function getCargo()
    {
        return $this->cargo;
    }
    function getDireccion()
    {
        return $this->direccion;
    }
    function getPoblacion()
    {
        return $this->poblacion;
    }
    function getProvincia()
    {
        return $this->provincia;
    }
    function getCp()
    {
        return $this->cp;
    }
    function getPais()
    {
        return $this->pais;
    }
    function getTelefono()
    {
        return $this->telefono;
    }
    function getFax()
    {
        return $this->fax;
    }
    function getMovil()
    {
        return $this->movil;
    }
    function getTlfParticular()
    {
        return $this->tlfParticular;
    }
    function getEmail()
    {
        return $this->email;
    }
    function getContactoDe()
    {
        return $this->contactoDe;
    }
    function getNotas()
    {
        return $this->notas;
    }
    function getVisible()
    {
        return $this->visible;
    }

    function compruebaContactoNuevo($nombre, $contactoDe)
    {
        //si los campos obligatorios estan vacios devuelve 0 sino devuelve 1
        if($nombre!='' && $contactoDe!='')
            {
                //comprobacion validada
                return true;
            }
        else
            {
                //comprobacion invalida
                return false;
            }
    }

    function agregaContactoNuevo($contacto, $conex)
    {
        $sql="insert into contacto values
            ('',
            '".ucwords($contacto->getAlias())."',
            '".ucwords($contacto->getNombre())."',
            '".ucwords($contacto->getApellido1())."',
            '".ucwords($contacto->getApellido2())."',
            '".ucwords($contacto->getEmpresa())."',
            '".$contacto->getCargo()."',
            '".$contacto->getDireccion()."',
            '".ucwords($contacto->getPoblacion())."',
            '".$contacto->getCp()."',
            '".ucwords($contacto->getProvincia())."',
            '".ucwords($contacto->getPais())."',
            '".$contacto->getTelefono()."',
            '".$contacto->getFax()."',
            '".$contacto->getMovil()."',
            '".$contacto->getTlfParticular()."',
            '".$contacto->getEmail()."',
            '".$contacto->getContactoDe()."',
            '".$contacto->getNotas()."',
            'si');";

        if($conex->consultar($sql))
            return true;
        return false;
    }

    function editaContacto($conex)
    {
        $sql="UPDATE  `agenda`.`contacto` SET
            `alias` =  '".ucwords($this->getAlias())."',
            `nombre` =  '".ucwords($this->getNombre())."',
            `apellido1` =  '".ucwords($this->getApellido1())."',
            `apellido2` =  '".ucwords($this->getApellido2())."',
            `empresa` =  '".ucwords($this->getEmpresa())."',
            `cargo` =  '".$this->getCargo()."',
            `direccion` =  '".$this->getDireccion()."',
            `poblacion` =  '".ucwords($this->getPoblacion())."',
            `cp` =  '".$this->getCp()."',
            `provincia` =  '".ucwords($this->getProvincia())."',
            `pais` =  '".ucwords($this->getPais())."',
            `telefono` =  '".$this->getTelefono()."',
            `fax` =  '".$this->getFax()."',
            `movil` =  '".$this->getMovil()."',
            `tlfParticular` =  '".$this->getTlfParticular()."',
            `email` =  '".$this->getEmail()."',
            `contactoDe` =  '".$this->getContactoDe()."',
            `notas` =  '".$this->getNotas()."',
            `visible` =  'si' WHERE  `contacto`.`id` ='".$this->getId()."';";

        $r=$conex->consultar($sql);

        if($r)
            return true;
        return false;
    }

    function eliminaContacto($conex)
    {
        $sql="UPDATE  `agenda`.`contacto` SET
            `visible` =  'no' WHERE  `contacto`.`id` ='".$this->getId()."';";

        $r=$conex->consultar($sql);

        if($r)
            return true;
        return false;
    }
}

?>
