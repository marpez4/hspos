<?php

require_once "../../../controladores/usuarios.controlador.php";
require_once "../../../modelos/usuarios.modelo.php";

require_once "../../../controladores/servicios.controlador.php";
require_once "../../../modelos/servicios.modelo.php";

class imprimirFactura
{

	public $codigo;

	public function traerImpresionFactura()
	{

		$itemServicio = "id";
		$valor = $this->codigo;

		$respuestaServicio = ControladorServicios::ctrMostrarServicios($itemServicio, $valor);

		$fechaLlegada = date("d-m-Y", strtotime($respuestaServicio["fecha_llegada"]));

		$fechaEntrega = date("d-m-Y", strtotime($respuestaServicio["fecha_entrega"]));

		$totalServicio = number_format($respuestaServicio["total"], 2);

		$itemVendedor = "id";
		$valorVendedor = $respuestaServicio["id_empleado"];

		$respuestaVendedor = ControladorUsuarios::ctrMostrarUsuarios($itemVendedor, $valorVendedor);

		if ($respuestaServicio["estatus"] == 1) {

			$estatus = "Abierto";

		} else if ($respuestaServicio["estatus"] == 2) {

			$estatus = "En proceso";

		} else if ($respuestaServicio["estatus"] == 3) {

			$estatus = "Terminado";
		} else if ($respuestaServicio["estatus"] == 4) {

			$estatus = "Suspendido";
		} else if ($respuestaServicio["estatus"] == 5) {

			$estatus = "Cancelado";
		} else if ($respuestaServicio["estatus"] == 6) {

			$estatus = "Entregado";
		}

		//REQUERIMOS LA CLASE TCPDF

		require_once('tcpdf_include.php');

		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		$pdf->startPageGroup();

		$pdf->AddPage();

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

			<td style="background-color:white; width:110px; text-align:center; color:red">
				<br><br> &nbsp; &nbsp; NO. FOLIO $respuestaServicio[folio]
				<br><small color:black>Estatus del servicio: $estatus</small>
			</td>

		</tr>

	</table>

EOF;

		$pdf->writeHTML($bloque1, false, false, false, false, '');

		$bloque2 = <<<EOF

	<table>
		
		<tr>
			
			<td style="width:540px"><img src="images/back.jpg"></td>
		
		</tr>

	</table>

	<table style="font-size:10px; padding:5px 10px;">
	
		<tr>
		
			<td style="border: 1px solid #666; background-color:white; width:390px">

				Cliente: $respuestaServicio[cliente]

			</td>

			<td style="border: 1px solid #666; background-color:white; width:150px; text-align:right">
			
				Fecha de llegada: $fechaLlegada

			</td>

		</tr>

		<tr>
		
			<td style="border: 1px solid #666; background-color:white; width:390px">Vendedor: $respuestaVendedor[nombre]</td>

			<td style="border: 1px solid #666; background-color:white; width:150px; text-align:right">
			
				Fecha de entrega: $fechaEntrega

			</td>

		</tr>

		<tr>
		
		<td style="border-bottom: 1px solid #666; background-color:white; width:540px"></td>

		</tr>

	</table>

EOF;

		$pdf->writeHTML($bloque2, false, false, false, false, '');

		$bloque3 = <<<EOF

		<table style="font-size:10px; padding:5px 10px;">
		
			<tr>
		
				<td style="border: 1px solid #666; background-color:white; width:540px; text-align:center;">
		
					DETALLES
		
			</td>
		
			</tr>
		
			<tr>
		
				<td style="border: 1px solid #666; background-color:white; width:540px">
		
					Equipo: $respuestaServicio[equipo],
		
					Marca: $respuestaServicio[marca],
		
					Procesador: $respuestaServicio[procesador],
		
					RAM: $respuestaServicio[ram],
		
					DD: $respuestaServicio[dd],
		
					SO: $respuestaServicio[so] <br>
		
					Falla: $respuestaServicio[falla] <br>
		
					Solución: $respuestaServicio[solucion]
			
				</td>
		
			</tr>
		
			<tr>
		
				<td style="border-bottom: 1px solid #666; background-color:white; width:540px"></td>
		
			</tr>
		
		</table>
EOF;
		$pdf->writeHTML($bloque3, false, false, false, false, '');

		$bloque4 = <<<EOF

		<table style="font-size:10px; padding:5px 10px;">
	
			<tr>
	
				<td style="color:#333; background-color:white; width:340px; text-align:center"></td>
	
				<td style="border-bottom: 1px solid #666; background-color:white; width:100px; text-align:center"></td>
	
				<td style="border-bottom: 1px solid #666; color:#333; background-color:white; width:100px; text-align:center"></td>
	
			</tr>
			
			<tr>
			
				<td style="border-right: 1px solid #666; color:#333; background-color:white; width:340px; text-align:center"></td>
	
				<td style="border: 1px solid #666;  background-color:white; width:100px; text-align:center">
					<b>Total servicio</b>
				</td>
	
				<td style="border: 1px solid #666; color:#333; background-color:white; width:100px; text-align:center">
					$ $totalServicio
				</td>
	
			</tr>	
	
		</table>
		<br> <br>
EOF;

		$pdf->writeHTML($bloque4, false, false, false, false, '');



		$bloque5 = <<<EOF
	
	<br>

	<table>
		
		<tr>
	
			<td style="width:540px"><img src="images/back.jpg"></td>

		</tr>

	</table>

	<table style="font-size:10px; padding:5px 10px;">
	
		<tr>
	
			<td style="border: 1px solid #666; background-color:white; width:540px; text-align:center;">
	
				<b>Notas</b>
	
		</td>
	
		</tr>
	
		<tr>
	
			<td style="border: 1px solid #666; background-color:white; width:540px">
	
				
		
			</td>
	
		</tr>
	
		<tr>
	
			<td style="border-bottom: 1px solid #666; background-color:white; width:540px"></td>
	
		</tr>
	
	</table>
EOF;

		$pdf->writeHTML($bloque5, false, false, false, false, '');

		// ---------------------------------------------------------
		//SALIDA DEL ARCHIVO 

		//$pdf->Output('factura.pdf', 'D');
		$pdf->Output('servicio.pdf');
	}
}

$factura = new imprimirFactura();
$factura->codigo = $_GET["codigo"];
$factura->traerImpresionFactura();
