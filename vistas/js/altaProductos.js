
var perfilOculto = $("#perfilOculto").val();

$('.tablaAltaProductos').DataTable({
	"ajax": "ajax/datatable-altaProductos.ajax.php?perfilOculto=" + perfilOculto,
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

$(".tablaAltaProductos tbody").on("click", "button.btnEliminarProducto", function () {

	var datos = new FormData();
	datos.append("idProductoDelete", $(this).attr("idProducto"));

	console.log("datos", $(this).attr("idProducto"));

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

			$.ajax({

				type: "POST",
				url: "ajax/productos.ajax.php",
				data: datos,
				cache: false,
				contentType: false,
				processData: false,
				dataType: "json",
				success: function (response) {

					if (response == "ok") {

						swal({

							type: 'success',
							title: '¡El producto ha sido borrado!',
							showConfirmButton: true,
							confirmButtonText: 'Cerrar'

						}).then(function (result) {

							if (result.value) {

								window.location = "altaProductos";

							}

						});

					}

				}

			})

		}

	})

})


$(".tablaAltaProductos tbody").on("click", "button.btnEditarProducto", function () {

	$(".chosen-select").select2({
		dropdownAutoWidth: true,
		width: '100%'
	});

	var idProducto = $(this).attr("idProducto");

	var datos = new FormData();
	datos.append("idProductoVerEditar", idProducto);

	$("#id_productoEd").val(idProducto);

	$.ajax({

		url: "ajax/productos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function (respuesta) {

			$("#editarNombre").val(respuesta["nombre"]);

			$("#editarCodigo").val(respuesta["codigo"]);

			$("#editarDescripcion").val(respuesta["descripcion"]);

			$("#editarCategoria").val(respuesta["id_categoria"]);

			$("#editarStock").val(respuesta["stock"]);

			$("#editarPrecioCompra").val(respuesta["precio_compra"]);

			$("#editarPrecioVenta").val(respuesta["precio_venta"]);

			$("#editarPrecioClienteF").val(respuesta["precio_cliente"]);

			$("#editarPrecioMl").val(respuesta["precio_ml"]);



			$("#editarClave").val(respuesta["UnitCode"]).trigger("change");

			$("#editarUnidad").val(respuesta["Unit"]).trigger("change");

			$("#editarIva").val(respuesta["Taxes"]).trigger("change");

			$("#editarObjetoImpuesto").val(respuesta["ObjetoImp"]).trigger("change");

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