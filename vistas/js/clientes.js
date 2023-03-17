/*=============================================
EDITAR CLIENTE
=============================================*/
$(".tablas").on("click", ".btnEditarCliente", function () {

  var idCliente = $(this).attr("idCliente");

  var datos = new FormData();
  datos.append("idCliente", idCliente);

  $.ajax({

    url: "ajax/clientes.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (respuesta) {

      $("#idCliente").val(respuesta["id"]);
      $("#editarCliente").val(respuesta["nombre"]);
      $("#editarFrecuente").val(respuesta["frecuente"]);
      $("#editarDocumentoId").val(respuesta["documento"]);
      $("#editarEmail").val(respuesta["email"]);
      $("#editarTelefono").val(respuesta["telefono"]);
      $("#editarEmpresa").val(respuesta["empresa"]);
    }

  })

})

/*=============================================
ELIMINAR CLIENTE
=============================================*/
$(".tablas").on("click", ".btnEliminarCliente", function () {

  var idCliente = $(this).attr("idCliente");

  swal({
    title: '¿Está seguro de borrar el cliente?',
    text: "¡Si no lo está puede cancelar la acción!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Si, borrar cliente!'
  }).then(function (result) {
    if (result.value) {

      window.location = "index.php?ruta=clientes&idCliente=" + idCliente;
    }

  })

})

$(".checkDatosFact").on("ifChecked", function () {

  $(".datosFact").removeClass("hidden");

  $("#nuevoRfc").attr("required", true);
  $("#nuevoCfdi").attr("required", true);
  $("#nuevoRegimen").attr("required", true);
  $("#nuevoCp").attr("required", true);
  $("#nuevoCalle").attr("required", true);
  $("#nuevoNoExt").attr("required", true);
  $("#nuevoColonia").attr("required", true);
  $("#nuevoLocalidad").attr("required", true);
  $("#nuevoMunicipio").attr("required", true);
  $("#nuevoEstado").attr("required", true);
  $("#nuevoPais").attr("required", true);

})

$(".checkDatosFact").on("ifUnchecked", function () {

  $(".datosFact").addClass("hidden");

  $("#nuevoRfc").removeAttr("required");
  $("#nuevoCfdi").removeAttr("required");
  $("#nuevoRegimen").removeAttr("required");
  $("#nuevoCp").removeAttr("required");
  $("#nuevoCalle").removeAttr("required");
  $("#nuevoNoExt").removeAttr("required");
  $("#nuevoColonia").removeAttr("required");
  $("#nuevoLocalidad").removeAttr("required");
  $("#nuevoMunicipio").removeAttr("required");
  $("#nuevoEstado").removeAttr("required");
  $("#nuevoPais").removeAttr("required");

})
