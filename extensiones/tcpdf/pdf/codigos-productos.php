<?php

require_once "../../../controladores/codigosProductos.controlador.php";
require_once "../../../modelos/codigosProductos.modelo.php";

include '../../../extra/codigosdebarras/barcode.php';

$codigo = $_GET["codigo"];

$respuestaCPr = ControladorCodigosProductos::ctrMostrarCodigoProductoPDF($codigo);

require '../../../extra/codigosdebarras/fpdf/fpdf.php';

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetAutoPageBreak(true, 20);
$y = $pdf->GetY();

$cant = $respuestaCPr['cantidad'];

// for ($i = 0; $i > $cant; $i++) {

    $code = $respuestaCPr['codigo'];

    barcode('codigos/' . $code . '.png', $code, 20, 'horizontal', 'code128', true);

    $pdf->Image('codigos/' . $code . '.png', 10, $y, 50, 0, 'PNG');

    $y = $y + 15;
// }


$pdf->Output();
