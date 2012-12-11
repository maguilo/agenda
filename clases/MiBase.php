<?php
class MiBase
{
     private $c="";
     private $base= "agenda";
     private $servidor= "localhost";
     private $usuario=  "agenda";
     private $clave=   "agenda";

     public function __construct()
     {
        $this->c= mysql_connect($this->servidor, $this->usuario, $this->clave);

        if (!$this->c)
        {
            exit("fallo en la conexion");
        }
        if (!mysql_select_db($this->base))
        {
            exit("fallo al intentar abrir la bd $this->base");
        }

        mysql_query("set names 'utf8'");//establece el cifrado en utf8
     }

     public function desconectarBd()
     {
         if ($this->c != null)
         {
             mysql_close($this->c);
         }
     }


    public function consultar($t)
    {
        $resu= mysql_query($t, $this->c);
        if (!$resu)
        {
            $s = "error al ejecutar la orden: ".$t;
            exit($s);
        }
        return $resu;
    }

    public function seleccionarBd($bd)
    {
        mysql_select_db($bd,$this->c);
    }

    public function ver($t)
    {
        $resu= mysql_query($t, $this->c);
        $s="<h3>".$t."</h3>";

        if (!$resu)
        {
            $s = "error al ejecutar la orden: ".$t;
            exit($s);
        }

        $s.="<table border='1' style='border-collapse: collapse;'><tr>";
        for ($i=0; $i<mysql_num_fields($resu); $i++)
             $s.="<th>".mysql_field_name($resu, $i)."</th>";

        $s.="</tr>";

        while ($linea= mysql_fetch_row($resu))
        {
            $s.="<tr>";
            foreach($linea as $valor)
            {
                $s.="<td>".$valor."</td>";
            }
            $s.="</tr>";
        }
        return $s."</table>";
    }
}
?>