<?php

require_once "conexion.php";
class ModeloApartados
{

    /*=============================================
	CREAR ABONO
	=============================================*/

    static public function mdlCrearAbono($tabla, $datos)
    {

        $fechaActual = new DateTime();
        $fechaFormateada = $fechaActual->format('Y-m-d H:i:s');

        $stmtA = Conexion::conectar()->prepare("SELECT * FROM pagos WHERE codigo_venta = $datos[folio]");

        $stmtA->execute();

        $abonadoBD = 0;
        $abonadoR = 0;

        foreach ($stmtA as $value) {

            $abonadoBD += $value["abono"];

            $abonadoR = $abonadoBD + $datos["abono"];
        }

        if ($abonadoR == $datos["totalVenta"]) {

            $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo_venta, total, fecha, abono, abonado) VALUES (:folio, :total, :fecha, :abono, :abonado)");

            $stmt->bindParam(":folio", $datos["folio"], PDO::PARAM_STR);
            $stmt->bindParam(":total", $datos["totalVenta"], PDO::PARAM_STR);
            $stmt->bindParam(":fecha", $fechaFormateada, PDO::PARAM_STR);
            $stmt->bindParam(":abono", $datos["abono"], PDO::PARAM_STR);
            $stmt->bindParam(":abonado", $abonadoR, PDO::PARAM_STR);

            $stmt->execute();

            $stmtU = Conexion::conectar()->prepare("UPDATE ventas SET apartado = 0 WHERE codigo = $datos[folio]");

            $stmtU->execute();

            $stmtI = Conexion::conectar()->prepare("SELECT MAX(id) AS id FROM $tabla");


            if ($stmtI->execute()) {

                $result = $stmtI->fetch(); // Obtener el resultado
                $idAbono = $result["id"];
                return $idAbono;
                
            } else {

                return "error";
            }
            $stmt->close();
            $stmt = null;
        } else {

            $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo_venta, total, fecha, abono, abonado) VALUES (:folio, :total, :fecha, :abono, :abonado)");

            $stmt->bindParam(":folio", $datos["folio"], PDO::PARAM_STR);
            $stmt->bindParam(":total", $datos["totalVenta"], PDO::PARAM_STR);
            $stmt->bindParam(":fecha", $fechaFormateada, PDO::PARAM_STR);
            $stmt->bindParam(":abono", $datos["abono"], PDO::PARAM_STR);
            $stmt->bindParam(":abonado", $abonadoR, PDO::PARAM_STR);

            if ($stmt->execute()) {

                return "ok";
            } else {

                return "error";
            }
            $stmt->close();
            $stmt = null;
        }
    }

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
    static public function mdlBorrarAbonos($tabla, $item, $valor)
    {
        $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE $item = :id");

        $stmt->bindParam(":id", $valor, PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();

        $stmt = null;
    }
}
