<?php

require_once "../controladores/pedidosPaqueteria.controlador.php";
require_once "../controladores/ext.controlador.php";
require_once "../modelos/pedidosPaqueteria.modelo.php";

class AjaxPedidoPaqueteria
{

    // EDITAR PEDIDO PAQUETERIA

    public $idPedidoPaqueteria;

    public function ajaxEditarPedidoPaqueteria()
    {

        $item = "id";
        $valor = $this->idPedidoPaqueteria;

        $respuesta = ControladorPedidosPaqueteria::ctrMostrarPaqueteria($item, $valor);

        echo json_encode($respuesta);
    }

    public function ajaxCambiarEstatus($valor1, $valor2, $valor3)
    {

        $respuesta = ControladorPedidosPaqueteria::ctrCambiarEstatus($valor1, $valor2, $valor3);

        echo json_encode($respuesta);
    }

    public function ajaxVerHistory($valor)
    {

        $item = "id_paqueteria";
        $valor = $valor;

        $respuesta = ControladorPedidosPaqueteria::verHistoryPaq($item, $valor);

        return $respuesta;
    }
}

// EDITAR PEDIDO PAQUETERIA

if (isset($_POST["idPedidoPaqueteria"])) {

    $pedidoPaqueteria = new AjaxPedidoPaqueteria();
    $pedidoPaqueteria->idPedidoPaqueteria = $_POST["idPedidoPaqueteria"];
    $pedidoPaqueteria->ajaxEditarPedidoPaqueteria();
}

if (isset($_POST["cambioEstatus"])) {

    $cambioEstatus = new AjaxPedidoPaqueteria();
    $cambioEstatus->ajaxCambiarEstatus($_POST["idPedidoPaqueteriaE"], $_POST["estatus"], $_POST["usuario"]);
}

if (isset($_POST["verHistorial"])) {

    $verHistory = new AjaxPedidoPaqueteria();
    $verHistory->ajaxVerHistory($_POST["idPaqueteriaH"]);
}
