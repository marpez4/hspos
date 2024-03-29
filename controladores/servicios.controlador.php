<?php

class ControladorServicios
{

	/*=============================================
	CREAR Servicios
	=============================================*/

	static public function ctrCrearServicio()
	{

		if (isset($_POST["nuevaEquipo"])) {

			if (
				preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ,-_. ]+$/', $_POST["nuevaEquipo"])
			) {

				$tabla = "servicios";

				$datos = array(
					"fecha_llegada" => $_POST["nuevaFechaLl"],
					"folio" => $_POST["nuevoFolio"],
					"id_cliente" => $_POST["nuevoCliente"],
					"telefono" => $_POST["nuevoTel"],
					"id_empleado" => $_POST["nuevoEmpleado"],
					"equipo" => $_POST["nuevaEquipo"],
					"marca" => $_POST["nuevaMarca"],
					"procesador" => $_POST["nuevoProcesador"],
					"ram" => $_POST["nuevaRam"],
					"dd" => $_POST["nuevaDd"],
					"ssd" => $_POST["nuevoSsd"],
					"so" => $_POST["nuevoSo"],
					"cargador" => $_POST["nuevoCargador"],
					"contrasena" => $_POST["nuevoPass"],
					"falla" => $_POST["nuevaFalla"],
					"solucion" => $_POST["nuevaSolución"],
					"obs" => $_POST["nuevaObs"],
					"fecha_entrega" => $_POST["nuevaFechaEn"],
					"tipo_servicio" => $_POST["nuevoServicio"],
					"estatus" => $_POST["nuevoEstatus"]
				);

				$respuesta = ModeloServicios::mdlIngresarServicios($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

					swal({
						  type: "success",
						  title: "El servicio ha sido guardado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "servicios";

									}
								})

					</script>';
				}
			} else {

				echo '<script>

					swal({
						  type: "error",
						  title: "¡El servicio no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							}
						})

			  	</script>';
			}
		}
	}

	/*=============================================
	MOSTRAR CATEGORIAS
	=============================================*/

	static public function ctrMostrarServicios($item, $valor)
	{

		$tabla = "servicios";

		$respuesta = ModeloServicios::mdlMostrarServicios($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR FOLIO
	=============================================*/

	static public function ctrMostrarFolio($item, $valor)
	{

		$tabla = "servicios";

		$respuesta = ModeloServicios::mdlMostrarFolio($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	EDITAR CATEGORIA
	=============================================*/

	static public function ctrEditarServicio()
	{

		if (isset($_POST["editarEquipo"])) {

			if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ,-_. ]+$/', $_POST["editarEquipo"])) {

				$tabla = "servicios";

				$datos = array(
					"fecha_llegada" => $_POST["editarFechaLl"],
					"id_cliente" => $_POST["editarCliente"],
					"telefono" => $_POST["editarTel"],
					"equipo" => $_POST["editarEquipo"],
					"marca" => $_POST["editarMarca"],
					"procesador" => $_POST["editarProcesador"],
					"ram" => $_POST["editarRam"],
					"dd" => $_POST["editarDd"],
					"ssd" => $_POST["editarSsd"],
					"so" => $_POST["editarSo"],
					"cargador" => $_POST["editarCargador"],
					"contrasena" => $_POST["editarPass"],
					"falla" => $_POST["editarFalla"],
					"solucion" => $_POST["editarSolucion"],
					"obs" => $_POST["editarObs"],
					"fecha_entrega" => $_POST["editarFechaEn"],
					"tipo_servicio" => $_POST["editarServicio"],
					"estatus" => $_POST["editarEstatus"],
					"id" => $_POST["idServicio"]
				);

				$respuesta = ModeloServicios::mdlEditarServicio($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

					swal({
						  type: "success",
						  title: "El servicio ha sido cambiado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "servicios";

									}
								})

					</script>';
				}
			} else {

				echo '<script>

					swal({
						  type: "error",
						  title: "¡La servicio no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							

							}
						})

			  	</script>';
			}
		}
	}

	/*=============================================
	BORRAR CATEGORIA
	=============================================*/

	static public function ctrBorrarServicio()
	{

		if (isset($_GET["idServicio"])) {

			$tabla = "servicios";
			$datos = $_GET["idServicio"];

			$respuesta = ModeloServicios::mdlBorrarServicio($tabla, $datos);

			if ($respuesta == "ok") {

				echo '<script>

					swal({
						  type: "success",
						  title: "El servicio ha sido borrado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
									if (result.value) {

									window.location = "servicios";

									}
								})

					</script>';
			}
		}
	}

	// RANGO DE FECHAS

	static public function ctrRangoFechasServicios($fechaInicial, $fechaFinal)
	{

		$tabla = "servicios";

		$respuesta = ModeloServicios::mdlRangoFechasServicios($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;

	}

	// REPORTE DE SERVICIOS

	static public function ctrRangoFechasReporteServicios($fechaInicial, $fechaFinal)
	{

		$tabla = "servicios";

		$respuesta = ModeloServicios::mdlRangoFechasReporteServicios($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;

	}

	static public function ctrRangoFechasReporteServiciosGral($fechaInicial, $fechaFinal)
	{

		$tabla = "servicios";

		$respuesta = ModeloServicios::mdlRangoFechasReporteServiciosGral($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;

	}

	static public function ctrRangoFechasServiciosGrafica($fechaInicial, $fechaFinal)
	{

		$tabla = "servicios";

		$respuesta = ModeloServicios::mdlRangoFechasServiciosGrafica($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;

	}
}
