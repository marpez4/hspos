<?php 

class ControladorComponentes{

    // MOSTRAR COMPONENTES

    static public function ctrMostrarComponente($item, $valor){

        $tabla = "componentes";

        $respuesta = ModeloComponentes::mdlMostrarComponentes($tabla, $item, $valor);

        return $respuesta;
    }
}
