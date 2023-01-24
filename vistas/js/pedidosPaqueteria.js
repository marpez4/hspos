// EDITAR PEDIDO

$(".tablas").on("click", ".btnEditarPedidoPaqueteria", function () {

	var idPedidoPaqueteria = $(this).attr("idPedidoPaqueteria");

	var datos = new FormData();
	datos.append("idPedidoPaqueteria", idPedidoPaqueteria);

	$.ajax({
		url: "ajax/pedidoPaqueteria.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			// alert($("#idPedidoPaqueteria").val(respuesta["id"]));

			$("#idPedidoPaqueteria").val(respuesta["id"]);
			$("#editarNombre").val(respuesta["nombreCompleto"]);
			$("#editarCalle").val(respuesta["calle"]);
			$("#editarColonia").val(respuesta["colonia"]);
			$("#editarCp").val(respuesta["cp"]);
			$("#editarCiudad").val(respuesta["idCiudad"]);
			$("#editarEstado").val(respuesta["idEstado"]);
			$("#editarTelefono").val(respuesta["telefono"]);
			$("#editarCalles").val(respuesta["entreCalles"]);
			$("#editarReferencia").val(respuesta["referencias"]);


		}
	})
})
/*=============================================
ELIMINAR Pedido
=============================================*/
$(".tablas").on("click", ".btnEliminaPedidoPaqueteria", function () {

	var idPedidoPaqueteria = $(this).attr("idPedidoPaqueteria");

	swal({
		title: '¿Está seguro de borrar el registro?',
		text: "¡Si no lo está puede cancelar la acción!",
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText: 'Cancelar',
		confirmButtonText: 'Si, borrar el registro!'
	}).then(function (result) {

		if (result.value) {

			window.location = "index.php?ruta=pedidosPaqueteria&idPedidoPaqueteria=" + idPedidoPaqueteria;

		}

	})

})

/*=============================================
IMPRIMIR SERVICIO
=============================================*/

$(".tablas").on("click", ".btnImprimirPaqueteria", function () {


	var codigoPaqueteria = $(this).attr("codigoPaqueteria");

	window.open("extensiones/tcpdf/pdf/envio-paqueteria.php?codigo=" + codigoPaqueteria, "_blank");

})

// CAMBIAR ESTATUS

$(".tablas").on("click", ".actionEstatus", function () {

	var estatuRe = $(this).attr("estatus");
	var idPedidoPaqueteria = $(this).attr("idPedidoPaqueteria");
	var cambioEstatus = "cambioEstatus";
	var usuario = $(this).attr("usuario");

	var datos = new FormData();
	datos.append("idPedidoPaqueteriaE", idPedidoPaqueteria);
	datos.append("estatus", estatuRe);
	datos.append("cambioEstatus", cambioEstatus);
	datos.append("usuario", usuario);

	if (estatuRe == 1) {

		estatusNew = "Recibido";
	} else if (estatuRe == 2) {

		estatusNew = "Empaquetado";
	} else if (estatuRe == 3) {

		estatusNew = "Enviado";
	} else if (estatuRe == 4) {

		estatusNew = "Entregado";
	} else if (estatuRe == 5) {

		estatusNew = "Terminado";

	}

	swal({
		title: 'Cambiar a ' + estatusNew + '¿Estas seguro de cambiarlo?',
		showCancelButton: true,
		confirmButtonText: 'Sí, guardar',
	}).then((result) => {
		if (result.value) {

			$.ajax({
				url: "ajax/pedidoPaqueteria.ajax.php",
				method: "POST",
				data: datos,
				cache: false,
				contentType: false,
				processData: false,
				dataType: "json",
				success: function (respuesta) {

					if (respuesta == "ok") {

						swal({

							type: "success",
							title: "¡Se han editado correctamente tus datos!",
							showConfirmButton: true,
							confirmButtonText: "Cerrar"

						}).then(function (result) {

							if (result.value) {

								window.location = "pedidosPaqueteria";

							}

						});
					}
				}
			})

		} else {
			console.log("No");
		}
	})
})

$(".tablas").on("click", ".verHistorial", function () {

	var idPedidoPaqueteria = $(this).attr("idPedidoPaqueteria");

	var verHistorial = "verHistorial";

	var datos = new FormData();

	datos.append("idPaqueteriaH", idPedidoPaqueteria);
	datos.append("verHistorial", verHistorial);

	$.ajax({
		url: "ajax/pedidoPaqueteria.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		success: function (respuesta) {

			if (respuesta) {
				
				$("#modalVerHistorialPaq .modal-body .box-body .tableHistorial").html(respuesta);

			}

		}

	})


})