<?php
require_once "../controladores/cortes.controlador.php";
require_once "../modelos/cortes.modelo.php";

class AjaxCerrarCaja{

    /*=============================================
	TREAR INFO CORTE
	=============================================*/	

    public function ajaxTraerInfoCorte(){

        $item = "estatus";
        $valor = 1;

        $respuesta = ControladorCierreCortes::ctrMostrarInfoCorte($item, $valor);

        echo json_encode($respuesta);

    }

}

$cierre = new AjaxCerrarCaja();
$cierre -> ajaxTraerInfoCorte();

