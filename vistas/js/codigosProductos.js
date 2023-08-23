
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



/*=============================================
ELIMINAR CATEGORIA
=============================================*/
$(".tablas").on("click", ".btnEliminarCodigoB", function(){

    var idCodigoB = $(this).attr("idCodigoB");

    swal({
        title: '¿Está seguro de borrar el código?',
        text: "¡Si no lo está puede cancelar la acción!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, borrar!'
    }).then(function(result){

        if(result.value){

            window.location = "index.php?ruta=codigosProductos&idCodigoB="+idCodigoB;

        }

    })

})