<?php 

require_once "../controladores/servicios.controlador.php";
require_once "../modelos/servicios.modelo.php";

class AjaxServicios{

// EDITAR SERVICIO

public $idServicio;

    public function ajaxEditarServicio(){

        $item = "id";
        $valor = $this->idServicio;

        $respuesta = ControladorServicios::ctrMostrarServicios($item, $valor);

        echo json_encode($respuesta);
    }

}

// EDITAR SERVICIO

if(isset($_POST["idServicio"])){

    $servicio = new AjaxServicios();
    $servicio -> idServicio = $_POST["idServicio"];
    $servicio -> ajaxEditarServicio();
}