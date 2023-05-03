<?php

require_once "../controladores/facturacion.controlador.php";
require_once "../modelos/facturacion.modelo.php";


class AjaxVerInfoInicialFactura{

    public $codigoVenta;

    public function ajaxVerInfoInicialFactura(){

        $item = "codigo";
        $valor = $this->codigoVenta;

        $respuesta = ControladorFacturacion::mdlVerInfoInicialFactura($item, $valor);

        echo json_encode($respuesta);
    }
}

if(isset($_POST["codigoVenta"])){

    $codigoVenta = new AjaxVerInfoInicialFactura();
    $codigoVenta -> codigoVenta = $_POST["codigoVenta"];
    $codigoVenta -> ajaxVerInfoInicialFactura();
}