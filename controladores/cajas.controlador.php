<?php
class ControladorCajas
{

	static public function ctrMostrarCajas($item, $valor)
	{

		$tabla = "cajas";

		$respuesta = ModeloCajas::mdlMostrarCajas($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrCrearCajas()
	{
		if (isset($_POST["nuevoNombre"])) {

			if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombre"])) {

				$tabla = "cajas";

				$datos = $_POST["nuevoNombre"];

				$respuesta = ModeloCajas::mdlIngresarCaja($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

					swal({
						  type: "success",
						  title: "La caja ha sido abierta correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "cajas";

									}
								})

					</script>';
				}
			} else {

				echo '<script>

					swal({
						  type: "error",
						  title: "¡La caja no puede ir vacía o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "cajas";

							}
						})

			  	</script>';
			}
		}
	}

	static public function ctrEditarCaja()
	{

		if (isset($_POST["editarNombre"])) {

			if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"])) {

				$tabla = "cajas";

				$datos = array(
					"nombre" => $_POST["editarNombre"],
					"id" => $_POST["idCaja"]
				);

				$respuesta = ModeloCajas::mdlEditarCaja($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

					swal({
						  type: "success",
						  title: "La caja ha sido cambiada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "cajas";

									}
								})

					</script>';
				}
			} else {

				echo '<script>

					swal({
						  type: "error",
						  title: "¡La caja no puede ir vacía o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "cajas";

							}
						})

			  	</script>';
			}
		}
	}
}
