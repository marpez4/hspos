/*=============================================
CARGAR LA TABLA DINÁMICA DE VENTAS
=============================================*/

// $.ajax({

// 	url: "ajax/datatable-ventas.ajax.php",
// 	success:function(respuesta){

// 		console.log("respuesta", respuesta);

// 	}

// })// 

$('.tablaVentas').DataTable({
	"ajax": "ajax/datatable-ventas.ajax.php",
	"searchPanes": {
		"dtOpts": {
			"dom": "tp",
			"paging": "true",
			"pagingType": "numbers",
			"searching": true

		}
	},
	// "dom": 'Pfrtip',
	// "columnDefs": [{
	// 	"searchPanes": {
	// 		"show": false
	// 	},
	// 	"targets": [1, 5],
	// }],
	"deferRender": true,
	"retrieve": true,
	"processing": true,
	"language": {

		"sProcessing": "Procesando...",
		"sLengthMenu": "Mostrar _MENU_ registros",
		"sZeroRecords": "No se encontraron resultados",
		"sEmptyTable": "Ningún dato disponible en esta tabla",
		"sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
		"sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0",
		"sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
		"sInfoPostFix": "",
		"sSearch": "Buscar:",
		"sUrl": "",
		"sInfoThousands": ",",
		"sLoadingRecords": "Cargando...",
		"oPaginate": {
			"sFirst": "Primero",
			"sLast": "Último",
			"sNext": "Siguiente",
			"sPrevious": "Anterior"
		},
		"oAria": {
			"sSortAscending": ": Activar para ordenar la columna de manera ascendente",
			"sSortDescending": ": Activar para ordenar la columna de manera descendente"
		}

	},
});



// TIPO DE CLIENTE 

$("#seleccionarCliente").change(function () {

	var datosCF = new FormData();

	datosCF.append("idCliente", $("#seleccionarCliente").val());

	// alert("idcliente "+$("#seleccionarCliente").val());

	idCliente = $("#seleccionarCliente").val();

	$.ajax({

		url: "ajax/clientes.ajax.php",
		method: "POST",
		data: datosCF,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			var Clf = $("#esClienteF").val(respuesta["frecuente"]);
			// $("#esClienteF").html(respuesta["frecuente"]);
			// alert(Clf);

			if ($("#esClienteF").val() == 2) {

				// NO ES CLIENTE FRECUENTE

				$("#esClienteFS").html("<button type='button' class='btn btn-danger btn-xs'><i class='fa fa-user' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Este cliente no es frecuente'></i></button>");


			} else if ($("#esClienteF").val() == 1) {

				// ES CLIENTE FRECUENTE

				$("#esClienteFS").html("<button type='button' class='btn btn-success btn-xs'><i class='fa fa-user-plus' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Este cliente es frecuente'></i></button>");

			} else if ($("#esClienteF").val() == 3) {

				// ES CLIENTE MERCADO LIBRE

				$("#esClienteFS").html("<button type='button' class='btn btn-warning btn-xs'><i class='fa fa-user-plus' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Este cliente ML'></i></button>");

			}

		}

	})

});


/*=============================================
AGREGANDO PRODUCTOS A LA VENTA DESDE LA TABLA
=============================================*/

$(".tablaVentas tbody").on("click", "button.agregarProducto", function () {

	idCliente = $("#seleccionarCliente").val();

	if (idCliente == "") {

		swal({
			type: "error",
			title: "Seleccione un cliente antes de agregar un producto.",
			showConfirmButton: true,
			confirmButtonText: "Cerrar"
		})

	} else {

		var idProducto = $(this).attr("idProducto");

		$(this).removeClass("btn-primary agregarProducto");

		$(this).addClass("btn-default");

		var datos = new FormData();
		datos.append("idProducto", idProducto);

		$.ajax({

			url: "ajax/productos.ajax.php",
			method: "POST",
			data: datos,
			cache: false,
			contentType: false,
			processData: false,
			dataType: "json",
			success: function (respuesta) {


				if ($("#esClienteF").val() == 2) {
					// NO ES CLIENTE FRECUENTE

					precio = respuesta["precio_venta"];

				} else if ($("#esClienteF").val() == 1) {

					// ES CLIENTE FRECUENTE

					precio = respuesta["precio_cliente"];

				} else if ($("#esClienteF").val() == 3) {

					precio = respuesta["precio_ml"];

				}

				var descripcion = respuesta["descripcion"];
				var stock = respuesta["stock"];
				var impuesto = respuesta["Taxes"];
				var unitCode = respuesta["UnitCode"];
				var unit = respuesta["Unit"];
				var identificationNumber = respuesta["IdentificationNumber"];
				var TaxObject = respuesta["ObjetoImp"];
				// var precio = respuesta["precio_venta"];	

				// INICIANDO EL VALOR DE IMPUESTO 

				var impuestoPrecio = precio * impuesto;

				/*=============================================
				EVITAR AGREGAR PRODUTO CUANDO EL STOCK ESTÁ EN CERO
				=============================================*/

				if (stock == 0) {

					swal({
						title: "No hay stock disponible",
						type: "error",
						confirmButtonText: "¡Cerrar!"
					});

					$("button[idProducto='" + idProducto + "']").addClass("btn-primary agregarProducto");

					return;

				}

				// TODO 


				$(".nuevoProducto").append(

					'<div class="row" style="padding:5px 15px">' +

					'<!-- Impuesto del producto -->' +

					'<input type="text" class="form-control nuevoImpuestoProducto hidden" impuestoReal = "' + impuesto + '" name="nuevoImpuestoProducto" value="' + impuesto + '" readonly required></input>' +

					'<!-- Operación Impuesto x Precio producto -->' +

					'<input type="text" class="form-control nuevaOperacionImpuestoProducto hidden" name="nuevaOperacionImpuestoProducto" value="" readonly required></input>' +

					'<!-- Unit code del producto -->' +

					'<input type="text" class="form-control nuevoUnitCodeProducto hidden" name="nuevoUnitCodeProducto" value="' + unitCode + '" readonly required></input>' +

					'<!-- Unit del producto -->' +

					'<input type="text" class="form-control nuevoUnitProducto hidden" name="nuevoUnitProducto" value="' + unit + '" readonly required></input>' +

					'<!-- Identification number del producto -->' +

					'<input type="text" class="form-control nuevoObjImp hidden" name="nuevoObjImp" value="' + TaxObject + '" readonly required></input>' +

					'<!-- Identification number del producto -->' +

					'<input type="text" class="form-control nuevoIdentificationNumberProducto hidden" name="nuevoIdentificationNumberProducto" value="' + identificationNumber + '" readonly required></input>' +

					'<!-- Descripción del producto -->' +

					'<div class="col-xs-6" style="padding-right:0px">' +

					'<div class="input-group">' +

					'<span class="input-group-addon"><button type="button" class="btn btn-danger btn-xs quitarProducto" idProducto="' + idProducto + '"><i class="fa fa-times"></i></button></span>' +

					'<input type="text" class="form-control nuevaDescripcionProducto" idProducto="' + idProducto + '" name="agregarProducto" value="' + descripcion + '" readonly required>' +

					'</div>' +

					'</div>' +

					'<!-- Cantidad del producto -->' +

					'<div class="col-xs-3">' +

					'<input type="number" class="form-control nuevaCantidadProducto" name="nuevaCantidadProducto" min="1" value="1" stock="' + stock + '" nuevoStock="' + Number(stock - 1) + '" required>' +

					'</div>' +

					'<!-- Precio del producto -->' +

					'<div class="col-xs-3 ingresoPrecio" style="padding-left:0px">' +

					'<div class="input-group">' +

					'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>' +

					'<input type="text" class="form-control nuevoPrecioProducto" precioReal="' + precio + '" name="nuevoPrecioProducto" value="' + precio + '" readonly required>' +

					'</div>' +

					'</div>' +

					'<! -- OPERACION IMPUESTO -->' +

					'<div class="col-xs-6 ingresoImpuesto"></div>' +
					'<div class="col-xs-3 ingresoImpuesto"></div>' +

					'<div class="col-xs-3 ingresoImpuesto" style="padding-left:2px">' +

					'<div class="input-group">' +

					'<span class="input-group-addon">IVA</span>' +

					'<input type="text" class="form-control nuevoPrecioProductoImpuesto" precioRealImpuesto="' + impuesto + '" name="nuevoPrecioProductoImpuesto" value="' + impuestoPrecio.toFixed(2) + '" readonly required>' +

					'</div>' +

					'</div>' +

					'</div>')

				// AGREGANDO DESCUENTO

				agregarDescuento()

				// SUMAR TOTAL DE PRECIOS

				sumarTotalPrecios()

				// OPERACION IMPUESTO 

				operacionImpuesto()

				// AGREGAR IMPUESTO

				agregarImpuesto()

				// AGRUPAR PRODUCTOS EN FORMATO JSON

				listarProductos()

				// PONER FORMATO AL PRECIO DE LOS PRODUCTOS

				$(".nuevoPrecioProducto").number(true, 2);


				localStorage.removeItem("quitarProducto");

			}

		})
	}
});

/*=============================================
CUANDO CARGUE LA TABLA CADA VEZ QUE NAVEGUE EN ELLA
=============================================*/

$(".tablaVentas").on("draw.dt", function () {

	if (localStorage.getItem("quitarProducto") != null) {

		var listaIdProductos = JSON.parse(localStorage.getItem("quitarProducto"));

		for (var i = 0; i < listaIdProductos.length; i++) {

			$("button.recuperarBoton[idProducto='" + listaIdProductos[i]["idProducto"] + "']").removeClass('btn-default');
			$("button.recuperarBoton[idProducto='" + listaIdProductos[i]["idProducto"] + "']").addClass('btn-primary agregarProducto');

		}


	}


})


/*=============================================
QUITAR PRODUCTOS DE LA VENTA Y RECUPERAR BOTÓN
=============================================*/

var idQuitarProducto = [];

localStorage.removeItem("quitarProducto");

$(".formularioVenta").on("click", "button.quitarProducto", function () {

	$(this).parent().parent().parent().parent().remove();

	var idProducto = $(this).attr("idProducto");

	/*=============================================
	ALMACENAR EN EL LOCALSTORAGE EL ID DEL PRODUCTO A QUITAR
	=============================================*/

	if (localStorage.getItem("quitarProducto") == null) {

		idQuitarProducto = [];

	} else {

		idQuitarProducto.concat(localStorage.getItem("quitarProducto"))

	}

	idQuitarProducto.push({ "idProducto": idProducto });

	localStorage.setItem("quitarProducto", JSON.stringify(idQuitarProducto));

	$("button.recuperarBoton[idProducto='" + idProducto + "']").removeClass('btn-default');

	$("button.recuperarBoton[idProducto='" + idProducto + "']").addClass('btn-primary agregarProducto');

	if ($(".nuevoProducto").children().length == 0) {

		$("#nuevoImpuestoVenta").val(0);
		$("#nuevoTotalVenta").val(0);
		$("#totalVenta").val(0);
		$("#nuevoTotalVenta").attr("total", 0);

	} else {

		// DESCUENTO

		agregarDescuento()

		// SUMAR TOTAL DE PRECIOS

		sumarTotalPrecios()

		// AGREGAR IMPUESTO

		agregarImpuesto()

		// AGRUPAR PRODUCTOS EN FORMATO JSON

		listarProductos()

	}

})

/*=============================================
AGREGANDO PRODUCTOS DESDE EL BOTÓN PARA DISPOSITIVOS
=============================================*/

var numProducto = 0;

$(".btnAgregarProducto").click(function () {

	numProducto++;

	var datos = new FormData();
	datos.append("traerProductos", "ok");

	$.ajax({

		url: "ajax/productos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			$(".nuevoProducto").append(

				'<div class="row" style="padding:5px 15px">' +

				'<!-- Descripción del producto -->' +

				'<div class="col-xs-6" style="padding-right:0px">' +

				'<div class="input-group">' +

				'<span class="input-group-addon"><button type="button" class="btn btn-danger btn-xs quitarProducto" idProducto><i class="fa fa-times"></i></button></span>' +

				'<select class="form-control nuevaDescripcionProducto" id="producto' + numProducto + '" idProducto name="nuevaDescripcionProducto" required>' +

				'<option>Seleccione el producto</option>' +

				'</select>' +

				'</div>' +

				'</div>' +

				'<!-- Cantidad del producto -->' +

				'<div class="col-xs-3 ingresoCantidad">' +

				'<input type="number" class="form-control nuevaCantidadProducto" name="nuevaCantidadProducto" min="1" value="0" stock nuevoStock required>' +

				'</div>' +

				'<!-- Precio del producto -->' +

				'<div class="col-xs-3 ingresoPrecio" style="padding-left:0px">' +

				'<div class="input-group">' +

				'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>' +

				'<input type="text" class="form-control nuevoPrecioProducto" precioReal="" name="nuevoPrecioProducto" readonly required>' +

				'</div>' +

				'</div>' +

				'</div>');


			// AGREGAR LOS PRODUCTOS AL SELECT 

			respuesta.forEach(funcionForEach);

			function funcionForEach(item, index) {

				if (item.stock != 0) {

					$("#producto" + numProducto).append(

						'<option idProducto="' + item.id + '" value="' + item.descripcion + '">' + item.descripcion + '</option>'
					)


				}

			}

			// SUMAR TOTAL DE PRECIOS

			sumarTotalPrecios()

			// AGREGAR IMPUESTO

			agregarImpuesto()

			// PONER FORMATO AL PRECIO DE LOS PRODUCTOS

			$(".nuevoPrecioProducto").number(true, 2);


		}

	})

})

/*=============================================
SELECCIONAR PRODUCTO EN DISPOSITIVO
=============================================*/

$(".formularioVenta").on("change", "select.nuevaDescripcionProducto", function () {

	var nombreProducto = $(this).val();

	var nuevaDescripcionProducto = $(this).parent().parent().parent().children().children().children(".nuevaDescripcionProducto");

	var nuevoPrecioProducto = $(this).parent().parent().parent().children(".ingresoPrecio").children().children(".nuevoPrecioProducto");

	var nuevaCantidadProducto = $(this).parent().parent().parent().children(".ingresoCantidad").children(".nuevaCantidadProducto");

	var datos = new FormData();
	datos.append("nombreProducto", nombreProducto);


	$.ajax({

		url: "ajax/productos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			$(nuevaDescripcionProducto).attr("idProducto", respuesta["id"]);
			$(nuevaCantidadProducto).attr("stock", respuesta["stock"]);
			$(nuevaCantidadProducto).attr("nuevoStock", Number(respuesta["stock"]) - 1);


			if ($("#esClienteF").val() == 2) {
				// NO ES CLIENTE FRECUENTE

				$(nuevoPrecioProducto).val(respuesta["precio_venta"]);
				$(nuevoPrecioProducto).attr("precioReal", respuesta["precio_venta"]);

			} else if ($("#esClienteF").val() == 1) {

				// ES CLIENTE FRECUENTE
				$(nuevoPrecioProducto).val(respuesta["precio_cliente"]);
				$(nuevoPrecioProducto).attr("precioReal", respuesta["precio_cliente"]);


			}
			else if ($("#esClienteF").val() == 3) {

				// ES CLIENTE FRECUENTE
				$(nuevoPrecioProducto).val(respuesta["precio_ml"]);
				$(nuevoPrecioProducto).attr("precioReal", respuesta["precio_ml"]);


			}
			// $(nuevoPrecioProducto).val(respuesta["precio_venta"]);
			// $(nuevoPrecioProducto).attr("precioReal", respuesta["precio_venta"]);

			// AGRUPAR PRODUCTOS EN FORMATO JSON

			listarProductos()

		}

	})
})

// TODO 

/*=============================================
MODIFICAR LA CANTIDAD
=============================================*/

$(".formularioVenta").on("change", "input.nuevaCantidadProducto", function () {

	// SUMANDO CANTIDAD DE PRODUCTO 

	var precio = $(this).parent().parent().children(".ingresoPrecio").children().children(".nuevoPrecioProducto");

	var precioFinal = $(this).val() * precio.attr("precioReal");

	precio.val(precioFinal);

	// SUMANDO CANTIDAD + IMPUESTO

	var impuesto = $(this).parent().parent().children(".ingresoImpuesto").children().children(".nuevoPrecioProductoImpuesto");

	var impuestoProducto = $(this).val() * impuesto.attr("precioRealImpuesto")

	var impuestoFinal = impuestoProducto * precio.attr("precioReal");

	impuesto.val(impuestoFinal.toFixed(2));

	//

	var nuevoStock = Number($(this).attr("stock")) - $(this).val();

	$(this).attr("nuevoStock", nuevoStock);

	if (Number($(this).val()) > Number($(this).attr("stock"))) {

		/*=============================================
		SI LA CANTIDAD ES SUPERIOR AL STOCK REGRESAR VALORES INICIALES
		=============================================*/

		$(this).val(0);

		$(this).attr("nuevoStock", $(this).attr("stock"));

		var precioFinal = $(this).val() * precio.attr("precioReal");

		precio.val(precioFinal);

		sumarTotalPrecios();

		swal({
			title: "La cantidad supera el Stock",
			text: "¡Sólo hay " + $(this).attr("stock") + " unidades!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		});

		return;

	}

	// DESCUENTO

	agregarDescuento()

	// SUMAR TOTAL DE PRECIOS

	sumarTotalPrecios()

	// OPERACION IMPUESTO 

	operacionImpuesto()

	// AGREGAR IMPUESTO

	agregarImpuesto()

	// AGRUPAR PRODUCTOS EN FORMATO JSON

	listarProductos()

})

/*=============================================
SUMAR TODOS LOS PRECIOS
=============================================*/

function sumarTotalPrecios() {

	var precioItem = $(".nuevoPrecioProducto");

	var arraySumaPrecio = [];

	for (var i = 0; i < precioItem.length; i++) {

		arraySumaPrecio.push(Number($(precioItem[i]).val()));
	}

	function sumaArrayPrecios(total, numero) {

		return total + numero;

	}

	var sumaTotalPrecio = arraySumaPrecio.reduce(sumaArrayPrecios);

	console.log(sumaTotalPrecio);

	$("#nuevoTotalVenta").val(sumaTotalPrecio);
	$("#totalVenta").val(sumaTotalPrecio);
	$("#nuevoTotalVenta").attr("total", sumaTotalPrecio);


}

/*=============================================
FUNCIÓN AGREGAR IMPUESTO
=============================================*/

function operacionImpuesto() {

	var impuestoItem = $(".nuevoPrecioProductoImpuesto");

	var arraySumaImpuesto = [];

	for (var i = 0; i < impuestoItem.length; i++) {

		arraySumaImpuesto.push(Number($(impuestoItem[i]).val()));

	}

	function sumaArrayImpuestos(total, numero) {

		return total + numero;
	}

	var sumaTotalImpuesto = arraySumaImpuesto.reduce(sumaArrayImpuestos);

	$("#nuevoImpuestoVenta").val(sumaTotalImpuesto.toFixed(2));

}

/*=============================================
FUNCIÓN AGREGAR IMPUESTO
=============================================*/

function agregarImpuesto() {

	var impuesto = $("#nuevoImpuestoVenta").val();
	var precioTotal = $("#nuevoTotalVenta").attr("total");

	// var precioImpuesto = Number(precioTotal * impuesto / 100);

	// var totalConImpuesto = Number(precioImpuesto) + Number(precioTotal);

	var totalConImpuesto = Number(impuesto) + Number(precioTotal);

	$("#nuevoTotalVenta").val(totalConImpuesto);

	$("#totalVenta").val(precioTotal);

	// $("#nuevoPrecioImpuesto").val(precioImpuesto);

	$("#nuevoPrecioNeto").val(totalConImpuesto);

}

/*=============================================
CUANDO CAMBIA EL IMPUESTO
=============================================*/

$("#nuevoImpuestoVenta").change(function () {

	agregarImpuesto();

});

/*=============================================
FORMATO AL PRECIO FINAL
=============================================*/

$("#nuevoTotalVenta").number(true, 2);

/*=============================================
SELECCIONAR MÉTODO DE PAGO
=============================================*/

$("#nuevoMetodoPago").change(function () {

	var metodo = $(this).val();

	if (metodo == "Efectivo") {

		$(this).parent().parent().removeClass("col-xs-6");

		$(this).parent().parent().addClass("col-xs-4");

		$(this).parent().parent().parent().children(".cajasMetodoPago").html(

			'<div class="col-xs-4">' +

			'<div class="input-group">' +

			'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>' +

			'<input type="text" class="form-control" id="nuevoValorEfectivo" placeholder="000000" required>' +

			'</div>' +

			'</div>' +

			'<div class="col-xs-4" id="capturarCambioEfectivo" style="padding-left:0px">' +

			'<div class="input-group">' +

			'<span class="input-group-addon"><i class="ion ion-social-usd"></i></span>' +

			'<input type="text" class="form-control" id="nuevoCambioEfectivo" placeholder="000000" readonly required>' +

			'</div>' +

			'</div>'

		)

		// Agregar formato al precio

		$('#nuevoValorEfectivo').number(true, 2);
		$('#nuevoCambioEfectivo').number(true, 2);


		// Listar método en la entrada
		listarMetodos()

	} else {

		$(this).parent().parent().removeClass('col-xs-4');

		$(this).parent().parent().addClass('col-xs-6');

		$(this).parent().parent().parent().children('.cajasMetodoPago').html(

			'<div class="col-xs-6" style="padding-left:0px">' +

			'<div class="input-group">' +

			'<input type="number" min="0" class="form-control" id="nuevoCodigoTransaccion" placeholder="Código transacción"  required>' +

			'<span class="input-group-addon"><i class="fa fa-lock"></i></span>' +

			'</div>' +

			'</div>')

	}



})

/*=============================================
CAMBIO EN EFECTIVO
=============================================*/
$(".formularioVenta").on("change", "input#nuevoValorEfectivo", function () {

	var efectivo = $(this).val();

	var cambio = Number(efectivo) - Number($('#nuevoTotalVenta').val());

	var nuevoCambioEfectivo = $(this).parent().parent().parent().children('#capturarCambioEfectivo').children().children('#nuevoCambioEfectivo');

	nuevoCambioEfectivo.val(cambio);

})

/*=============================================
CAMBIO TRANSACCIÓN
=============================================*/
$(".formularioVenta").on("change", "input#nuevoCodigoTransaccion", function () {

	// Listar método en la entrada
	listarMetodos()


})


/*=============================================
LISTAR TODOS LOS PRODUCTOS
=============================================*/

function listarProductos() {

	var listaProductos = [];

	var descripcion = $(".nuevaDescripcionProducto");

	var cantidad = $(".nuevaCantidadProducto");

	var precio = $(".nuevoPrecioProducto");

	var impuesto = $(".nuevoImpuestoProducto");

	var unitCode = $(".nuevoUnitCodeProducto");

	var unit = $(".nuevoUnitProducto");

	var identificationNumber = $(".nuevoIdentificationNumberProducto");

	var impuestoFinal = $(".nuevoPrecioProductoImpuesto");

	var taxObj = $(".nuevoObjImp");

	for (var i = 0; i < descripcion.length; i++) {

		listaProductos.push({
			"id": $(descripcion[i]).attr("idProducto"),
			"descripcion": $(descripcion[i]).val(),
			"cantidad": $(cantidad[i]).val(),
			"stock": $(cantidad[i]).attr("nuevoStock"),
			"precio": $(precio[i]).attr("precioReal"),
			"subTotal": $(precio[i]).val(),
			"impuestoFinal": $(impuestoFinal[i]).val(),
			"totalNeto": parseFloat($(impuestoFinal[i]).val()) + parseFloat($(precio[i]).val()),
			"impuesto": $(impuesto[i]).val(),
			"taxObj": $(taxObj[i]).val(),
			"unitCode": $(unitCode[i]).val(),
			"unit": $(unit[i]).val(),
			"identificationNumber": $(identificationNumber[i]).val()
		})
	}

	console.log(listaProductos);

	$("#listaProductos").val(JSON.stringify(listaProductos));


}

/*=============================================
LISTAR MÉTODO DE PAGO
=============================================*/

function listarMetodos() {

	var listaMetodos = "";

	if ($("#nuevoMetodoPago").val() == "Efectivo") {

		$("#listaMetodoPago").val("Efectivo");

	} else {

		$("#listaMetodoPago").val($("#nuevoMetodoPago").val() + "-" + $("#nuevoCodigoTransaccion").val());

	}

}

/*=============================================
BOTON EDITAR VENTA
=============================================*/
$(".tablas").on("click", ".btnEditarVenta", function () {

	var idVenta = $(this).attr("idVenta");

	window.location = "index.php?ruta=editar-venta&idVenta=" + idVenta;


})

/*=============================================
FUNCIÓN PARA DESACTIVAR LOS BOTONES AGREGAR CUANDO EL PRODUCTO YA HABÍA SIDO SELECCIONADO EN LA CARPETA
=============================================*/

function quitarAgregarProducto() {

	//Capturamos todos los id de productos que fueron elegidos en la venta
	var idProductos = $(".quitarProducto");

	//Capturamos todos los botones de agregar que aparecen en la tabla
	var botonesTabla = $(".tablaVentas tbody button.agregarProducto");

	//Recorremos en un ciclo para obtener los diferentes idProductos que fueron agregados a la venta
	for (var i = 0; i < idProductos.length; i++) {

		//Capturamos los Id de los productos agregados a la venta
		var boton = $(idProductos[i]).attr("idProducto");

		//Hacemos un recorrido por la tabla que aparece para desactivar los botones de agregar
		for (var j = 0; j < botonesTabla.length; j++) {

			if ($(botonesTabla[j]).attr("idProducto") == boton) {

				$(botonesTabla[j]).removeClass("btn-primary agregarProducto");
				$(botonesTabla[j]).addClass("btn-default");

			}
		}

	}

}

/*=============================================
CADA VEZ QUE CARGUE LA TABLA CUANDO NAVEGAMOS EN ELLA EJECUTAR LA FUNCIÓN:
=============================================*/

$('.tablaVentas').on('draw.dt', function () {

	quitarAgregarProducto();

})


/*=============================================
BORRAR VENTA
=============================================*/
$(".tablas").on("click", ".btnEliminarVenta", function () {

	var idVenta = $(this).attr("idVenta");

	swal({
		title: '¿Está seguro de borrar la venta?',
		text: "¡Si no lo está puede cancelar la accíón!",
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText: 'Cancelar',
		confirmButtonText: 'Si, borrar venta!'
	}).then(function (result) {
		if (result.value) {

			window.location = "index.php?ruta=ventas&idVenta=" + idVenta;
		}

	})

})

/*=============================================
IMPRIMIR FACTURA
=============================================*/

$(".tablas").on("click", ".btnImprimirFactura", function () {

	var codigoVenta = $(this).attr("codigoVenta");

	window.open("extensiones/tcpdf/pdf/factura-carta.php?codigo=" + codigoVenta, "_blank");

})

/*=============================================
RANGO DE FECHAS
=============================================*/

$('#daterange-btn').daterangepicker(
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
		$('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

		var fechaInicial = start.format('YYYY-MM-DD');

		var fechaFinal = end.format('YYYY-MM-DD');

		var capturarRango = $("#daterange-btn span").html();

		localStorage.setItem("capturarRango", capturarRango);

		window.location = "index.php?ruta=ventas&fechaInicial=" + fechaInicial + "&fechaFinal=" + fechaFinal;

	}

)

/*=============================================
CANCELAR RANGO DE FECHAS
=============================================*/

$(".daterangepicker.opensleft .range_inputs .cancelBtn").on("click", function () {

	localStorage.removeItem("capturarRango");
	localStorage.clear();
	window.location = "ventas";
})

/*=============================================
CAPTURAR HOY
=============================================*/

$(".daterangepicker.opensleft .ranges li").on("click", function () {

	var textoHoy = $(this).attr("data-range-key");

	if (textoHoy == "Hoy") {

		var d = new Date();

		var dia = d.getDate();
		var mes = d.getMonth() + 1;
		var año = d.getFullYear();

		// if(mes < 10){

		// 	var fechaInicial = año+"-0"+mes+"-"+dia;
		// 	var fechaFinal = año+"-0"+mes+"-"+dia;

		// }else if(dia < 10){

		// 	var fechaInicial = año+"-"+mes+"-0"+dia;
		// 	var fechaFinal = año+"-"+mes+"-0"+dia;

		// }else if(mes < 10 && dia < 10){

		// 	var fechaInicial = año+"-0"+mes+"-0"+dia;
		// 	var fechaFinal = año+"-0"+mes+"-0"+dia;

		// }else{

		// 	var fechaInicial = año+"-"+mes+"-"+dia;
		//    	var fechaFinal = año+"-"+mes+"-"+dia;

		// }

		dia = ("0" + dia).slice(-2);
		mes = ("0" + mes).slice(-2);

		var fechaInicial = año + "-" + mes + "-" + dia;
		var fechaFinal = año + "-" + mes + "-" + dia;

		localStorage.setItem("capturarRango", "Hoy");

		window.location = "index.php?ruta=ventas&fechaInicial=" + fechaInicial + "&fechaFinal=" + fechaFinal;

	}

})

/*=============================================
ABRIR ARCHIVO XML EN NUEVA PESTAÑA
=============================================*/

$(".abrirXML").click(function () {

	var archivo = $(this).attr("archivo");
	window.open(archivo, "_blank");


})

// SELECT CON BUSCADOR

$(document).ready(function () {
	$('.chosen-select').select2();
});

// BOTON PARA HACER EL PREVIO A LA FACTURA

$(".tablas").on("click", "button.btnAgregarFactura", function () {

	document.getElementById('mTableBody').innerHTML = '';

	var codigoVenta = $(this).attr("codigoVentaFactura");

	var datos = new FormData();
	datos.append("codigoVenta", codigoVenta);

	$("#folio").val(codigoVenta);

	$.ajax({

		url: "ajax/facturasInicio.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			$("#nombreCliente").val(respuesta["nombreCliente"]);
			$("#nombreEmisor").val(respuesta["nombreFiscal"]);
			$("#cpEmisor").val(respuesta["codigoPostal"]);
			$("#expeditionPlace").val(respuesta["codigoPostal"]);
			$("#cfdiRecep").val(respuesta["cfdiCliente"]);
			$("#rfcRecep").val(respuesta["rfcCliente"]);
			$("#fiscalRegRecep").val(respuesta["regimenCliente"]);
			$("#cpRecep").val(respuesta["cpCliente"]);

			let prod = JSON.parse(respuesta["productos"]);

			console.log(prod);

			let tbody = document.getElementById("mTableBody");

			var sumaSubtotal = Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(respuesta["subTotal"]);
			var sumaTotal = Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(respuesta["neto"]);
			var sumaImpuestos = Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(respuesta["impuesto"]);

			prod.forEach((r) => {

				let filaNueva = '<tr>' +
					'<td align="center">' + r.cantidad + '</td>' +
					'<td> <small>' + r.unitCode + '</small><br><small>' + r.unit + '<small></td>' +
					'<td>' + r.descripcion + '</td>' +
					'<td>' + Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(r.precio) + '</td>' +
					'<td>' + Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(r.subTotal) + '</td>' +
					'<td> <small>' + r.impuesto + '</small><br>' + Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(r.impuestoFinal) + '</td>' +
					'<td>' + Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(r.totalNeto) + '</td>' +
					'</tr>';

				tbody.innerHTML += filaNueva;
			})


			// for (let i in prod) {

			// 	sumaSubtotal += Number(prod[i].subTotal);
			// 	sumaTotal += Number(prod[i].totalNeto);
			// 	sumaImpuestos += Number(prod[i].impuestoFinal);

			// }
			
			$("#subtotalNeto").val(sumaSubtotal);
			$("#totalNeto").val(sumaTotal);
			$("#impuestosNeto").val(sumaImpuestos);
		}
	})

})

function agregarDescuento(){

	var descuento = $("#nuevoDescuento").val();
	var precioTotal = $("#nuevoPrecioNeto").val();

	var totalConDescuento = Number(precioTotal) - Number(descuento);

	$("#nuevoTotalVenta").val(totalConDescuento);

	$("#totalVenta").val(totalConDescuento);

}

/*=============================================
CUANDO CAMBIA EL DESCUENTO
=============================================*/

$("#nuevoDescuento").change(function(){

	agregarDescuento();

});

// $(".btnAgregarFactura").on("click", function () {

// 	var codigoVenta = $(this).attr("codigoVentaFactura");

// 	var datos = new FormData();
// 	datos.append("codigoVenta", codigoVenta);

// 	$.ajax({

// 		url: "ajax/facturasInicio.ajax.php",
// 		method: "POST",
// 		data: datos,
// 		cache: false,
// 		contentType: false,
// 		processData: false,
// 		dataType: "json",
// 		success: function (respuesta) {

// 			if (respuesta) {

// 				alert("hola")

// 				console.log("hola "+respuesta);

// 			}

// 		}

// 	});
// })