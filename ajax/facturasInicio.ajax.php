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

    public $resultFac;
    public $folio;

    public function ajaxRegistrarFactura()
    {

        $valor = $this->resultFac;
        $folio = $this->folio;

        // echo "VALOR>>>> ".$valor;

        $respuesta = ControladorFacturacion::ctrRegistrarFactura($valor, $folio);

        echo $respuesta;
    }

}


if (isset($_POST["codigoVenta"])) {

    $verInfo = new AjaxVerInfo();
    $verInfo->codigoVenta = $_POST["codigoVenta"];
    $verInfo->ajaxVerInfoFac();
}

if(isset($_POST["Cfdi_Id"])){

    $fac = new AjaxVerInfo();
    $fac->resultFac = $_POST["Cfdi_Id"];
    $fac->folio = $_POST["folio"];
    $fac->ajaxRegistrarFactura();
}
