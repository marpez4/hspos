/*=============================================
AGREGAR CAJA
=============================================*/
$(".btnAgregaIdCaja").on("click", function () {

	$.ajax({
		url: "ajax/cortesAbrirCaja.ajax.php",
		method: "POST",
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			$("#idCaja").val(respuesta["id"]);
			$("#nombreCaja").val(respuesta["nombre"]);
		}
	})
})

// CERRAR CAJA

$(".btnCerrarCaja").on("click", function () {

	$.ajax({

		url: "ajax/cortesCerrarCaja.ajax.php",
		method: "POST",
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			// const formato = new Intl.NumberFormat('es-MX', {
			// 	style: 'decimal',
			// 	minimumFractionDigits: 2,
			// 	maximumFractionDigits: 2
			// });

			$("#idCajaCierre").val(respuesta["idCaja"]);

			$("#montoInicial").val(respuesta["montoInicial"]);

			if (respuesta["totalVentas"] == 0) {

				$("#totalVentas").val(0);

				totalPVentas = 0;

			} else {

				$("#totalVentas").val(respuesta["totalVentas"]);

				totalPVentas = Number(respuesta["totalPVentas"]);

			}

			if(respuesta["totalServicios"] == 0){

				$("#totalServicios").val(0);

				totalPServicios = 0;

			}else{
				
				$("#totalServicios").val(respuesta["totalServicios"]);

				totalPServicios = Number(respuesta["totalPServicios"]);

			}
			
			var montoFinal = totalPVentas + totalPServicios;

			$("#montoFinal").val(montoFinal);

			var montoGeneral = montoFinal + Number(respuesta["montoInicial"]);

			$("#montoGeneral").val(montoGeneral);
		}
	})

})

/*=============================================
VER DETALLE CAJA
=============================================*/
$(".btnVerDetalleCierreCaja").on("click", function () {

	var caja = $(this).attr("idCaja");

	var datos = new FormData();
	datos.append("caja", caja);

	$.ajax({
		url: "ajax/cortesVerVentas.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		success: function (respuesta) {

			if (respuesta) {

				// alert("Entro", respuesta);
				$("#modalDetalleCaja .modal-body .box-body .tableVentas").html(respuesta);

			}

		}

	})

})

function currencyFormatter({ currency, value }) {
	const formatter = new Intl.NumberFormat('en-US', {
		style: 'currency',
		minimumFractionDigits: 2,
		currency
	})
	return formatter.format(value)
}