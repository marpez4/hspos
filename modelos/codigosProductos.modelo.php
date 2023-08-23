<?php

require_once "conexion.php";

class ModeloCodigosProductos
{

    static public function mdlCrearCodigoProducto($tabla, $datos)
    {

        $fecha = date("Y-m-d H:i:s");

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(codigo, cantidad, descripcion, fecha) VALUES (:codigoPr, :cantidad, :descripcion, :fecha)");

        $stmt->bindParam(":codigoPr", $datos["codigoPr"], PDO::PARAM_INT);
        $stmt->bindParam(":cantidad", $datos["cantidad"], PDO::PARAM_INT);
        $stmt->bindParam(":descripcion", $datos["descripcion"], PDO::PARAM_STR);
        $stmt->bindParam(":fecha", $fecha, PDO::PARAM_STR);

        if ($stmt->execute()) {

            return "ok";
        } else {

            return "error";
        }

        $stmt->close();
        $stmt = null;
    }

    static public function mdlMostrarCodigosProductos($tabla)
    {

        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY id ASC");

        $stmt->execute();

        return $stmt->fetchAll();

        $stmt->close();

        $stmt = null;
    }

    static public function mdlMostrarCodigosProductosPDF($tabla, $id)
    {

        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE id = $id");

        $stmt->execute();

        return $stmt->fetch();

        $stmt->close();

        $stmt = null;
    }

    static public function mdlEliminarCodigoB($tabla, $datos){

        $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE codigo = :id");

		$stmt -> bindParam(":id", $datos, PDO::PARAM_INT);

        unlink('extensiones/tcpdf/pdf/codigos/'.$datos.'.png');     

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		$stmt -> close();

		$stmt = null;

    }
}
