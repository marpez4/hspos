
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

function emisionFactura(datos, productos) {


    // for (var i = 0; i < productos.length; i++) {
    //     var obj = [{
    //         "ProductCode": productos[i].unitCode,
    //         "IdentificationNumber": productos[i].identificationNumber,
    //         "Description": productos[i].descripcion,
    //         "Unit": productos[i].unit,
    //         "UnitCode": productos[i].unitCode, // Falta este dato
    //         "UnitPrice": productos[i].precio,
    //         "Quantity": productos[i].cantidad,
    //         "Subtotal": productos[i].subTotal,
    //         "Taxes": [
    //             {
    //                 "Total": productos[i].impuestoFinal,
    //                 "Name": "IVA",
    //                 "Base": productos[i].subTotal,
    //                 "Rate": productos[i].impuesto,
    //                 "IsRetention": false
    //             }
    //         ],
    //         "Total": productos[i].totalNeto
    //     }]
    // }

    // let newObs = [];

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
        "Folio": datos.Folio,
        "PaymentForm": datos.PaymentForm,
        "PaymentMethod": datos.PaymentMethod,
        "Exportation": datos.Exportation,
        "Items": [
            {
                "ProductCode": productos[0].unitCode,
                "IdentificationNumber": productos[0].identificationNumber,
                "Description": productos[0].descripcion,
                "Unit": productos[0].unitCode,
                "UnitCode": productos[0].unit,
                "UnitPrice": productos[0].precio,
                "Quantity": productos[0].cantidad,
                "Subtotal": productos[0].subTotal,
                "TaxObject": productos[0].taxObj,
                "Taxes": [
                    {
                        "Total": productos[0].impuestoFinal,
                        "Name": "IVA",
                        "Base": productos[0].subTotal,
                        "Rate": productos[0].impuesto,
                        "IsRetention": false
                    }
                ],
                "Total": productos[0].totalNeto
            }
        ]
    }


    console.log(factura);

    Facturama.Cfdi.Create3(factura, function (result) {
        factura = result;
        console.log("factura ==>>" + result);
    });

    // [{ "id": "23", "descripcion": "PANTALLA OLED DE 55 PULGADAS CON ANDROID IOS", "cantidad": "2", "stock": "46", "precio": "11000", "subTotal": "22000", "impuestoFinal": "1760.00", "totalNeto": 23760, "impuesto": ".08", "unitCode": "43211805", "unit": "H87", "identificationNumber": "PSO451" },
    // { "id": "26", "descripcion": "HUB DE USB MARCA MOCH CON 6 ENTRADAS ", "cantidad": "1", "stock": "47", "precio": "320", "subTotal": "320", "impuestoFinal": "25.60", "totalNeto": 345.6, "impuesto": ".08", "unitCode": "43211805", "unit": "H87", "identificationNumber": "HUB1873S" }]

    // Receiver

    // var nombreCliente = $("#nombreCliente").val();
    // var cfdiUse = $("#cfdiRecep").val();
    // var rfc = $("#rfcRecep").val();
    // var fiscalReg = $("#fiscalRegRecep").val();
    // var cp = $("#cpRecep").val();

    // Datos generales

    // var cfdiType = $("#cfdiType").val();
    // var nameId = $("#nameId").val();
    // var expeditionPlace = $("#expeditionPlace").val();
    // var folio = $("#folio").val();
    // var paymentForm = $("#paymentForm").val();
    // var paymentMethod = $("#paymentMethod").val();


    // ARREGLO


}

function downloadCFDI() {

    config = {
        "format": "pdf",
        "type": "issued",
        "id": "nJxuu4DAwnNc8NeGY1dS4Q2"
    }

    Facturama.Cfdi.Download(config.format, config.type, config.id, function (result) {
        factura = result;
        console.log("factura ==>>" + result);
    });

}