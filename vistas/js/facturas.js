
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

    
    for (var i = 0; i < productos.length; i++) {
        var obj = [{
            "ProductCode": productos[i].unitCode,
            "IdentificationNumber": productos[i].identificationNumber,
            "Description": productos[i].descripcion,
            "Unit": productos[i].unit,
            "UnitCode": productos[i].unitCode, // Falta este dato
            "UnitPrice": productos[i].precio,
            "Quantity": productos[i].cantidad,
            "Subtotal": productos[i].subTotal,
            "Taxes": [
                {
                    "Total": productos[i].impuestoFinal,
                    "Name": "IVA",
                    "Base": productos[i].subTotal,
                    "Rate": productos[i].impuesto,
                    "IsRetention": false
                }
            ],
            "Total": productos[i].totalNeto
        }]
        console.log(obj);
    }

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
            obj.push()
        ]
    }


    console.log(factura);

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