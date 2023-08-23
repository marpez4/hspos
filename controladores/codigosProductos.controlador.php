<?php
class ControladorCodigosProductos{

    static public function ctrCrearCodigoProducto(){

        if(isset($_POST["nuevoCodigo"])){

				$tabla = "codigos_productos";

				$datos = array(
                        
                    "codigoPr" => $_POST["nuevoCodigo"],
                    "cantidad" => $_POST["nuevaCantidad"],
                    "descripcion" => $_POST["nuevaDescripcion"]
                );

				$respuesta = ModeloCodigosProductos::mdlCrearCodigoProducto($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El código ha sido guardada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "codigosProductos";

									}
								})

					</script>';

				}

		}


    }

    static public function ctrMostrarCodigoProducto(){

        $tabla = "codigos_productos";

        $respuesta = ModeloCodigosProductos::mdlMostrarCodigosProductos($tabla);

        return $respuesta;

    }

	static public function ctrMostrarCodigoProductoPDF($id){

        $tabla = "codigos_productos";

        $respuesta = ModeloCodigosProductos::mdlMostrarCodigosProductosPDF($tabla, $id);

        return $respuesta;

    }

	static public function ctrEliminarCodigo(){

		if(isset($_GET["idCodigoB"])){

			$tabla ="codigos_productos";
			$datos = $_GET["idCodigoB"];

			$respuesta = ModeloCodigosProductos::mdlEliminarCodigoB($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

					swal({
						  type: "success",
						  title: "El código ha sido borrado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "codigosProductos";

									}
								})

					</script>';
			}
		}

	}
}