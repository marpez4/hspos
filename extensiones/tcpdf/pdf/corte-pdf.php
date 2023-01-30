<?php

require_once "../../../controladores/cortes.controlador.php";
require_once "../../../modelos/cortes.modelo.php";

class imprimirCorte
{

    public $codigo;

    public function traerImprimirCorte()
    {

        $item = "id_caja";
        $valor = $this->codigo;

        $resVentaEfectivo = ControladorCierreCortes::ctrMostrarVentasEfectivo($item, $valor);
        
        $resVentaTarjeta = ControladorCierreCortes::ctrMostrarVentasTarjetas($item, $valor);

        $resVentaDepositos = ControladorCierreCortes::ctrMostrarVentasDepositos($item, $valor);

        $resVentaDepositosE = ControladorCierreCortes::ctrMostrarVentasDepositosElectronicos($item, $valor);

        $resVentaDepositosO = ControladorCierreCortes::ctrMostrarVentasOtros($item, $valor);

        $resVentaServicios = ControladorCierreCortes::ctrMostrarVentasServicios($item, $valor);

        //REQUERIMOS LA CLASE TCPDF

        require_once('tcpdf_include.php');

        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        error_reporting(E_ALL & ~E_NOTICE);
        ini_set('display_errors', 0);
        ini_set('log_errors', 1);

        $pdf->startPageGroup();

        $pdf->AddPage();

        ob_end_clean();
        // ---------------------------------------------------------

        $bloque1 = <<<EOF

	<table>
		
		<tr>
			
			<td style="width:80px"><img src="images/logo-negro-bloque.png"></td>

			<td style="background-color:white; width:140px">
				
				<div style="font-size:8.5px; text-align:right; line-height:15px;">
					
					<br>
					 León Gto, México

					<br>
					Dirección: Blvd. Vicente Valtierra #2703 Col. San Manuel

				</div>

			</td>

			<td style="background-color:white; width:140px">

				<div style="font-size:8.5px; text-align:right; line-height:15px;">
					
					<br>
					Teléfonos: (477) 3112875 ó 4776632304
					
					<br>
					soporte_hell@hotmail.com

				</div>
				
			</td>

			<td style="background-color:white; width:110px; text-align:center; color:red"><br><br></td>

		</tr>

	</table> 

    <hr>

    <div style="text-align: center;">
	    <h4>Ventas</h4>
	</div>

EOF;

$pdf->writeHTML($bloque1, false, false, false, false, '');

$bloque2 = <<<EOF
 
    <hr>		

	<div style="text-align: center;">
	    <h4><strong>Efectivo</strong></h4>
	</div>

    <table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:40px; text-align:center">#</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Código</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Metodo de pago</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Monto Total</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha</td>

		</tr>

	</table>

EOF;

$pdf->writeHTML($bloque2, false, false, false, false, '');

foreach ($resVentaEfectivo as $key => $item) {

   $total = number_format($item["total"], 2);

   $fecha = date("d-m-Y", strtotime($item["fecha"]));

   $no = $key + 1;

    $bloque3 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:40px; text-align:center">
                $no
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
				$item[codigo]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                 $item[metodo_pago]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $total
			</td>

            <td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                $fecha
			</td>
		</tr>

	</table>


EOF;

$pdf->writeHTML($bloque3, false, false, false, false, '');
   
}

// TARJETAS 

$bloque4 = <<<EOF
 
    <hr>		

	<div style="text-align: center;">
	    <h4><strong>Tarjetas</strong></h4>
	</div>

    <table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:40px; text-align:center">#</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Código</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Metodo de pago</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Monto Total</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha</td>

		</tr>

	</table>

EOF;

$pdf->writeHTML($bloque4, false, false, false, false, '');

foreach ($resVentaTarjeta as $key => $item) {

   $total = number_format($item["total"], 2);

   $fecha = date("d-m-Y", strtotime($item["fecha"]));

   $no = $key + 1;

    $bloque5 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:40px; text-align:center">
                $no
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
				$item[codigo]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                 $item[metodo_pago]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $total
			</td>

            <td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                $fecha
			</td>
		</tr>

	</table>


EOF;

$pdf->writeHTML($bloque5, false, false, false, false, '');
   
}

// DEPOSITOS

$bloque6 = <<<EOF
 
    <hr>		

	<div style="text-align: center;">
	    <h4><strong>Depósitos</strong></h4>
	</div>

    <table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:40px; text-align:center">#</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Código</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Metodo de pago</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Monto Total</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha</td>

		</tr>

	</table>

EOF;

$pdf->writeHTML($bloque6, false, false, false, false, '');

foreach ($resVentaDepositos as $key => $item) {

   $total = number_format($item["total"], 2);

   $fecha = date("d-m-Y", strtotime($item["fecha"]));

   $no = $key + 1;

    $bloque7 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:40px; text-align:center">
                $no
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
				$item[codigo]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                 $item[metodo_pago]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $total
			</td>

            <td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                $fecha
			</td>
		</tr>

	</table>


EOF;

$pdf->writeHTML($bloque7, false, false, false, false, '');
   
}

// DEPOSITOS ELECTRONICOS

$bloque8 = <<<EOF
 
    <hr>		

	<div style="text-align: center;">
	    <h4><strong>Depósitos Electrónicos</strong></h4>
	</div>

    <table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:40px; text-align:center">#</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Código</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Metodo de pago</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Monto Total</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha</td>

		</tr>

	</table>

EOF;

$pdf->writeHTML($bloque8, false, false, false, false, '');

foreach ($resVentaDepositosE as $key => $item) {

   $total = number_format($item["total"], 2);

   $fecha = date("d-m-Y", strtotime($item["fecha"]));

   $no = $key + 1;

    $bloque9 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:40px; text-align:center">
                $no
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
				$item[codigo]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                 $item[metodo_pago]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $total
			</td>

            <td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                $fecha
			</td>
		</tr>

	</table>


EOF;

$pdf->writeHTML($bloque9, false, false, false, false, '');
   
}

// OTROS

$bloque10 = <<<EOF
 
    <hr>		

	<div style="text-align: center;">
	    <h4><strong>Otros</strong></h4>
	</div>

    <table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:40px; text-align:center">#</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Código</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Metodo de pago</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Monto Total</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha</td>

		</tr>

	</table>

EOF;

$pdf->writeHTML($bloque10, false, false, false, false, '');

foreach ($resVentaDepositosO as $key => $item) {

   $total = number_format($item["total"], 2);

   $fecha = date("d-m-Y", strtotime($item["fecha"]));

   $no = $key + 1;

    $bloque11 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:40px; text-align:center">
                $no
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
				$item[codigo]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                 $item[metodo_pago]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $total
			</td>

            <td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
                $fecha
			</td>
		</tr>

	</table>


EOF;

$pdf->writeHTML($bloque11, false, false, false, false, '');
   
}


// SERVICIOS

$bloque12 = <<<EOF
 
    <hr>		

	<div style="text-align: center;">
	    <h4><strong>Servicios</strong></h4>
	</div>

    <table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:40px; text-align:center">#</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Cliente</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Monto total</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha llegada</td>
		<td style="border: 1px solid #666; background-color:white; width:125px; text-align:center">Fecha entrega</td>

		</tr>

	</table>

EOF;

$pdf->writeHTML($bloque12, false, false, false, false, '');

foreach ($resVentaServicios as $key => $item) {

   $total = number_format($item["total"], 2);

   $fechaLl = date("d-m-Y", strtotime($value["fecha_llegada"]));

   $fechaE = date("d-m-Y", strtotime($value["fecha_entrega"]));

   $no = $key + 1;

    $bloque13 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:40px; text-align:center">
                $no
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
				$item[cliente]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">
               $ $total
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $fechaLl
			</td>

            <td style="border: 1px solid #666; color:#333; background-color:white; width:125px; text-align:center">$ 
                $fechaE
			</td>
		</tr>

	</table>


EOF;

$pdf->writeHTML($bloque13, false, false, false, false, '');
   
}

// ---------------------------------------------------------
//SALIDA DEL ARCHIVO 

 $pdf->Output('cortesPDF.pdf');
// $pdf->Output('CORTES.pdf', 'FI');

    }
}

$factura = new imprimirCorte();
$factura->codigo = $_GET["idCaja"];
$factura->traerImprimirCorte();
