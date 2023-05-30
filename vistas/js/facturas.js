
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

function downloadCFDI() {

    config = {
        "format": "pdf",
        "type": "issued",
        "id": "nJxuu4DAwnNc8NeGY1dS4Q2"
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

}

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