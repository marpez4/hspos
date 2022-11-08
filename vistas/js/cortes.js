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

			$("#idCajaCierre").val(respuesta["idCaja"])

			$("#montoInicial").val(respuesta["montoInicial"]);

			$("#totalVentas").val(respuesta["totalVentas"]);
			$("#totalServicios").val(respuesta["totalServicios"]);

			var montoFinal = respuesta["totalPVentas"] + respuesta["totalPServicios"];
			$("#montoFinal").val(montoFinal);

			var montoGeneral = montoFinal + respuesta["montoInicial"];

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
	    url:"ajax/cortesVerVentas.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    success:function(respuesta){
	    	
	    	if(respuesta){

	    		// alert("Entro", respuesta);
				$("#modalDetalleCaja .modal-body .box-body .tableVentas").html(respuesta);

	    	}

	    }

	})

})