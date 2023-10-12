<?php

require_once "../../../controladores/ventas.controlador.php";
require_once "../../../modelos/ventas.modelo.php";

require_once "../../../controladores/clientes.controlador.php";
require_once "../../../modelos/clientes.modelo.php";

require_once "../../../controladores/usuarios.controlador.php";
require_once "../../../modelos/usuarios.modelo.php";

require_once "../../../controladores/productos.controlador.php";
require_once "../../../modelos/productos.modelo.php";

require_once "../../../controladores/apartados.controlador.php";
require_once "../../../modelos/apartados.modelo.php";

class imprimirFactura
{

    public $codigo;
    public $idAbono;

    public function traerImpresionFactura()
    {

        //TRAEMOS LA INFORMACIÓN DE LA VENTA

        $itemVenta = "codigo";
        $valorVenta = $this->codigo;

        $respuestaVenta = ControladorVentas::ctrMostrarVentas($itemVenta, $valorVenta);

        $productos = json_decode($respuestaVenta["productos"], true);

        $totalVenta = number_format($respuestaVenta["neto"], 2);

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

        $telCliente = $respuestaCliente["telefono"];

        //TRAEMOS LA INFORMACIÓN DEL VENDEDOR

        $itemVendedor = "id";
        $valorVendedor = $respuestaVenta["id_vendedor"];

        $respuestaVendedor = ControladorUsuarios::ctrMostrarUsuarios($itemVendedor, $valorVendedor);

        // TRAEMOS INFORMACION DE LOS ABONOS

        $itemAbono = "id";
        $valorAbono =  $_GET["idAbono"];

        $respuestaAbono = ControladorApartados::ctrMostrarApartados($itemAbono, $valorAbono);

        $abono = number_format($respuestaAbono["abono"], 2);

        $faltante = $respuestaAbono["total"] - $respuestaAbono["abonado"];

        $faltanteR = number_format($faltante, 2);

        $fechaExPr = strtotime($respuestaAbono["fecha"]);

        $abonado = number_format($respuestaAbono["abonado"], 2);

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


        //REQUERIMOS LA CLASE TCPDF

        require_once('tcpdf_include.php');

        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $pdf->startPageGroup();

        $pdf->AddPage();

        // ---------------------------------------------------------

        $bloque1 = <<<EOF

	<table>
		
		<tr>
			
            <td style="width:150px"><img src="https://hellssystems.com/resources/logoWeb.png"></td>

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

			<td style="background-color:white; width:110px; text-align:center; color:red"><br><br>FACTURA N.<br>$valorVenta</td>

		</tr>

	</table>

EOF;

        $pdf->writeHTML($bloque1, false, false, false, false, '');
        $pdf->writeHTML($bloque2, false, false, false, false, '');

        // ---------------------------------------------------------

        $bloque3 = <<<EOF

        <br>
        <br>

           Recibí de Sr(a). $nombreCliente ($telCliente) la cantidad de $$abono como anticipo de:

        <hr>

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
		
		<td style="border: 1px solid #666; background-color:white; width:77px; text-align:center; font-size:8px;"></td>
		<td style="border: 1px solid #666; background-color:white; width:72px; text-align:center; font-size:8px;">CANTIDAD</td>
		<td style="border: 1px solid #666; background-color:white; width:218px; text-align:center; font-size:8px;">DESCRIPCIÓN CORTA DE LOS PRODUCTOS PROPUESTOS POR LA EMPRESA MARCA Y MODELO</td>
		<td style="border: 1px solid #666; background-color:white; width:99px; text-align:center; font-size:8px;">IMPORTE NETO UNITARIO</td>
		<td style="border: 1px solid #666; background-color:white; width:90px; text-align:center; font-size:8px;">IMPORTE NETO TOTAL</td>

		</tr>

	</table>



EOF;

        $pdf->writeHTML($bloque3, false, false, false, false, '');

        // ---------------------------------------------------------

        foreach ($productos as $key => $item) {

            $valorUnitario = number_format($item["precio"], 2);
            $precioTotal = number_format($item["subTotal"], 2);
            $partida = $key + 1;
            $bloque4 = <<<EOF

	<table style="font-size:10px; padding:5px 10px;">

		<tr>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:77px; text-align:center">
				$partida
			</td>
			
			<td style="border: 1px solid #666; color:#333; background-color:white; width:72px; text-align:center">
				$item[cantidad]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:218px; text-align:center">
				$item[descripcion]
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:99px; text-align:center">$ 
				$valorUnitario
			</td>

			<td style="border: 1px solid #666; color:#333; background-color:white; width:90px; text-align:center">$ 
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
				
				<td style="color:#333; background-color:white; width:77px; text-align:center">
					
				</td>
				
				<td style="color:#333; background-color:white; width:72px; text-align:center">
					
				</td>

				<td style="color:#333; background-color:white; width:218px; text-align:center">
					
				</td>

				<td style="border: 1px solid #666; color:#333; background-color:white; width:99px; text-align:center">
					<b>Total</b>
				</td>

				<td style="border: 1px solid #666; color:#333; background-color:white; width:90px; text-align:center"> $$totalVenta 
					
				</td>

			</tr>
		</table>
EOF;


        $pdf->writeHTML($bloque5, false, false, false, false, '');
        // ---------------------------------------------------------
        //SALIDA DEL ARCHIVO 


        $bloque6 = <<<EOF

		<table style="font-size:10px; padding:5px 10px;">
            <tr>
                    
                    <td style="color:#333; background-color:white; width:77px; text-align:center">
                        
                    </td>
                    
                    <td style="color:#333; background-color:white; width:72px; text-align:center">
                        
                    </td>

                    <td style="color:#333; background-color:white; width:218px; text-align:center">
                        
                    </td>

                    <td style="border: 1px solid #666; color:#333; background-color:white; width:99px; text-align:center">
                        <b>Total Abonado:</b>
                    </td>

                    <td style="border: 1px solid #666; color:#333; background-color:white; width:90px; text-align:center"> $$abonado     
                        
                    </td>

                </tr>

			<tr>
				
				<td style="color:#333; background-color:white; width:77px; text-align:center">
					
				</td>
				
				<td style="color:#333; background-color:white; width:72px; text-align:center">
					
				</td>

				<td style="color:#333; background-color:white; width:218px; text-align:center">
					
				</td>

				<td style="border: 1px solid #666; color:#333; background-color:white; width:99px; text-align:center">
					<b>Quedando restante:</b>
				</td>

				<td style="border: 1px solid #666; color:#333; background-color:white; width:90px; text-align:center"> $$faltanteR 
					
				</td>

			</tr>
		</table>
        <br>
        <br>
        Quedando un restante de $$faltanteR pesos el día de hoy $diaExPr de $mesExPr de $añoExPr con dirección en Blvd. Vicente Valtierra #2703 en la colonia San Manuel. Teniendo 30 días para recoger su equipo después de la fecha no nos hacemos responsables.

        <br>
        <br>
        <br>
        <br>
        <br>
        <br>    

        <table style="font-size: 10px; padding: 5px 10px; width: 100%;">
        <tr>
            <td style="color: #333; background-color: white; text-align: center;">
                <!-- Contenido en blanco -->
            </td>
            <td style="color: #333; background-color: white; text-align: center;">
                <hr style="margin: 0 auto;">
            </td>
            <td style="color: #333; background-color: white; text-align: center;">
                <!-- Contenido en blanco -->
            </td>
        </tr>
        <tr>
            <td style="color: #333; background-color: white; text-align: center;">
                <!-- Contenido en blanco -->
            </td>
            <td style="color: #333; background-color: white; text-align: center;">
                ALFONSO MARTINEZ
            </td>
            <td style="color: #333; background-color: white; text-align: center;">
                <!-- Contenido en blanco -->
            </td>
        </tr>
    </table>



EOF;


        $pdf->writeHTML($bloque6, false, false, false, false, '');

        //$pdf->Output('factura.pdf', 'D');
        ob_end_clean();
        $pdf->Output('abonoVenta.pdf', 'I');
    }
}

$factura = new imprimirFactura();
$factura->codigo = $_GET["codigo"];
$factura->traerImpresionFactura();
