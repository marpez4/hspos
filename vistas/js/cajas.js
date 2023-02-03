/*=============================================
EDITAR CAJA
=============================================*/
$(".tablas").on("click", ".btnEditarCaja", function(){

	var idCaja = $(this).attr("idCaja");

	var datos = new FormData();
	datos.append("idCaja", idCaja);

	$.ajax({
		url: "ajax/cajas.ajax.php",
		method: "POST",
      	data: datos,
      	cache: false,
     	contentType: false,
     	processData: false,
     	dataType:"json",
     	success: function(respuesta){

     		$("#editarNombre").val(respuesta["nombre"]);
     		$("#idCaja").val(respuesta["id"]);

     	}

	})


})