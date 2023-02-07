<?php
class ControladorPedidosPaqueteria
{

    // CREAR PEDIDO PAQUETERIA

    static public function ctrCrearPaqueteria()
    {

        if (isset($_POST["nuevoNombre"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombre"]) &&
                preg_match('/^[0-9]+$/', $_POST["nuevoTelefono"])
            ) {

                $tabla = "pedidosPaqueteria";


                $directorio = "./uploads/";

                $archivo = $directorio . basename($_FILES["archivo"]["name"]);
                $tipoArchivo =  strtolower(pathinfo($archivo, PATHINFO_EXTENSION));

                // if ($tipoArchivo != 'jpg' || $tipoArchivo != 'jpeg' || $tipoArchivo != 'png' || $tipoArchivo != 'pdf') {
                //     echo '<script>

                //     swal({

                //         type: "error",
                //         title: "¡Tipo de archivo no admitido!",
                //         showConfirmButton: true,
                //         confirmButtonText: "Cerrar"

                //     }).then(function(result){

                //         return;

                //     });


                //     </script>';
                //     return;
                // }

                if (move_uploaded_file($_FILES["archivo"]["tmp_name"], $archivo)) {
                    // echo 'ya se subio';
                }

                $datos = array(
                    "folio" => $_POST["nuevoFolio"],
                    "nombre" => $_POST["nuevoNombre"],
                    "calle" => $_POST["nuevaCalle"],
                    "colonia" => $_POST["nuevaColonia"],
                    "cp" => $_POST["nuevoCp"],
                    "ciudad" => $_POST["nuevaCiudad"],
                    "estado" => $_POST["nuevoEstado"],
                    "telefono" => $_POST["nuevoTelefono"],
                    "entreCalles" => $_POST["nuevaCalles"],
                    "referencias" => $_POST["nuevaReferencia"],
                    "archivo" => basename($_FILES["archivo"]["name"])
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

    static public function ctrEditarPedidoPaqueteria()
    {

        if (isset($_POST["editarNombre"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"])
            ) {

                $tabla = "pedidospaqueteria";

                $datos = array(
                    "folio" => $_POST["editarFolio"],
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

    static public function ctrBorrarPedidoPaqueteria()
    {

        if (isset($_GET["idPedidoPaqueteria"])) {

            $tabla = "pedidospaqueteria";

            $datos = $_GET["idPedidoPaqueteria"];

            $respuesta = ModeloPedidosPaqueteriasAdmn::mdlBorrarPedidoPaqueteria($tabla, $datos);

            if ($respuesta == "ok") {

                echo '<script>
    
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

    static public function ctrCambiarEstatus($valor1, $valor2, $valor3)
    {

        $tabla = "pedidospaqueteria";

        $datos = array(
            "idPaqueteria" => $valor1,
            "estatus" => $valor2,
            "usuario" => $valor3
        );

        $respuesta = ModeloPedidosPaqueteriasAdmn::mdlCambiarEstatusPedido($tabla, $datos);

        return $respuesta;
    }

    static public function verHistoryPaq($item, $valor)
    {
        $tabla = "pedido_paqueteria_hmov";

        $respuesta = ModeloPedidosPaqueteriasAdmn::mdlVerHistory($tabla, $item, $valor);

        return $respuesta;
    }
}
