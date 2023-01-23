<?php

require_once "conexion.php";

class ModeloPedidosPaqueteriasAdmn
{

    static public function mdlMostrarPedidosPaqueterias($tabla, $item, $valor)
    {

        if ($item != null) {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

            $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);

            $stmt->execute();

            return $stmt->fetch();
        } else {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

            $stmt->execute();

            return $stmt->fetchAll();
        }

        $stmt->close();

        $stmt = null;
    }

    static public function mdlIngresarPedidoPaqueteriaAdmn($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombreCompleto, calle, colonia, cp, idCiudad, idEstado, telefono, entreCalles, referencias ) VALUES (:nombreCompleto, :calle, :colonia, :cp, :ciudad, :estado, :telefono, :entreCalles, :referencias)");

        $stmt->bindParam(":nombreCompleto", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":calle", $datos["calle"], PDO::PARAM_STR);
        $stmt->bindParam(":colonia", $datos["colonia"], PDO::PARAM_STR);
        $stmt->bindParam(":cp", $datos["cp"], PDO::PARAM_INT);
        $stmt->bindParam(":ciudad", $datos["ciudad"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
        $stmt->bindParam(":entreCalles", $datos["entreCalles"], PDO::PARAM_STR);
        $stmt->bindParam(":referencias", $datos["referencias"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();
        $stmt = null;
    }

    static public function mdlEditarPedidoPaqueteriaAdmn($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET nombreCompleto = :nombreCompleto, calle = :calle, colonia = :colonia, cp = :cp, idCiudad = :ciudad, idEstado = :estado, telefono = :telefono, entreCalles = :entreCalles, referencias = :referencias WHERE id = :id");

        $stmt->bindParam(":nombreCompleto", $datos["nombre"], PDO::PARAM_STR);
        $stmt->bindParam(":calle", $datos["calle"], PDO::PARAM_STR);
        $stmt->bindParam(":colonia", $datos["colonia"], PDO::PARAM_STR);
        $stmt->bindParam(":cp", $datos["cp"], PDO::PARAM_INT);
        $stmt->bindParam(":ciudad", $datos["ciudad"], PDO::PARAM_STR);
        $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
        $stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
        $stmt->bindParam(":entreCalles", $datos["entreCalles"], PDO::PARAM_STR);
        $stmt->bindParam(":referencias", $datos["referencias"], PDO::PARAM_STR);
        $stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();
        $stmt = null;
    }
    static public function mdlBorrarPedidoPaqueteria($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id = :id");

        $stmt->bindParam(":id", $datos, PDO::PARAM_INT);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();

        $stmt = null;
    }

    static public function mdlCambiarEstatusPedido($tabla, $datos)
    {

        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET estatus = :estatus WHERE id = :id");

        $stmt->bindParam(":estatus", $datos["estatus"], PDO::PARAM_INT);
        $stmt->bindParam(":id", $datos["idPaqueteria"], PDO::PARAM_INT);

        $stmt->execute();

        $tabla2 = "pedido_paqueteria_hmov";
        
        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla2(id_paqueteria, estatus, id_usuario) VALUES (:id, :estatus, :id_usuario)");

        $stmt->bindParam(":estatus", $datos["estatus"], PDO::PARAM_INT);
        $stmt->bindParam(":id", $datos["idPaqueteria"], PDO::PARAM_INT);
        $stmt->bindParam(":id_usuario", $datos["usuario"], PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();
        $stmt = null;

    }
}
