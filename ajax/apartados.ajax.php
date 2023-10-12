<?php

require_once "../controladores/apartados.controlador.php";
require_once "../modelos/apartados.modelo.php";


class AjaxVerInfoApartados
{

    public $codigoVenta;
    public $idAbono;

    public function ajaxVerInfoApartado()
    {

        $item = "codigo_venta";
        $valor = $this->codigoVenta;

        $respuesta = ControladorApartados::ctrMostrarAbonos($item, $valor);

        echo json_encode($respuesta);
    }

    public function ajaxBorrarApartado(){

        $item = "id";
        $valor = $this->idAbono;

        $respuesta = ControladorApartados::ctrBorrarAbono($item, $valor);

        echo json_encode($respuesta);

    }
}


if (isset($_POST["codigoVenta"])) {

    $verInfo = new AjaxVerInfoApartados();
    $verInfo->codigoVenta = $_POST["codigoVenta"];
    $verInfo->ajaxVerInfoApartado();
}

if(isset($_POST["idAbono"])){
    $borrarAbono = new AjaxVerInfoApartados();
    $borrarAbono->idAbono = $_POST["idAbono"];
    $borrarAbono->ajaxBorrarApartado();
}