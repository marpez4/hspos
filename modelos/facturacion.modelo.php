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

    static public function mdlVerInfoInicialFactura($item, $valor, $tabla)
    {

        $stmt = Conexion::conectar()->prepare("SELECT * FROM ventas WHERE codigo = 10001");

        // $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

        if ($stmt->execute()) {

            foreach ($stmt as $value) {

                $idCaja = $value["id"];
            }
        }

        $res = array(
            "idCaja" => $idCaja
        );

        return $res;
    }
}
