<?php

require_once "conexion.php";

class ModeloComponentes{


    static public function mdlMostrarComponentes($tabla, $item, $valor){

        if($item != null){

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();  

        }else{

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY capacidad ASC");

			$stmt -> execute();

			return $stmt -> fetchAll();

        }
        
        $stmt -> close();

		$stmt = null;

    }
}