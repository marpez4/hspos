<?php

require_once "conexion.php";

class ModeloPedidosPaqueteria{

    // INGRESAR PEDIDO

    static public function mdlIngresarPedidoPaqueteria($tabla, $datos){

        $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombreCompleto, calle, colonia, cp, idCiudad, idEstado, telefono, entreCalles, referencias, archivo ) VALUES (:nombreCompleto, :calle, :colonia, :cp, :ciudad, :estado, :telefono, :entreCalles, :referencias, :archivo)");

			$stmt->bindParam(":nombreCompleto", $datos["nombre"], PDO::PARAM_STR);
			$stmt->bindParam(":calle", $datos["calle"], PDO::PARAM_STR);
			$stmt->bindParam(":colonia", $datos["colonia"], PDO::PARAM_STR);
			$stmt->bindParam(":cp", $datos["cp"], PDO::PARAM_INT);
            $stmt->bindParam(":ciudad", $datos["ciudad"], PDO::PARAM_STR);
            $stmt->bindParam(":estado", $datos["estado"], PDO::PARAM_STR);
            $stmt->bindParam(":telefono", $datos["telefono"], PDO::PARAM_STR);
            $stmt->bindParam(":entreCalles", $datos["entreCalles"], PDO::PARAM_STR);
            $stmt->bindParam(":referencias", $datos["referencias"], PDO::PARAM_STR);
            $stmt->bindParam(":archivo", $datos["archivo"], PDO::PARAM_STR);

            if($stmt->execute()){

                return "ok";
    
            }else{
    
                return "error";
            
            }
    
            $stmt->close();
            $stmt = null;
        

    }

}