<?php

require_once "../../../controladores/ventas.controlador.php";
require_once "../../../modelos/ventas.modelo.php";

require_once "../../../controladores/clientes.controlador.php";
require_once "../../../modelos/clientes.modelo.php";

require_once "../../../controladores/usuarios.controlador.php";
require_once "../../../modelos/usuarios.modelo.php";

require_once "../../../controladores/productos.controlador.php";
require_once "../../../modelos/productos.modelo.php";

class imprimirFactura
{

	public $codigo;

	public function traerImpresionFactura()
	{

		//TRAEMOS LA INFORMACIÓN DE LA VENTA

		$itemVenta = "codigo";
		$valorVenta = $this->codigo;

		$respuestaVenta = ControladorVentas::ctrMostrarVentas($itemVenta, $valorVenta);

		$productos = json_decode($respuestaVenta["productos"], true);

		$fechaExPr = strtotime($respuestaVenta["fecha"]);

		$diaExPr = date("j", $fechaExPr);
		$mesExPr1 = date("n", $fechaExPr);
		switch ($mesExPr1) {
			case 1:
				$mesExPr = "enero";
				break;
			case 2:
				$mesExPr = "febrero";
				break;
			case 3:
				$mesExPr = "marzo";
				break;
			case 4:
				$mesExPr = "abril";
				break;
			case 5:
				$mesExPr = "mayo";
				break;
			case 6:
				$mesExPr = "junio";
				break;
			case 7:
				$mesExPr = "julio";
				break;
			case 8:
				$mesExPr = "agosto";
				break;
			case 9:
				$mesExPr = "septiembre";
				break;
			case 10:
				$mesExPr = "octubre";
				break;
			case 11:
				$mesExPr = "noviembre";
				break;
			case 12:
				$mesExPr = "diciembre";
				break;
		}

		$añoExPr =  date("Y", $fechaExPr);

		//TRAEMOS LA INFORMACIÓN DEL CLIENTE

		$itemCliente = "id";
		$valorCliente = $respuestaVenta["id_cliente"];

		$respuestaCliente = ControladorClientes::ctrMostrarClientes($itemCliente, $valorCliente);

		if ($respuestaCliente["id"] == 21) {

			$itemCodigo = "codigo_venta";

			$valorCodigo = $valorVenta;

			$respuestaClienteCM = ControladorClientes::ctrMostrarClientesMostrador($itemCodigo, $valorCodigo);

			$nombreCliente = $respuestaClienteCM["nombre"];
		} else {

			$nombreCliente = $respuestaCliente["nombre"];
		}

		//TRAEMOS LA INFORMACIÓN DEL VENDEDOR

		$itemVendedor = "id";
		$valorVendedor = $respuestaVenta["id_vendedor"];

		$respuestaVendedor = ControladorUsuarios::ctrMostrarUsuarios($itemVendedor, $valorVendedor);

		//REQUERIMOS LA CLASE TCPDF

		require_once('tcpdf_include.php');

		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		$pdf->startPageGroup();

		$pdf->AddPage();

		$pdf->SetFooterMargin(0);

		// get the current page break margin
		$bMargin = $pdf->getBreakMargin();

		// get current auto-page-break mode
		$auto_page_break = $pdf->getAutoPageBreak();

		// disable auto-page-break
		$pdf->SetAutoPageBreak(true, 0);

		// set background image
		$img_file = 'https://hellssystems.com/resources/cartaVenta2.jpg';
		$pdf->Image($img_file, 0, 0, 225, 305, '', '', '', false, 300, '', false, false, 0);

		// set the starting point for the page content
		$pdf->setPageMark();
		$pdf->setPrintFooter(false);
		// ---------------------------------------------------------

		$bloque1 = <<<EOF

	<table>
		
		<tr>
			
			<td></td>

			<td style="width:140px">
				
				

			</td>

			<td style="width:140px">
				
			</td>

			<td style="width:110px; text-align:center; color:white"><br><br>Folio venta: <br>$valorVenta</td>

		</tr>

	</table>

EOF;

		$pdf->writeHTML($bloque1, false, false, false, false, '');

		// ---------------------------------------------------------

		$bloque2 = <<<EOF

		<div style="text-align:right;">
    		<h3>León, Guanajuato a $diaExPr de  $mesExPr de  $añoExPr</h3>
		</div>

		<div style="text-align:right;">
			<h2><u>Sr.(a)  $nombreCliente </u></h2>
		</div>

EOF;

		$pdf->writeHTML($bloque2, false, false, false, false, '');

		// ---------------------------------------------------------

		$bloque3 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; width:77px; text-align:center; font-size:8px;">POSICIÓN<br>(PARTIDA)</td>
		<td style="border: 1px solid #666; width:72px; text-align:center; font-size:8px;">CANTIDAD</td>
		<td style="border: 1px solid #666; width:218px; text-align:center; font-size:8px;">DESCRIPCIÓN CORTA DE LOS PRODUCTOS PROPUESTOS POR LA EMPRESA MARCA Y MODELO</td>
		<td style="border: 1px solid #666; width:99px; text-align:center; font-size:8px;">IMPORTE NETO UNITARIO (SIN IVA)</td>
		<td style="border: 1px solid #666; width:90px; text-align:center; font-size:8px;">IMPORTE NETO TOTAL (SIN IVA)</td>

		</tr>

	</table>

EOF;

		$pdf->writeHTML($bloque3, false, false, false, false, '');

		// ---------------------------------------------------------
		$totalProductos = 0;

		foreach ($productos as $key => $item) {

			$valorUnitario = number_format($item["precio"], 2);
			$precioTotal = number_format($item["subTotal"], 2);
			$totalProductos += $item["subTotal"];
			$totalProductos = number_format($totalProductos, 2);
			$partida = $key + 1;
			$bloque4 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; width:77px; text-align:center">
				$partida
			</td>
			
			<td style="border: 1px solid #666; color:#333; width:72px; text-align:center">
				$item[cantidad]
			</td>

			<td style="border: 1px solid #666; color:#333; width:218px; text-align:center">
				$item[descripcion]
			</td>

			<td style="border: 1px solid #666; color:#333; width:99px; text-align:center">$ 
				$valorUnitario
			</td>

			<td style="border: 1px solid #666; color:#333; width:90px; text-align:center">$ 
				$precioTotal
			</td>


		</tr>

		</table>

		

EOF;

			$pdf->writeHTML($bloque4, false, false, false, false, '');
		}

		$bloque5 = <<<EOF

		<table style="font-size:10px; padding:5px 10px;">

			<tr>
				
				<td style="border: 1px solid #666; color:#333; width:77px; text-align:center">
					
				</td>
				
				<td style="border: 1px solid #666; color:#333; width:72px; text-align:center">
					
				</td>

				<td style="border: 1px solid #666; color:#333; width:218px; text-align:center">
					
				</td>

				<td style="border: 1px solid #666; color:#333; width:99px; text-align:center">Total, sin IVA
					
				</td>

				<td style="border: 1px solid #666; color:#333; width:90px; text-align:center">$$totalProductos
					
				</td>

			</tr>
		</table>
EOF;


		$pdf->writeHTML($bloque5, false, false, false, false, '');


		$bloque6 = <<<EOF

		<br>
		<br>
		<br>
		<table style="border: 1px solid #666; padding:1px;">

			<tr style="font-size:8px;">

				<td>
					Nota: Garantía 90 días con nosotros (15 días en accesorios), únicamente por defecto de fábrica, no aplican en: caídas, derrames de líquidos, descargas eléctricas, (Conecte a un regulador o no break forzosamente), sistema operativo, ni en la pila de laptop o cargador (Pila puede retener o no carga). En caso de devolución aplica un 20% del valor total de la compra. Nota válida para aplicar garantía sin excepciones, No nos hacemos responsables por daños de traslado o robos, garantía solamente aplica en equipos. (No nos hacemos responsables por daños de envió.) En equipos, monitores o accesorios con defecto no aplica ninguna garantía.
				</td>

			</tr>
		</table>
EOF;


		$pdf->writeHTML($bloque6, false, false, false, false, '');

		// ---------------------------------------------------------

		// ---------------------------------------------------------
		//SALIDA DEL ARCHIVO 

		//$pdf->Output('factura.pdf', 'D');
		ob_end_clean();
		$pdf->Output('factura.pdf', 'I');
	}
}

$factura = new imprimirFactura();
$factura->codigo = $_GET["codigo"];
$factura->traerImpresionFactura();
