
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