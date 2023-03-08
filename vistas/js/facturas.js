var newClient = {
    "Email": "pruebas@gmail.com",
    "Address": {
        "Street": "Av Seguridad Soc",
        "ExteriorNumber": "123",
        "InteriorNumber": "",
        "Neighborhood": "Fidel Velazquez",
        "ZipCode": "78436",
        "Locality": "",
        "Municipality": "Soledad de Graciano Sánchez",
        "State": "San Luis Potosí",
        "Country": "Mex"
    },
    "Rfc": "XAMA620210DQ5",
    "Name": "ALBA XKARAJAM MENDEZ",
    "CfdiUse": "G03",
    "TaxZipCode": "83410",
    "FiscalRegime": "626"
};

function testCliente() {

    Facturama.Clients.Create(newClient, function (result) {
        client = result;
        console.log("creacion", result);
    });

}