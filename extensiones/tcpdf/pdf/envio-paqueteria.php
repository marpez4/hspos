<?php

require_once "../../../controladores/pedidosPaqueteria.controlador.php";
require_once "../../../modelos/pedidosPaqueteria.modelo.php";

$codigo = $_GET["codigo"];

$itemPaqueteria = "id";
$valorPaqueteria = $codigo;

$respuestaPaqueteria = ControladorPedidosPaqueteria::ctrMostrarPaqueteria($itemPaqueteria, $valorPaqueteria);

// Include the main TCPDF library (search for installation path).
require_once('tcpdf_include.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);


// remove default header/footer
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(8, PDF_MARGIN_TOP, 8);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

$pdf->SetDisplayMode('fullpage', 'SinglePage', 'UseNone');

// set font
$pdf->SetFont('times', 'B', 22);

$pdf->AddPage('L', 'A4');
$bloque1 = <<<EOF
NOMBRE: $respuestaPaqueteria[nombreCompleto]<br>
CALLE: $respuestaPaqueteria[calle]<br>
COLONIA: $respuestaPaqueteria[colonia]<br>
CP: $respuestaPaqueteria[cp]<br>
CIUDAD: $respuestaPaqueteria[idCiudad]<br>
ESTADO: $respuestaPaqueteria[idEstado]<br>
TELÉFONO: $respuestaPaqueteria[telefono]<br>
ENTRE CALLES: $respuestaPaqueteria[entreCalles]<br>
REFERENCIAS: $respuestaPaqueteria[referencias]
EOF;

$pdf->writeHTML($bloque1, false, false, false, false, '');

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('EnvioPaqueteria.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+