// VER TABLA DE LOS PAGOS DE LOS APARTADOS

$(".tablas").on("click", "button.btnVerPagos", function () {

    document.getElementById('mTableBody').innerHTML = '';

    var codigoVenta = $(this).attr("codigoVentaAp");

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

            var num = 1;

            prod.forEach((r) => {

                let filaNueva = '<tr>' +
                    '<td align="center">' + num + '</td>' +
                    '<td>' + r.fecha + '</td>' +
                    '<td>' + Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(r.abono) + '</td>' +
                    '<td><button class="btn btn-primary btnEditarVenta1""><i class="fa fa-print"></i></button><button class="btn btn-danger btnEditarVenta1""><i class="fa fa-times"></i></button></td>' +
                    '</tr>';

                tbody.innerHTML += filaNueva;

                num++;
            })

        }
    })

})