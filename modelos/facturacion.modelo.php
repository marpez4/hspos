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

    static public function mdlEmitirfactura($datos)
    {

        $stmt = Conexion::conectar()->prepare("SELECT productos, codigo  FROM ventas WHERE codigo = :folio");

        $stmt->bindParam(":folio", $datos["Folio"], PDO::PARAM_INT);

        $stmt->execute();

        foreach ($stmt as $value) {

            $productos = $value["productos"];
        }

        $item = json_decode($productos, true);

        $newData = json_encode($datos);

        $itemsJson = '[';

        for ($i = 0; $i < count($item); $i++) {

            $itemsJson .= '{
                "ProductCode" : "' . $item[$i]["unitCode"] . '",
                "IdentificationNumber" : "' . $item[$i]["identificationNumber"] . '",
                "Description": "' . $item[$i]["descripcion"] . '",
                "Unit" : "' . $item[$i]["unitCode"] . '",
                "UnitCode" : "' . $item[$i]["unit"] . '",
                "UnitPrice" : ' . $item[$i]["precio"] . ',
                "Quantity" : ' . $item[$i]["cantidad"] . ',
                "Subtotal" :' . $item[$i]["subTotal"] . ',
                "TaxObject" : "' . $item[$i]["taxObj"] . '",';
            if ($item[$i]["impuesto"] != 0) {
                $itemsJson .= ' "Taxes": [{
                "Total" : ' . $item[$i]["impuestoFinal"] . ',
                "Name" : "IVA",
                "Base" : ' . $item[$i]["subTotal"] . ',
                "Rate" : ' . $item[$i]["impuesto"] . ',
                "IsRetention" : false,
                }],';
            }
            $itemsJson .= ' "Total" : ' . $item[$i]["totalNeto"] . '
            },';
        }

        $itemsJson .=   ']';

        //  echo $itemsJson;

        //     var obj = [{
        //         "ProductCode" => $productos[$i]["unitCode"]
        //         "IdentificationNumber" => $productos[$i]["identificationNumber"]
        //         "Description" => $productos[$i]["descripcion"]
        //         "Unit" => $productos[$i]["unit"]
        //         "UnitCode" => $productos[$i]["unitCode"]
        //         "UnitPrice" => $productos[$i]["precio"]
        //         "Quantity" => $productos[$i]["cantidad"]
        //         "Subtotal" => $productos[$i]["subTotal"]
        //         "Taxes" => [
        //             {
        //                 "Total" => $productos[$i]["impuestoFinal"]
        //                 "Name" => "IVA",
        //                 "Base" => $productos[$i]["subTotal"]
        //                 "Rate" => $productos[$i]["impuesto"]
        //                 "IsRetention" => false
        //             }
        //         ],
        //         "Total" => $productos[$i]["totalNet"]
        //     }]
        // }

        echo '<script>emisionFactura(' . $newData . ', ' . $itemsJson . ')</script>';
    }

    static public function mdlRegistrarFactura($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(respuesta, estatus, folio) VALUES (:respuesta, :estatus, :folio)");

        $stmt->bindParam(":respuesta", $datos["valores"], PDO::PARAM_STR);
        $stmt->bindParam(":estatus", 1, PDO::PARAM_INT);
        $stmt->bindParam(":folio", 10001, PDO::PARAM_INT);

        $stmt->execute();
    }
}
