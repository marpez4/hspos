<?php
class ControladorFacturacion{

    static public function ctrMostrarCatalogos($tabla){

        $respuesta = ModeloFacturacion::mdlMostrarCatalogos($tabla);

        return $respuesta;
        
    }

    static public function ctrVerInfoInicialFactura($item, $valor){

        $tabla = "ventas";

        $respuesta = ModeloFacturacion::mdlVerInfoInicialFactura($tabla, $item, $valor);

        return $respuesta;

    }
}
