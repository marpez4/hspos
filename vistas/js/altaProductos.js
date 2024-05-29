
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