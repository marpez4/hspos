<?php

require_once "../controladores/facturacion.controlador.php";
require_once "../modelos/facturacion.modelo.php";


class AjaxVerInfo
{

    public $codigoVenta;

    public function ajaxVerInfoFac()
    {

        $item = "codigo";
        $valor = $this->codigoVenta;
        
        $respuesta = ControladorFacturacion::ctrVerInfoInicialFactura($item, $valor);

        echo json_encode($respuesta);
    }
}


if (isset($_POST["codigoVenta"])) {

    $verInfo = new AjaxVerInfo();
    $verInfo->codigoVenta = $_POST["codigoVenta"];
    $verInfo->ajaxVerInfoFac();
}
