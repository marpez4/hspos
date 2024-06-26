<?php

class ControladorProductos
{

	/*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function ctrMostrarProductos($item, $valor, $orden)
	{

		$tabla = "productosfacturas";

		$respuesta = ModeloProductos::mdlMostrarProductos($tabla, $item, $valor, $orden);

		return $respuesta;
	}

	static public function ctrMostrarAltaProductos($item, $valor, $orden)
	{

		$tabla = "productosfacturas";

		$respuesta = ModeloProductos::mdlMostrarProductos($tabla, $item, $valor, $orden);

		return $respuesta;
	}



	/*=============================================
	CREAR PRODUCTO
	=============================================*/

	static public function ctrCrearProducto()
	{

		if (isset($_POST["nuevaNombre"])) {

			if (preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ#,-. ]+$/', $_POST["nuevaNombre"])) {

				/*=============================================
				VALIDAR IMAGEN
				=============================================*/

				$ruta = "vistas/img/productos/default/anonymous.png";

				if (isset($_FILES["nuevaImagen"]["tmp_name"])) {

					list($ancho, $alto) = getimagesize($_FILES["nuevaImagen"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;

					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

					$directorio = "vistas/img/productos/" . $_POST["nuevoCodigo"];

					mkdir($directorio, 0755);

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

					if ($_FILES["nuevaImagen"]["type"] == "image/jpeg") {

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100, 999);

						$ruta = "vistas/img/productos/" . $_POST["nuevoCodigo"] . "/" . $aleatorio . ".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaImagen"]["tmp_name"]);

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);
					}

					if ($_FILES["nuevaImagen"]["type"] == "image/png") {

						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

						$aleatorio = mt_rand(100, 999);

						$ruta = "vistas/img/productos/" . $_POST["nuevoCodigo"] . "/" . $aleatorio . ".png";

						$origen = imagecreatefrompng($_FILES["nuevaImagen"]["tmp_name"]);

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);
					}
				}

				$tabla = "productosfacturas";

				if ($_POST["nuevaMarca"] == "") {

					$datos = array(
						"nombre" => $_POST["nuevaNombre"],
						"codigo" => $_POST["nuevoCodigo"],
						"descripcion" => $_POST["nuevaDescripcion"],
						"stock" => $_POST["nuevoStock"],
						"id_categoria" => $_POST["nuevaCategoria"],
						"precio_compra" => $_POST["nuevoPrecioCompra"],
						"precio_venta" => $_POST["nuevoPrecioVenta"],
						"precio_ml" => $_POST["nuevoPrecioMl"],
						"precio_cliente" => $_POST["nuevoPrecioClienteF"],
						"iva" => $_POST["nuevaIva"],
						"clave" => $_POST["nuevaClave"],
						"unidad" => $_POST["nuevaUnidad"],
						"impuesto" => $_POST["nuevaImpuesto"],
						"imagen" => $ruta
					);
				} else {

					$datos = array(
						"nombre" => $_POST["nuevaNombre"],
						"codigo" => $_POST["nuevoCodigo"],
						"descripcion" => $_POST["nuevaDescripcion"],
						"stock" => $_POST["nuevoStock"],
						"id_categoria" => $_POST["nuevaCategoria"],
						"precio_compra" => $_POST["nuevoPrecioCompra"],
						"precio_venta" => $_POST["nuevoPrecioVenta"],
						"precio_ml" => $_POST["nuevoPrecioMl"],
						"precio_cliente" => $_POST["nuevoPrecioClienteF"],
						"marca" => $_POST["nuevaMarca"],
						"ram" => $_POST["nuevaRam"],
						"procesador" => $_POST["nuevaProcesedor"],
						"tam_pantalla" => $_POST["nuevaPantalla"],
						"graficos" => $_POST["nuevaGraficos"],
						"ssd" => $_POST["nuevaSsd"],
						"hhd" => $_POST["nuevaHhd"],
						"iva" => $_POST["nuevaIva"],
						"clave" => $_POST["nuevaClave"],
						"unidad" => $_POST["nuevaUnidad"],
						"impuesto" => $_POST["nuevaImpuesto"],
						"imagen" => $ruta
					);
				}


				// echo $datos;
				// return;

				$respuesta = ModeloProductos::mdlIngresarProducto($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

						swal({
							  type: "success",
							  title: "El producto ha sido guardado correctamente",
							  showConfirmButton: true,
							  confirmButtonText: "Cerrar"
							  }).then(function(result){
										if (result.value) {

										window.location = "altaProductos";

										}
									})

						</script>';
				}
			} else {

				echo '<script>

					swal({
						  type: "error",
						  title: "¡El producto no puede ir con los campos vacíos o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar"
						  }).then(function(result){
							if (result.value) {

							window.location = "altaProductos";

							}
						})

			  	</script>';
			}
		}
	}

	/*=============================================
	EDITAR PRODUCTO
	=============================================*/

	static public function ctrEditarProducto()
	{

		if (isset($_POST["editarNombre"])) {

			/*=============================================
				VALIDAR IMAGEN
				=============================================*/

			$ruta = $_POST["imagenActual"];

			if (isset($_FILES["editarImagen"]["tmp_name"]) && !empty($_FILES["editarImagen"]["tmp_name"])) {

				list($ancho, $alto) = getimagesize($_FILES["editarImagen"]["tmp_name"]);

				$nuevoAncho = 500;
				$nuevoAlto = 500;

				/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

				$directorio = "vistas/img/productos/" . $_POST["editarCodigo"];

				/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/

				if (!empty($_POST["imagenActual"]) && $_POST["imagenActual"] != "vistas/img/productos/default/anonymous.png") {

					unlink($_POST["imagenActual"]);
				} else {

					mkdir($directorio, 0755);
				}

				/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/

				if ($_FILES["editarImagen"]["type"] == "image/jpeg") {

					/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

					$aleatorio = mt_rand(100, 999);

					$ruta = "vistas/img/productos/" . $_POST["editarCodigo"] . "/" . $aleatorio . ".jpg";

					$origen = imagecreatefromjpeg($_FILES["editarImagen"]["tmp_name"]);

					$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

					imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

					imagejpeg($destino, $ruta);
				}

				if ($_FILES["editarImagen"]["type"] == "image/png") {

					/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/

					$aleatorio = mt_rand(100, 999);

					$ruta = "vistas/img/productos/" . $_POST["editarCodigo"] . "/" . $aleatorio . ".png";

					$origen = imagecreatefrompng($_FILES["editarImagen"]["tmp_name"]);

					$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

					imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

					imagepng($destino, $ruta);
				}
			}

			$tabla = "productosfacturas";

			if ($_POST["editarMarca"] == "") {

				$datos = array(
					"id" => $_POST["id_productoEd"],
					"nombre" => $_POST["editarNombre"],
					"codigo" => $_POST["editarCodigo"],
					"descripcion" => $_POST["editarDescripcion"],
					"id_categoria" => $_POST["editarCategoria"],
					"stock" => $_POST["editarStock"],
					"precio_compra" => $_POST["editarPrecioCompra"],
					"precio_venta" => $_POST["editarPrecioVenta"],
					"precio_cliente" => $_POST["editarPrecioClienteF"],
					"precio_ml" => $_POST["editarPrecioMl"],
					"iva" => $_POST["editarIva"],
					"clave" => $_POST["editarClave"],
					"unidad" => $_POST["editarUnidad"],
					"impuesto" => $_POST["editarObjetoImpuesto"],
					"imagen" => $ruta
				);
			} else {

				$datos = array(
					"id" => $_POST["id_productoEd"],
					"nombre" => $_POST["editarNombre"],
					"codigo" => $_POST["editarCodigo"],
					"descripcion" => $_POST["editarDescripcion"],
					"id_categoria" => $_POST["editarCategoria"],
					"stock" => $_POST["editarStock"],
					"precio_compra" => $_POST["editarPrecioCompra"],
					"precio_venta" => $_POST["editarPrecioVenta"],
					"precio_cliente" => $_POST["editarPrecioClienteF"],
					"precio_ml" => $_POST["editarPrecioMl"],
					"marca" => $_POST["editarMarca"],
					"ram" => $_POST["editarRam"],
					"procesador" => $_POST["editarProcesedor"],
					"tam_pantalla" => $_POST["editarPantalla"],
					"graficos" => $_POST["editarGraficos"],
					"ssd" => $_POST["editarSsd"],
					"hhd" => $_POST["editarHhd"],
					"iva" => $_POST["editarIva"],
					"clave" => $_POST["editarClave"],
					"unidad" => $_POST["editarUnidad"],
					"impuesto" => $_POST["editarObjetoImpuesto"],
					"imagen" => $ruta
				);
			}

			$respuesta = ModeloProductos::mdlEditarProducto($tabla, $datos);

			if ($respuesta == "ok") {

				echo '<script>

						swal({
							  type: "success",
							  title: "El producto ha sido editado correctamente",
							  showConfirmButton: true,
							  confirmButtonText: "Cerrar"
							  }).then(function(result){
										if (result.value) {

										window.location = "altaProductos";

										}
									})

						</script>';
			}
		}
	}

	/*=============================================
	BORRAR PRODUCTO
	=============================================*/
	static public function ctrEliminarProducto()
	{

		if (isset($_GET["idProducto"])) {

			$tabla = "productos";
			$datos = $_GET["idProducto"];

			if ($_GET["imagen"] != "" && $_GET["imagen"] != "vistas/img/productos/default/anonymous.png") {

				unlink($_GET["imagen"]);
				rmdir('vistas/img/productos/' . $_GET["codigo"]);
			}

			$respuesta = ModeloProductos::mdlEliminarProducto($tabla, $datos);

			if ($respuesta == "ok") {

				echo '<script>

				swal({
					  type: "success",
					  title: "El producto ha sido borrado correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "productos";

								}
							})

				</script>';
			}
		}
	}

	/*=============================================
	MOSTRAR SUMA VENTAS
	=============================================*/

	static public function ctrMostrarSumaVentas()
	{

		$tabla = "productos";

		$respuesta = ModeloProductos::mdlMostrarSumaVentas($tabla);

		return $respuesta;
	}

	/*=============================================
	MOVIMIENTO BODEGA
	=============================================*/

	static public function ctrMovBodega()
	{

		if (isset($_POST["tipoMov"])) {

			$tabla = "bodega";

			$datos = array(
				"idProducto" => $_POST["idProductoMov"],
				"tipoMov" => $_POST["tipoMov"],
				"cantidad" => $_POST["cantidadMov"],
				"cantidadLlegadas" => $_POST["cantidadLlegadas"],
				"descripcion" => $_POST["descripcionMov"],
				"idBodega" => $_POST["idBodegaMov"],
				"idUsuario" => $_POST["idUsuario"]
			);

			$respuesta = ModeloProductos::mdlMovBodega($tabla, $datos);

			if ($respuesta == "Ok") {

				echo '<script>

						swal({
							  type: "success",
							  title: "Se realizo correctamente el movimiento en la bodega",
							  showConfirmButton: true,
							  confirmButtonText: "Cerrar"
							  }).then(function(result){
										if (result.value) {

										window.location = "productos";

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

							window.location = "productos";

							}
						})

			  	</script>';
			}
		}
	}

	/*=============================================
	MOSTRAR BODEGA DEL PRODUCTO
	=============================================*/

	static public function ctrMostrarBodega($valor)
	{

		$tabla = "bodega";

		$respuesta = ModeloProductos::mdlMostrarBodega($tabla, $valor);

		return $respuesta;
	}

	/*=============================================
	MOSTRAR BODEGA DEL PRODUCTO
	=============================================*/

	static public function ctrVerHistorialBodega($valor)
	{

		$tabla = "historial_mov_bodega";

		$respuesta = ModeloProductos::mdlMostrarHistorialBodega($tabla, $valor);

		return $respuesta;
	}

	static public function ctrEliminarProductoReal($valor)
	{

		$respuesta = ModeloProductos::mdlEliminarProductoReal($valor);
		return $respuesta;
	}

	static public function ctrVerProductoEditar($valor)
	{
		$respuesta = ModeloProductos::mdlVerProductoEditar($valor);
		return $respuesta;
	}
}
