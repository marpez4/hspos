
// $("#modalAgregarCodigoProducto modal-body").on('click', '#btnCrearCodigo', function (){

//     const numIntRandom = Math.floor(Math.random() * 10);
//     console.log(numIntRandom);

// })

$("#btnCrearCodigo").on('click', function (){

    const numIntRandom = Math.floor(Math.random() * 10000000000);
    console.log(numIntRandom);

    $("#nuevoCodigo").val(numIntRandom);


})