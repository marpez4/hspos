<?php

class Conexion{

    static public function conectar(){

        $link = new PDO("mysql:host=localhost;
                            dbname=u369022823_pos", 
                            "u369022823_pos",
                            "4776632304Etropos1BD*");

        $link->exec("set names utf8");

        return $link;
    }
} 