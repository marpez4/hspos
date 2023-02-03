<?php

require_once "../controladores/cortes.controlador.php";
require_once "../modelos/cortes.modelo.php";

class AjaxVerVentasCortes{

    public $idCaja;

    public function ajaxVerVentas(){

        $item = "id_caja";
        $valor = $this->idCaja;

        $respuesta = ControladorCierreCortes::ctrMostrarVentas($item, $valor);

        return $respuesta;
    }

}

// MANDAMO EL IDCAJA

    if(isset($_POST["caja"])){
        
        $idCaja = new AjaxVerVentasCortes();
        $idCaja -> idCaja = $_POST["caja"];
        $idCaja -> ajaxVerVentas();
    }