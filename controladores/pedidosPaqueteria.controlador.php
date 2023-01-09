<?php
class ControladorPedidosPaqueteria
{

    // CREAR PEDIDO PAQUETERIA

    static public function ctrCrearPaqueteria()
    {

        if (isset($_POST["nuevoNombre"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombre"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ#. ]+$/', $_POST["nuevaCalle"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaColonia"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoCp"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevaCiudad"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoEstado"]) &&
                preg_match('/^[0-9]+$/', $_POST["nuevoTelefono"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ#. ]+$/', $_POST["nuevaCalles"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ#. ]+$/', $_POST["nuevaReferencia"])
            ) {

                $tabla = "pedidosPaqueteria";

                $datos = array(
                    "nombre" => $_POST["nuevoNombre"],
                    "calle" => $_POST["nuevaCalle"],
                    "colonia" => $_POST["nuevaColonia"],
                    "cp" => $_POST["nuevoCp"],
                    "ciudad" => $_POST["nuevaCiudad"],
                    "estado" => $_POST["nuevoEstado"],
                    "telefono" => $_POST["nuevoTelefono"],
                    "entreCalles" => $_POST["nuevaCalles"],
                    "referencias" => $_POST["nuevaReferencia"]
                );

                $respuesta = ModeloPedidosPaqueteriasAdmn::mdlIngresarPedidoPaqueteriaAdmn($tabla, $datos);

                if ($respuesta == "ok") {

                    echo '<script>

                swal({

                    type: "success",
                    title: "¡Se han enviado correctamente tus datos!",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"

                }).then(function(result){

                    if(result.value){
                    
                        window.location = "pedidosPaqueteria";

                    }

                });
            

                </script>';
                }
            } else {

                echo '<script>

                swal({

                    type: "error",
                    title: "¡Los datos no pueden ir vacios o llevar caracteres especiales!",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"

                }).then(function(result){

                    if(result.value){
                    
                        window.location = "pedidosPaqueteria";

                    }

                });
            

            </script>';
            }
        }
    }

    // MOSTRAR PEDIDOS PAQUETERIA

    static public function ctrMostrarPaqueteria($item, $valor)
    {

        $tabla = "pedidospaqueteria";

        $respuesta = ModeloPedidosPaqueteriasAdmn::mdlMostrarPedidosPaqueterias($tabla, $item, $valor);

        return $respuesta;
    }

    /*=============================================
	EDITAR PEDIDO CATEGORIA
	=============================================*/

    static public function ctrEditarPedidoPaqueteria(){

        if (isset($_POST["editarNombre"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ# ]+$/', $_POST["editarCalle"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarColonia"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarCp"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarCiudad"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarEstado"]) &&
                preg_match('/^[0-9]+$/', $_POST["editarTelefono"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarCalles"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarReferencia"])
            ) {

                $tabla = "pedidospaqueteria";

                $datos = array(
                    "nombre" => $_POST["editarNombre"],
                    "calle" => $_POST["editarCalle"],
                    "colonia" => $_POST["editarColonia"],
                    "cp" => $_POST["editarCp"],
                    "ciudad" => $_POST["editarCiudad"],
                    "estado" => $_POST["editarEstado"],
                    "telefono" => $_POST["editarTelefono"],
                    "entreCalles" => $_POST["editarCalles"],
                    "referencias" => $_POST["editarReferencia"],
                    "id" => $_POST["idPedidoPaqueteria"]
                );

                $respuesta = ModeloPedidosPaqueteriasAdmn::mdlEditarPedidoPaqueteriaAdmn($tabla, $datos);

                if ($respuesta == "ok") {

                    echo '<script>

                swal({

                    type: "success",
                    title: "¡Se han editado correctamente tus datos!",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"

                }).then(function(result){

                    if(result.value){
                    
                        window.location = "pedidosPaqueteria";

                    }

                });
            

                </script>';
                }
            } else {

                echo '<script>

                swal({

                    type: "error",
                    title: "¡Los datos no pueden ir vacios o llevar caracteres especiales!",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"

                }).then(function(result){

                    if(result.value){
                    
                        window.location = "pedidosPaqueteria";

                    }

                });
            

            </script>';
            }



        }

    }

        static public function ctrBorrarPedidoPaqueteria(){

            if(isset($_GET["idPedidoPaqueteria"])){

                $tabla = "pedidospaqueteria";

                $datos = $_GET["idPedidoPaqueteria"];

                $respuesta = ModeloPedidosPaqueteriasAdmn::mdlBorrarPedidoPaqueteria($tabla, $datos);

                if($respuesta == "ok"){

                    echo'<script>
    
                        swal({
                              type: "success",
                              title: "El registro ha sido borrado correctamente",
                              showConfirmButton: true,
                              confirmButtonText: "Cerrar"
                              }).then(function(result){
                                        if (result.value) {
    
                                        window.location = "pedidosPaqueteria";
    
                                        }
                                    })
    
                        </script>';
                }
                
        }
    }


    }
    
