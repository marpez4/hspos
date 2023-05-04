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

        $stmt = Conexion::conectar()->prepare("SELECT id_cliente, productos, total FROM $tabla WHERE $item = :$item");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

        $stmt->execute();

        foreach ($stmt as $value) {

            $idCliente = $value["id_cliente"];
        }

        // CONSULTA DE CLIENTES 

        $stmtCl = Conexion::conectar()->prepare("SELECT nombre FROM clientes WHERE id = $idCliente");

        $stmtCl->execute();

        foreach ($stmtCl as $value) {

            $nombreCliente = $value["nombre"];
        }

        // DATOS DEL EMISOR

        $stmtEm = Conexion::conectar()->prepare("SELECT * FROM emisorfacturacion");

        $stmtEm->execute();

        foreach ($stmtEm as $value) {

            $nombreFiscal = $value["nombreFiscal"];
            $codigoPostal = $value["codigoPostal"];

        }

        $res = array(
            "idCliente" => $idCliente,
            "nombreCliente" => $nombreCliente,
            "nombreFiscal" => $nombreFiscal,
            "codigoPostal" => $codigoPostal
        );

        return $res;

        // return $stmt->fetch();

        // $stmt->close();

        // $stmt = null;
    }
}
