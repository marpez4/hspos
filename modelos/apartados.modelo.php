<?php

require_once "conexion.php";
class ModeloApartados
{

    /*=============================================
	MOSTRAR APARTADOS
	=============================================*/

    static public function mdlMostrarApartados($tabla, $item, $valor)
    {

        if ($item != null) {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id ASC");

            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

            $stmt->execute();

            return $stmt->fetch();
        } else {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id ASC ");

            $stmt->execute();

            return $stmt->fetchAll();
        }

        $stmt->closeCursor();

        $stmt = null;
    }

    static public function mdlSumarApartados($tabla, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("SELECT SUM(abono) AS TOTAL FROM $tabla WHERE $item = :$item");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

        $stmt->execute();

        return $stmt->fetch();

        $stmt->closeCursor();

        $stmt = null;
    }


    static public function mdlMostrarAbonos($tabla, $item, $valor)
    {

        if ($item != null) {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id ASC");

            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

            $stmt->execute();

            return $stmt->fetchAll();
        } else {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id ASC ");

            $stmt->execute();

            return $stmt->fetchAll();
        }

        $stmt->closeCursor();

        $stmt = null;
    }
}
