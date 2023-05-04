<?php
require_once "conexion.php";

class ModeloFacturacion
{

    static public function mdlMostrarCatalogos($tabla)
    {

        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;
    }

    static public function mdlVerInfoInicialFactura($tabla, $item, $valor)
    {

        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

        $stmt->execute();

        return $stmt->fetch();

        $stmt->close();

		$stmt = null;
    }
}
