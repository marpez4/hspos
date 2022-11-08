<?php

require_once "../controladores/pedidosPaqueteria.controlador.php";
require_once "../modelos/pedidosPaqueteria.modelo.php";

class AjaxPedidoPaqueteria{

    // EDITAR PEDIDO PAQUETERIA

    public $idPedidoPaqueteria;

    public function ajaxEditarPedidoPaqueteria(){

        $item = "id";
        $valor = $this->idPedidoPaqueteria;

        $respuesta = ControladorPedidosPaqueteria::ctrMostrarPaqueteria($item, $valor);

        echo json_encode($respuesta);
    }
}

// EDITAR PEDIDO PAQUETERIA

if(isset($_POST["idPedidoPaqueteria"])){

    $pedidoPaqueteria = new AjaxPedidoPaqueteria();
    $pedidoPaqueteria -> idPedidoPaqueteria = $_POST["idPedidoPaqueteria"];
    $pedidoPaqueteria -> ajaxEditarPedidoPaqueteria();
}