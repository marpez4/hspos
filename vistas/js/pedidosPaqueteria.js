// EDITAR PEDIDO

$(".tablas").on("click", ".btnEditarPedidoPaqueteria", function(){

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
$(".tablas").on("click", ".btnEliminaPedidoPaqueteria", function(){

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
    }).then(function(result){

        if(result.value){

            window.location = "index.php?ruta=pedidosPaqueteria&idPedidoPaqueteria="+idPedidoPaqueteria;

        }

    })

})