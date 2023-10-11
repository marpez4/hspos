<?php
class ControladorApartados
{

    static public function ctrCrearAbono()
    {

        if (isset($_POST["nuevoAbono"])) {

            if ($_POST["nuevoAbono"] == 0) {

                echo '<script>

					swal({
						  type: "error",
						  title: "¡El abono no puede ser 0!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "apartados";

							}
						})

			  	</script>';
            } else if ($_POST["nuevoAbono"] > $_POST["faltanteB"]) {

                echo '<script>

					swal({
						  type: "error",
						  title: "¡El abono no puede ser mayor a lo faltante!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "apartados";

							}
						})

			  	</script>';
            } else {

                $tabla = "pagos";

                $datos = array(
                    "abono" => $_POST["nuevoAbono"],
                    "folio" => $_POST["folio"],
                    "totalVenta" => $_POST["totalVentaB"]
                );

                $respuesta = ModeloApartados::mdlCrearAbono($tabla, $datos);

                if ($respuesta == "ok") {

                    echo '<script>

					swal({
						  type: "success",
						  title: "El abono ha sido guardado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {
                                        
                                        $("#modalAgregarAbono").modal("show");
                                        
                                        verTabla('.$_POST["folio"].'); 
									}
								})

					</script>';
                }
            }
        }
    }

    static public function ctrMostrarApartados($item, $valor)
    {

        $tabla = "pagos";

        $respuesta = ModeloApartados::mdlMostrarApartados($tabla, $item, $valor);

        return $respuesta;
    }

    static public function ctrSumarApartados($item, $valor)
    {

        $tabla = "pagos";

        $respuesta = ModeloApartados::mdlSumarApartados($tabla, $item, $valor);

        return $respuesta;
    }

    static public function ctrMostrarAbonos($item, $valor)
    {

        $tabla = "pagos";

        $respuesta = ModeloApartados::mdlMostrarAbonos($tabla, $item, $valor);

        return $respuesta;
    }
}
