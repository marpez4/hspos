/*=============================================
CARGAR LA TABLA DINÁMICA DE PRODUCTOS
=============================================*/

// $.ajax({

// 	url: "ajax/datatable-productos.ajax.php",
// 	success: function (respuesta) {

// 		console.log("respuesta", respuesta);

// 	}

// })

var perfilOculto = $("#perfilOculto").val();

$('.tablaProductos').DataTable({
	"ajax": "ajax/datatable-productos.ajax.php?perfilOculto=" + perfilOculto,
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

	}

});

// TABLA MOVIMIENTOS DE LA BODEGA


/*=============================================
CAPTURANDO LA CATEGORIA PARA ASIGNAR CÓDIGO
=============================================*/
// $("#nuevaCategoria").change(function(){

// 	var idCategoria = $(this).val();

// 	var datos = new FormData();
//   	datos.append("idCategoria", idCategoria);

//   	$.ajax({

//       url:"ajax/productos.ajax.php",
//       method: "POST",
//       data: datos,
//       cache: false,
//       contentType: false,
//       processData: false,
//       dataType:"json",
//       success:function(respuesta){

//       	if(!respuesta){

//       		var nuevoCodigo = idCategoria+"01";
//       		$("#nuevoCodigo").val(nuevoCodigo);

//       	}else{

//       		var nuevoCodigo = Number(respuesta["codigo"]) + 1;
//           	$("#nuevoCodigo").val(nuevoCodigo);

//       	}

//       }

//   	})

// })

/*=============================================
AGREGANDO PRECIO DE VENTA
=============================================*/
$("#nuevoPrecioCompra, #editarPrecioCompra").change(function () {

	if ($(".porcentaje").prop("checked")) {

		var valorPorcentaje = $(".nuevoPorcentaje").val();

		var porcentaje = Number(($("#nuevoPrecioCompra").val() * valorPorcentaje / 100)) + Number($("#nuevoPrecioCompra").val());

		var editarPorcentaje = Number(($("#editarPrecioCompra").val() * valorPorcentaje / 100)) + Number($("#editarPrecioCompra").val());

		$("#nuevoPrecioVenta").val(porcentaje);
		$("#nuevoPrecioVenta").prop("readonly", true);

		$("#editarPrecioVenta").val(editarPorcentaje);
		$("#editarPrecioVenta").prop("readonly", true);

	}

})

/*=============================================
CAMBIO DE PORCENTAJE
=============================================*/
$(".nuevoPorcentaje").change(function () {

	if ($(".porcentaje").prop("checked")) {

		var valorPorcentaje = $(this).val();

		var porcentaje = Number(($("#nuevoPrecioCompra").val() * valorPorcentaje / 100)) + Number($("#nuevoPrecioCompra").val());

		var editarPorcentaje = Number(($("#editarPrecioCompra").val() * valorPorcentaje / 100)) + Number($("#editarPrecioCompra").val());

		$("#nuevoPrecioVenta").val(porcentaje);
		$("#nuevoPrecioVenta").prop("readonly", true);

		$("#editarPrecioVenta").val(editarPorcentaje);
		$("#editarPrecioVenta").prop("readonly", true);

	}

})

$(".porcentaje").on("ifUnchecked", function () {

	$("#nuevoPrecioVenta").prop("readonly", false);
	$("#editarPrecioVenta").prop("readonly", false);

})

$(".porcentaje").on("ifChecked", function () {

	$("#nuevoPrecioVenta").prop("readonly", true);
	$("#editarPrecioVenta").prop("readonly", true);

})

/*=============================================
SUBIENDO LA FOTO DEL PRODUCTO
=============================================*/

$(".nuevaImagen").change(function () {

	var imagen = this.files[0];

	/*=============================================
		VALIDAMOS EL FORMATO DE LA IMAGEN SEA JPG O PNG
		=============================================*/

	if (imagen["type"] != "image/jpeg" && imagen["type"] != "image/png") {

		$(".nuevaImagen").val("");

		swal({
			title: "Error al subir la imagen",
			text: "¡La imagen debe estar en formato JPG o PNG!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		});

	} else if (imagen["size"] > 2000000) {

		$(".nuevaImagen").val("");

		swal({
			title: "Error al subir la imagen",
			text: "¡La imagen no debe pesar más de 2MB!",
			type: "error",
			confirmButtonText: "¡Cerrar!"
		});

	} else {

		var datosImagen = new FileReader;
		datosImagen.readAsDataURL(imagen);

		$(datosImagen).on("load", function (event) {

			var rutaImagen = event.target.result;

			$(".previsualizar").attr("src", rutaImagen);

		})

	}
})

/*=============================================
EDITAR PRODUCTO
=============================================*/

$(".tablaProductos tbody").on("click", "button.btnEditarProducto", function () {

	var idProducto = $(this).attr("idProducto");

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

			var datosCategoria = new FormData();
			datosCategoria.append("idCategoria", respuesta["id_categoria"]);

			$.ajax({

				url: "ajax/categorias.ajax.php",
				method: "POST",
				data: datosCategoria,
				cache: false,
				contentType: false,
				processData: false,
				dataType: "json",
				success: function (respuesta) {

					$("#editarCategoria").val(respuesta["id"]);
					$("#editarCategoria").html(respuesta["categoria"]);

				}

			})

			$("#editarCodigo").val(respuesta["codigo"]);

			$("#editarDescripcion").val(respuesta["descripcion"]);

			$("#editarStock").val(respuesta["stock"]);

			$("#editarPrecioCompra").val(respuesta["precio_compra"]);

			$("#editarPrecioVenta").val(respuesta["precio_venta"]);

			$("#editarPrecioClienteF").val(respuesta["precio_cliente"]);

			$("#editarPrecioMl").val(respuesta["precio_ml"]);

			//    alert(respuesta["marca"]);

			if (respuesta["marca"] != null) {

				$("#computadorasEditar").removeClass("hidden");

				$("#editarMarca").val(respuesta["marca"]);

				$("#editarRam").val(respuesta["ram"]);

				$("#editarProcesedor").val(respuesta["procesador"]);

				$("#editarPantalla").val(respuesta["tam_pantalla"]);

				$("#editarGraficos").val(respuesta["graficos"]);

				$("#editarSsd").val(respuesta["ssd"]);

				$("#editarHhd").val(respuesta["hhd"]);

				// AGREGAMOS EL ATRIBUTO REQUIRED EN LOS CAMPOS 

				$("#editarMarca").attr("required", true);

				$("#editarRam").attr("required", true);

				$("#editarProcesedor").attr("required", true);

				$("#editarPantalla").attr("required", true);

				$("#editarGraficos").attr("required", true);

				$("#editarSsd").attr("required", true);

				$("#editarHhd").attr("required", true);

			} else if (respuesta["marca"] == null) {

				$("#computadorasEditar").addClass("hidden");

				// QUITAMOS EL ATRIBUTO REQUIRED EN LOS CAMPOS 

				$("#editarMarca").attr("required", false);

				$("#editarRam").attr("required", false);

				$("#editarProcesedor").attr("required", false);

				$("#editarPantalla").attr("required", false);

				$("#editarGraficos").attr("required", false);

				$("#editarSsd").attr("required", false);

				$("#editarHhd").attr("required", false);

			}

			if (respuesta["imagen"] != "") {

				$("#imagenActual").val(respuesta["imagen"]);

				$(".previsualizar").attr("src", respuesta["imagen"]);

			}

		}

	})

})

/*=============================================
ELIMINAR PRODUCTO
=============================================*/

$(".tablaProductos tbody").on("click", "button.btnEliminarProducto", function () {

	var idProducto = $(this).attr("idProducto");
	var codigo = $(this).attr("codigo");
	var imagen = $(this).attr("imagen");

	swal({

		title: '¿Está seguro de borrar el producto?',
		text: "¡Si no lo está puede cancelar la accíón!",
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText: 'Cancelar',
		confirmButtonText: 'Si, borrar producto!'
	}).then(function (result) {
		if (result.value) {

			window.location = "index.php?ruta=productos&idProducto=" + idProducto + "&imagen=" + imagen + "&codigo=" + codigo;

		}

	})

})

// HABILITAR DIV PARA VER COMPUTADORAS

$("#nuevaCategoria").change(function () {

	if ($("#nuevaCategoria").val() == 7 || $("#nuevaCategoria").val() == 8 || $("#nuevaCategoria").val() == 9) {

		$("#computadoras").removeClass("hidden");

		$("#nuevaMarca").attr("required", true);
		$("#nuevaRam").attr("required", true);
		$("#nuevaProcesedor").attr("required", true);
		$("#nuevaPantalla").attr("required", true);
		$("#nuevaGraficos").attr("required", true);
		$("#nuevaSsd").attr("required", true);
		$("#nuevaHhd").attr("required", true);

	} else {

		$("#computadoras").addClass("hidden");

		$("#nuevaMarca").attr("required", false);
		$("#nuevaRam").attr("required", false);
		$("#nuevaProcesedor").attr("required", false);
		$("#nuevaPantalla").attr("required", false);
		$("#nuevaGraficos").attr("required", false);
		$("#nuevaSsd").attr("required", false);
		$("#nuevaHhd").attr("required", false);

		$("#nuevaMarca").val("");
		$("#nuevaRam").val("");
		$("#nuevaProcesedor").val("");
		$("#nuevaPantalla").val("");
		$("#nuevaGraficos").val("");
		$("#nuevaSsd").val("");
		$("#nuevaHhd").val("");

	}

});

// OBTENIENDO ID DEL PRODUCTO PARA EL MOVIMIENTO DE LA BODEGA

$(".tablaProductos tbody").on('click', 'button.btnMovBodega', function () {

	
	var idProducto = $(this).attr("idProducto");

	$("#idProductoMov").val(idProducto);

	var idBodega = $(this).attr("idBodega");

	if (idBodega != "") {

		$("#idBodegaMov").val(idBodega);

	} else {

		$("#idBodegaMov").val(0);
	}


})

// VER EL HISTORIAL DE LOS MOVIMIENTOS llegados, bodega, stock de tienda

$(".tablaProductos tbody").on("click", 'button.btnHistorial', function () {

	var idBodega = $(this).attr("idBodega");

	window.location = "index.php?ruta=bodega_mv_detalle&idBodega="+idBodega;


})

function mostrarInLlegadas(){

	const getValue = document.getElementById("tipoMov").value;

	if(getValue == 1){

		$("#divCantidadLlegadas").removeClass("hidden");
		$("#cantidadLlegadas").addClass("required");

	}else{

		$("#divCantidadLlegadas").addClass("hidden");
		$("#cantidadLlegadas").removeClass("required");
	}

}


