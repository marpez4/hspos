<?php
class ControladorFacturacion{

    static public function ctrMostrarCatalogos($tabla){

        $respuesta = ModeloFacturacion::mdlMostrarCatalogos($tabla);

        return $respuesta;
        
    }
}
