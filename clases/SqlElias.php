<?php

class SqlElias
{
	private $conexion;
	private $total_consultas;
	private $db="agenda";
	private $user="agenda";
	// private $pass="agenda";

	function conexionbd()
	{
	    if(!isset($this->conexion))
	    {
	        $this->conexion = (msql_connect("localhost",$this->user,$this->pass)) or
	        die(mysql_error());

	        mysql_select_db($this->bd, $this->conexion) or
	        die(mysql_error());
	        mysql_query("SET NAMES 'utf8'");
	    }
	}

	function damelink()
	{
	    return $this->conexion;
	}

	function consulta($sql)
	{
	    $this->total_consultas++;
	    $resultado = mysql_query($sql, $this->conexion);

	    if(!$resultado)
	    {
	        echo 'MySQL Error: '.mysql_error();
	        exit;
	    }
	    return resultado;
	}
}
?>