
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

function agregarProducto() {

    var newProduct = {
        "Unit": "Servicio",
        "UnitCode": "E48",
        "IdentificationNumber": "WEB003",
        "Name": "Sitio Web CMS",
        "Description": "Desarrollo e implementación de sitio web empleando un CMS",
        "Price": 6500.0,
        "CodeProdServ": "43232408",
        "Taxes": [{
            "Name": "IVA",
            "Rate": 0.16,
            "IsRetention": false,
            "IsFederalTax": true
        }]
    };

    Facturama.Products.Create(newProduct, function (result) {
        product = result;
    });

}