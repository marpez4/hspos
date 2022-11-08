<?php

class ControladorCierreCortes
{

	/*=============================================
	MOSTRAR CORTES
	=============================================*/

	static public function ctrMostrarCierreCortes($item, $valor)
	{

		$tabla = "corte_caja";

		$respuesta = ModeloCierreCortes::mdlMostrarCierreCortes($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrCrearCajaCorte()
	{

		if (isset($_POST["nuevoMonto"])) {

			if (preg_match('/^[0-9]+$/', $_POST["nuevoMonto"])) {

				$tabla = "corte_caja";

				$datos = array(
					"montoInicial" => $_POST["nuevoMonto"],
					"idCaja" => $_POST["idCaja"]
				);

				$respuesta = ModeloCierreCortes::mdlCrearCajaCorte($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

					swal({
						  type: "success",
						  title: "La caja ha sido guardada correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "cortes";

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

							window.location = "cortes";

							}
						})

			  	</script>';
			}
		}
	}

	static public function ctrMostrarInfoCorte($item, $valor)
	{

		$tabla = "cajas";

		$respuesta = ModeloCierreCortes::mdlMostrarInfoCorte($tabla, $item, $valor);

		return $respuesta;
	}

	static public function ctrCrearCierreCaja()
	{

		if (isset($_POST["montoFinal"])) {

			$tabla = "corte_caja";

			$datos = array(
				"idCajaCierre" => $_POST["idCajaCierre"],
				"totalVentas" => $_POST["totalVentas"],
				"totalServicios" => $_POST["totalServicios"],
				"montoFinal" => $_POST["montoFinal"],
				"montoGeneral" => $_POST["montoGeneral"]
			);

			$respuesta = ModeloCierreCortes::mdlCrearCierreCaja($tabla, $datos);

			if ($respuesta == "ok") {

				echo '<script>

				swal({
					  type: "success",
					  title: "La caja ha sido cerrada correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "cortes";

								}
							})

				</script>';
			} else {

				echo '<script>

				swal({
					  type: "error",
					  title: "¡Hubo un error!",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
						if (result.value) {

						window.location = "cortes";

						}
					})

			  </script>';
			}
		}
	}

	static public function ctrMostrarVentas($item, $valor){

		$tabla = "ventas";

		$respuesta = ModeloCierreCortes::mdlVerVentas($tabla, $item, $valor);

		return $respuesta;


	}
}
