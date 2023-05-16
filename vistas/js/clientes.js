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

      $("#checkDatosEditarFact").iCheck('uncheck');

      $("#idCliente").val(respuesta["id"]);
      $("#editarCliente").val(respuesta["nombre"]);
      $("#editarFrecuente").val(respuesta["frecuente"]);
      $("#editarEmail").val(respuesta["email"]);
      $("#editarTelefono").val(respuesta["telefono"]);

      if (respuesta["Rfc"] != null) {

        $("#checkDatosEditarFact").iCheck('check');
        $(".datosFactEditar").removeClass("hidden");

        // DATOS

        $("#editarRfc").val(respuesta["Rfc"]);
        $("#editarCfdi").val(respuesta["CfdiUse"]);
        $("#editarCfdi").html(respuesta["CfdiUse"]);
        $("#editarRegimen").val(respuesta["FiscalRegime"]);
        $("#editarRegimen").html(respuesta["FiscalRegime"]);
        $("#editarCp").val(respuesta["ZipCode"]);
        $("#editarCalle").val(respuesta["Street"]);
        $("#editarNoInt").val(respuesta["InteriorNumber"]);
        $("#editarNoExt").val(respuesta["ExteriorNumber"]);
        $("#editarColonia").val(respuesta["Neighborhood"]);
        // $("#editarLocalidad").val(respuesta["Locality"]);
        $("#editarMunicipio").val(respuesta["Municipality"]);
        $("#editarEstado").val(respuesta["StateF"]);
        $("#editarEstado").html(respuesta["StateF"]);
        $("#editarPais").val(respuesta["Country"]);

      } else {
        $(".datosFactEditar").addClass("hidden");
      }



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

// CREAR CLIENTE
$(".checkDatosFact").on("ifChecked", function () {

  $(".datosFact").removeClass("hidden");
  $(".datosFactEditar").removeClass("hidden");

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

// EDITAR CLIENTE 
$(".checkDatosEditarFact").on("ifChecked", function () {

  $(".datosFactEditar").removeClass("hidden");

  $("#editarRfc").val("required", true);
  $("#editarCfdi").attr("required", true);
  $("#editarRegimen").attr("required", true);
  $("#editarCp").attr("required", true);
  $("#editarCalle").attr("required", true);
  $("#editarNoExt").attr("required", true);
  $("#editarColonia").attr("required", true);
  $("#editarLocalidad").attr("required", true);
  $("#editarMunicipio").attr("required", true);
  $("#editarEstado").attr("required", true);
  $("#editarPais").attr("required", true);

  // VACIAMOS LOS INPUTS

  $("#editarRfc").val("");
  $("#editarCfdi").val("");
  $("#editarRegimen").val("");
  $("#editarCp").val("");
  $("#editarCalle").val("");
  $("#editarNoExt").val("");
  $("#editarColonia").val("");
  $("#editarLocalidad").val("");
  $("#editarMunicipio").val("");
  $("#editarEstado").val("");
  $("#editarPais").val("");
  $("#editarCfdi").html("");
  $("#editarRegimen").html("");
  $("#editarEstado").html("");


})

// CREAR CLIENTE
$(".checkDatosFact").on("ifUnchecked", function () {

  $(".datosFact").addClass("hidden");
  $(".datosFactEditar").addClass("hidden");

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

// EDITAR CLIENTE 

$(".checkDatosEditarFact").on("ifUnchecked", function () {

  $(".datosFactEditar").addClass("hidden");

  $("#editarRfc").removeAttr("required");
  $("#editarCfdi").removeAttr("required");
  $("#editarRegimen").removeAttr("required");
  $("#editarCp").removeAttr("required");
  $("#editarCalle").removeAttr("required");
  $("#editarNoExt").removeAttr("required");
  $("#editarColonia").removeAttr("required");
  $("#editarLocalidad").removeAttr("required");
  $("#editarMunicipio").removeAttr("required");
  $("#editarEstado").removeAttr("required");
  $("#editarPais").removeAttr("required");

})