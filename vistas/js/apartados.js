// VER TABLA DE LOS PAGOS DE LOS APARTADOS

function verTabla(codigoVentaAp) {

    document.getElementById('mTableBody').innerHTML = '';

    var codigoVenta = codigoVentaAp;

    var datos = new FormData();
    datos.append("codigoVenta", codigoVenta);

    $("#folio").val(codigoVenta);

    $.ajax({

        url: "ajax/apartados.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {

            let prod = respuesta;

            let tbody = document.getElementById("mTableBody");

            var sumaAbono = 0;
            var total = 0;

            for (var i = 0; i < prod.length; i++) {

                sumaAbono += parseFloat(prod[i].abono);
                total = parseFloat(prod[i].total);
            }

            $("#totalVentaB").val(total);

            // Formatea el abono como pesos
            var abonoFormateado = sumaAbono.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN'
            });

            // Formatea el abono como pesos
            var totalFormateado = total.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN'
            });

            $("#totalAbonado").val(abonoFormateado);
            $("#totalVenta").val(totalFormateado);

            // FALTANTE       
            var faltante = total - sumaAbono;
            $("#faltanteB").val(faltante);

            // Formatea el faltante como pesos
            var faltante2 = faltante.toLocaleString('es-MX', {
                style: 'currency',
                currency: 'MXN'
            });

            $("#faltante").val(faltante2);

            var num = 1;

            prod.forEach((r) => {

                let filaNueva = '<tr>' +
                    '<td align="center">' + num + '</td>' +
                    '<td>' + r.fecha + '</td>' +
                    '<td>' + Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(r.abono) + '</td>' +
                    '<td><a class="btn btn-primary" onclick="verDocumento(' + codigoVenta + ', ' + r.id + ')"><i class="fa fa-print"></i></a><a class="btn btn-danger btnEliminarAbono" folio="' + codigoVenta + '" idAbono="' + r.id + '"><i class="fa fa-times"></i></a></td>' +
                    '</tr>';

                tbody.innerHTML += filaNueva;

                num++;
            })

        }
    })

}

function verDocumento(codigoVenta, idAbono) {

    window.open("extensiones/tcpdf/pdf/factura_abono.php?codigo=" + codigoVenta + "&idAbono=" + idAbono, "_blank");

}


/*=============================================
ELIMINAR CATEGORIA
=============================================*/
$(".tablas").on("click", ".btnEliminarAbono", function () {

    var idAbono = $(this).attr("idAbono");

    var folio = $(this).attr("folio");

    var datos = new FormData();
	datos.append("idAbono", idAbono);

    swal({
        title: '¿Está seguro de borrar el abono?',
        text: "¡Si no lo está puede cancelar la acción!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar el abono!'
    }).then(function (result) {

        if (result.value) {

            $.ajax({

                url: "ajax/apartados.ajax.php",
                method: "POST",
                data: datos,
                cache: false,
                contentType: false,
                processData: false,
                dataType: "json",
                success: function (respuesta) {
                    console.log(respuesta);
                    if (respuesta == "ok") {

                        $("#modalAgregarAbono").modal("show");

                        verTabla(folio);

                    } else {

                    }
                }
            })

        }

    })

})