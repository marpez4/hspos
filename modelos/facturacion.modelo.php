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

        $stmt = Conexion::conectar()->prepare("SELECT id_cliente, productos, total, neto, impuesto  FROM $tabla WHERE $item = :$item");

        $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

        $stmt->execute();

        foreach ($stmt as $value) {

            $idCliente = $value["id_cliente"];
            $productos = $value["productos"];
            $total =  $value["neto"];
            $subtotal = $value["total"];
            $impuesto = $value["impuesto"];
        }

        // CONSULTA DE CLIENTE 

        $stmtCl = Conexion::conectar()->prepare("SELECT nombre FROM clientes WHERE id = $idCliente");

        $stmtCl->execute();

        foreach ($stmtCl as $value) {

            $nombreCliente = $value["nombre"];
        }

        // CONSULTA DE DATOS DE FACTURA DEL CLIENTE

        $stmtClF = Conexion::conectar()->prepare("SELECT * FROM cliente_infofac WHERE id_cliente = $idCliente");

        $stmtClF->execute();

        foreach ($stmtClF as $value) {

            $cfdiCliente = $value["CfdiUse"];
            $rfcCliente = $value["Rfc"];
            $regimenCliente = $value["FiscalRegime"];
            $cpCliente = $value["ZipCode"];
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
            "codigoPostal" => $codigoPostal,
            "cfdiCliente" => $cfdiCliente, 
            "rfcCliente" => $rfcCliente, 
            "regimenCliente" => $regimenCliente, 
            "cpCliente" => $cpCliente,
            "productos" => $productos,
            "neto" => $total,
            "subTotal" => $subtotal,
            "impuesto" => $impuesto
        );

        return $res;

        // return $stmt->fetch();

        // $stmt->close();

        // $stmt = null;
    }
}
