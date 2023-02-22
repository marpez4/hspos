/*=============================================
IMPRIMIR SERVICIO
=============================================*/

$(".tablas").on("click", ".btnImprimirServcio", function () {

	
	var codigoServicio = $(this).attr("codigoServicio");

	window.open("extensiones/tcpdf/pdf/servicio-carta.php?codigo=" + codigoServicio, "_blank");

})

/*=============================================
EDITAR SERVICIO
=============================================*/
$(".tablas").on("click", ".btnEditarServicio", function () {

	var idServicio = $(this).attr("idServicio");

	var datos = new FormData();
	datos.append("idServicio", idServicio);

	$.ajax({
		url: "ajax/servicios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {


			$("#idServicio").val(respuesta["id"]);
			// var fecha2 = moment(respuesta["fecha_entrega"], 'YYYY-MM-DD').format('DD-MM-YYYY');

			$("#editarFolio").val(respuesta["folio"]);
			$("#editarFechaLl").val(respuesta["fecha_llegada"]);
			$("#editarCliente").val(respuesta["cliente"]);
			$("#editarTel").val(respuesta["telefono"]);
			$("#editarEmpleado").val(respuesta["id_empleado"]);
			$("#editarEquipo").val(respuesta["equipo"]);
			$("#editarMarca").val(respuesta["marca"]);
			$("#editarProcesador").val(respuesta["procesador"]);
			$("#editarRam").val(respuesta["ram"]);
			$("#editarDd").val(respuesta["dd"]);
			$("#editarSsd").val(respuesta["ssd"]);
			$("#editarSo").val(respuesta["so"]);
			$("#editarCargador").val(respuesta["cargador"]);
			$("#editarPass").val(respuesta["contrasena"]);
			$("#editarFalla").val(respuesta["falla"]);
			$("#editarSolucion").val(respuesta["solucion"]);
			$("#editarObs").val(respuesta["obs"]);
			$("#editarFechaEn").val(respuesta["fecha_entrega"]);
			$("#editarServicio").val(respuesta["total"]);
			$("#editarEstatus").val(respuesta["estatus"]);


		}

	})

})

/*=============================================
ELIMINAR CATEGORIA
=============================================*/
$(".tablas").on("click", ".btnEliminarServicio", function () {

	var idServicio = $(this).attr("idServicio");

	swal({
		title: '¿Está seguro de borrar el servicio?',
		text: "¡Si no lo está puede cancelar la acción!",
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText: 'Cancelar',
		confirmButtonText: 'Si, borrar servicio!'
	}).then(function (result) {

		if (result.value) {

			window.location = "index.php?ruta=servicios&idServicio=" + idServicio;

		}

	})

})
/*=============================================
RANGO DE FECHAS
=============================================*/

$('#daterangeServicio-btn').daterangepicker(
	{
		ranges: {
			'Hoy': [moment(), moment()],
			'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
			'Últimos 7 días': [moment().subtract(6, 'days'), moment()],
			'Últimos 30 días': [moment().subtract(29, 'days'), moment()],
			'Este mes': [moment().startOf('month'), moment().endOf('month')],
			'Último mes': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		},
		startDate: moment(),
		endDate: moment()
	},
	function (start, end) {
		$('#daterangeServicio-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

		var fechaInicial = start.format('YYYY-MM-DD');

		var fechaFinal = end.format('YYYY-MM-DD');

		var capturarRango = $("#daterangeServicio-btn span").html();

		localStorage.setItem("capturarRango", capturarRango);

		window.location = "index.php?ruta=servicios&fechaInicial=" + fechaInicial + "&fechaFinal=" + fechaFinal;

	}

)

$('#daterangeReporteServicio-btn').daterangepicker(
	
	{
		ranges: {
			'Hoy': [moment(), moment()],
			'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
			'Últimos 7 días': [moment().subtract(6, 'days'), moment()],
			'Últimos 30 días': [moment().subtract(29, 'days'), moment()],
			'Este mes': [moment().startOf('month'), moment().endOf('month')],
			'Último mes': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		},
		startDate: moment(),
		endDate: moment()
	},
	function (start, end) {
		$('#daterangeReporteServicio-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

		var fechaInicial = start.format('YYYY-MM-DD');

		var fechaFinal = end.format('YYYY-MM-DD');

		var capturarRango = $("#daterangeReporteServicio-btn span").html();

		localStorage.setItem("capturarRango", capturarRango);

		window.location = "index.php?ruta=reporteServicios&fechaInicial=" + fechaInicial + "&fechaFinal=" + fechaFinal;

	}

)