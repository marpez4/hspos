// AGREGAR UN CLIENTE AL API

function agregarCliente(datos) {

    var newClient = {
        "Email": datos.email,
        "Address": {
            "Street": datos.calle,
            "ExteriorNumber": datos.ext,
            "InteriorNumber": datos.int,
            "Neighborhood": datos.colonia,
            "ZipCode": datos.cp,
            "Locality": "",
            "Municipality": datos.municipio,
            "State": datos.estado,
            "Country": "Mex"
        },
        "Rfc": datos.rfc,
        "Name": datos.nombre,
        "CfdiUse": datos.cfdi,
        "TaxZipCode": "",
        "FiscalRegime": datos.regimen
    };

    Facturama.Clients.Create(newClient, function (result) {
        client = result;
    });

}

// AGREGAR UN PRODUCTO AL API 

function agregarProducto(datos) {

    var newProduct = {
        "Unit": datos.unidad,
        "UnitCode": datos.clave,
        "IdentificationNumber": datos.codigo,
        "Name": datos.nombre,
        "Description": datos.descripcion,
        "ObjetoImp": datos.impuesto,
        "Taxes": [{
            "Name": "IVA",
            "Rate": datos.iva,
            "IsRetention": false,
            "IsFederalTax": true
        }]
    };

    Facturama.Products.Create(newProduct, function (result) {
        product = result;
    });

}

// EMISION PARA FACTURA 

function emisionFactura(datos, Items) {


    var factura = {

        "Receiver": {
            "Name": datos.Name,
            "CfdiUse": datos.CfdiUse,
            "Rfc": datos.Rfc,
            "FiscalRegime": datos.FiscalRegime,
            "TaxZipCode": datos.TaxZipCode
        },
        "CfdiType": datos.CfdiType,
        "NameId": datos.NameId,
        "ExpeditionPlace": datos.ExpeditionPlace,
        "Serie": datos.Serie,
        "Currency": "MXN",
        "Folio": datos.Folio,
        "PaymentForm": datos.PaymentForm,
        "PaymentMethod": datos.PaymentMethod,
        "Exportation": datos.Exportation,
        "Items": Items
    }

    // console.log(factura);

    Facturama.Cfdi.Create3(factura, function (result) {

        var cfdi = result;
        var Cfdi_Id = cfdi.Id;
        var folio = cfdi.Folio;

        // //descargar el PDF del cfdi
        // Facturama.Cfdi.Download("pdf", "issued", Cfdi_Id, function (result) {

        //     // console.log("Descarga",result);

        //     blob = converBase64toBlob(result.Content, 'application/pdf');

        //     var blobURL = URL.createObjectURL(blob);
        //     window.open(blobURL);
        // });

        // //descargar el XML del cfdi
        // Facturama.Cfdi.Download("xml", "issued", Cfdi_Id, function (result) {

        //     // console.log("Descarga",result);

        //     blob = converBase64toBlob(result.Content, 'application/xml');

        //     var blobURL = URL.createObjectURL(blob);
        //     window.open(blobURL);

        // });

        // ENVIO DE DATOS A BD

        var datos = new FormData();

        datos.append("Cfdi_Id", Cfdi_Id);
        datos.append("folio", folio);

        $.ajax({
            url: "ajax/facturasInicio.ajax.php",
            method: "POST",
            data: datos,
            cache: false,
            contentType: false,
            processData: false,
            success: function (respuesta) {

                if (respuesta == "ok") {

                    swal({
                        type: "success",
                        title: "La factura fue emitida correctamente",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"
                    }).then(function (result) {
                        if (result.value) {

                            window.location = "ventas";

                        }
                    })

                } else {

                    swal({
                        type: "error",
                        title: "Hubo un error en la BD",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"
                    }).then(function (result) {
                        if (result.value) {

                            window.location = "ventas";

                        }
                    })
                }

            }

        })

    }, function (error) {
        if (error && error.responseJSON) {
            console.log("Errores", error.responseJSON);
            swal({
                type: "error",
                title: "Hubo un error: " + JSON.stringify(error.responseJSON),
                showConfirmButton: true,
                confirmButtonText: "Cerrar"
            }).then(function (result) {
                if (result.value) {

                    window.location = "ventas";

                }
            })
        }
    }
    );
}

// CANCELAR CFDI

function cancelarCfdi(id, motivo, uuidReplacement) {

    if (uuidReplacement == "") {
        idR = "null";
    } else {
        idR = uuidReplacement;
    }

    //eliminar el cfdi creado
    var Cfdi_Id = id;
    var _type = "issued";			//Valores posibles (issued | payroll)
    var _motive = motivo; 			//Valores Posibles (01|02|03|04)
    var _uuidReplacement = idR;	    //(uuid | null)
    Facturama.Cfdi.Cancel(Cfdi_Id + "?type=" + _type + "&motive=" + _motive + "&uuidReplacement=" + _uuidReplacement, function (result) {
        console.log("Eliminado", result);
    });
}

// ENVIAR POR CORREO ELECTRONICO EL FORMATO

$(".tablas tbody").on("click", "button.btnEmailFactura", function () {

    var attrEmail = $(this).attr("email");
    var Cfdi_Id = $(this).attr("idFacturaEmail");
    //enviar el cfdi al cliente
    var email = attrEmail;
    var type = "issued";


    swal({
        title: 'Envío por email',
        text: "Enviara comprobante por email",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, enviar!'
    }).then(function (result) {
        if (result.value) {

            //console.log("Id del la factura: ",Cfdi_Id);
            Facturama.Cfdi.Send("?cfdiType=" + type + "&cfdiId=" + Cfdi_Id + "&email=" + email, function (result) {
                console.log("envio", result);
            });
        }

    })
})

// DESCARRGAR CFDI EN FORMATO PDF 

$(".tablas tbody").on("click", "button.btnPdfFactura", function () {

    var idFactura = $(this).attr("idFactura");

    config = {
        "format": "pdf",
        "type": "issued",
        "id": idFactura
    };

    Facturama.Cfdi.Download(config.format, config.type, config.id, function (result) {

        dow = result;
        if (!result) {
            console.log("existo " + result);
        } else {
            console.log("No existe");
        }

        blob = converBase64toBlob(result.Content, 'application/pdf');
        var blobUrl = URL.createObjectURL(blob);
        window.open(blobUrl);

    });
})

// DESCARGAR CFDI EN FORMATO XML

$(".tablas tbody").on("click", "button.btnXmlFactura", function () {

    var idFactura = $(this).attr("idFacturaXml");

    config = {
        "format": "xml",
        "type": "issued",
        "id": idFactura
    };

    Facturama.Cfdi.Download(config.format, config.type, config.id, function (result) {

        dow = result;
        if (!result) {
            console.log("existo " + result);
        } else {
            console.log("No existe");
        }

        blob = converBase64toBlob(result.Content, 'application/xml');
        var blobUrl = URL.createObjectURL(blob);
        window.open(blobUrl);

    });
})

// FUNCION PARA CONVERTIR A BASE 64 

function converBase64toBlob(content, contentType) {
    contentType = contentType || '';
    var sliceSize = 512;
    var byteCharacters = window.atob(content); //method which converts base64 to binary
    var byteArrays = [];

    for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
        var slice = byteCharacters.slice(offset, offset + sliceSize);
        var byteNumbers = new Array(slice.length);
        for (var i = 0; i < slice.length; i++) {
            byteNumbers[i] = slice.charCodeAt(i);
        }
        var byteArray = new Uint8Array(byteNumbers);
        byteArrays.push(byteArray);
    }

    var blob = new Blob(byteArrays, { type: contentType }); //statement which creates the blob
    return blob;
}


/*=============================================
RANGO DE FECHAS
=============================================*/

$('#daterangeFact-btn').daterangepicker(
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
        $('#daterangeFact-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

        var fechaInicial = start.format('YYYY-MM-DD');

        var fechaFinal = end.format('YYYY-MM-DD');

        var capturarRango = $("#daterangeFact-btn span").html();

        localStorage.setItem("capturarRango", capturarRango);

        window.location = "index.php?ruta=facturacion&fechaInicial=" + fechaInicial + "&fechaFinal=" + fechaFinal;

    }

)

/*=============================================
CANCELAR RANGO DE FECHAS
=============================================*/

$(".daterangepicker.opensleft .range_inputs .cancelBtn").on("click", function () {

    localStorage.removeItem("capturarRango");
    localStorage.clear();
    window.location = "facturacion";
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

        dia = ("0" + dia).slice(-2);
        mes = ("0" + mes).slice(-2);

        var fechaInicial = año + "-" + mes + "-" + dia;
        var fechaFinal = año + "-" + mes + "-" + dia;

        localStorage.setItem("capturarRango", "Hoy");

        window.location = "index.php?ruta=facturacion&fechaInicial=" + fechaInicial + "&fechaFinal=" + fechaFinal;

    }

})

$("#motivoCancelar").change(function () {


    console.log("MO", $("#motivoCancelar").val());

    if ($("#motivoCancelar").val() == "01") {

        $(".inputFolioAnteririor").removeClass("hidden");
        $("#folioAnterior").attr("required", true);

    } else {

        $(".inputFolioAnteririor").addClass("hidden");
        $("#folioAnterior").attr("required", false);
    }
})