<?php

class ControladorExt
{

    static public function ctrExt()
    {

        include "vistas/pedidoPaqueteria.php";
    }

    static public function ctrIngresarPedidoPaqueteria()
    {

        require_once "./modelos/ext.modelo.php";

        if (isset($_POST["nombre"])) {

            if (
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nombre"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["calle"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["colonia"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["cp"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["ciudad"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["estado"]) &&
                preg_match('/^[0-9]+$/', $_POST["telefono"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["entreCalles"]) &&
                preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["referencias"])
            ) {

                $tabla = "pedidosPaqueteria";

                $directorio = "./uploads/";

                $archivo = $directorio . basename($_FILES["archivo"]["name"]);
                $tipoArchivo =  strtolower(pathinfo($archivo, PATHINFO_EXTENSION));

                // echo $tipoArchivo;

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
                    "nombre" => $_POST["nombre"],
                    "calle" => $_POST["calle"],
                    "colonia" => $_POST["colonia"],
                    "cp" => $_POST["cp"],
                    "ciudad" => $_POST["ciudad"],
                    "estado" => $_POST["estado"],
                    "telefono" => $_POST["telefono"],
                    "entreCalles" => $_POST["entreCalles"],
                    "referencias" => $_POST["referencias"],
                    "archivo" => $archivo
                );

                $respuesta = ModeloPedidosPaqueteria::mdlIngresarPedidoPaqueteria($tabla, $datos);

                if ($respuesta == "ok") {

                    echo '<script>

                    swal({

                        type: "success",
                        title: "¡Se han enviado correctamente tus datos!",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"

                    }).then(function(result){

                        if(result.value){
                        
                            window.location = "#";

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
                            
                                window.location = "#";

                            }

                        });
                    

                    </script>';
            }
        }
    }
}
