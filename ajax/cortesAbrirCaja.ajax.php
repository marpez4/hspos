<?php 

require_once "../controladores/cajas.controlador.php";
require_once "../modelos/cajas.modelo.php";

class ajaxCortes{

    /*=============================================
	TREAR INFO CORTE
	=============================================*/	

	public function ajaxAsignarCaja(){

		$item = "estatus";
		$valor = 1;

		$respuesta = ControladorCajas::ctrMostrarCajas($item, $valor);

		echo json_encode($respuesta);

	}

}

$caja = new ajaxCortes();
$caja -> ajaxAsignarCaja();

?>