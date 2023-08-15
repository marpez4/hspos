
// $("#modalAgregarCodigoProducto modal-body").on('click', '#btnCrearCodigo', function (){

//     const numIntRandom = Math.floor(Math.random() * 10);
//     console.log(numIntRandom);

// })

$("#btnCrearCodigo").on('click', function (){

    const numIntRandom = Math.floor(Math.random() * 10000000000);
    console.log(numIntRandom);

    $("#nuevoCodigo").val(numIntRandom);


})

$(".tablas").on("click", ".btnVerCPr", function () {
    
    var codigoProducto = $(this).attr("idCPr");
    
	window.open("extensiones/tcpdf/pdf/codigos-productos.php?codigo=" + codigoProducto, "_blank");

})