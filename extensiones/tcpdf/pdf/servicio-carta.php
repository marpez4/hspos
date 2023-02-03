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

		if ($fechaEntrega  == "0000-00-00") {

			$impFechaEntrega = "Fecha de entrega: " . $fechaEntrega;
		} else {

			$impFechaEntrega = "";
		}

		if ($respuestaServicio["solucion"] == null) {

			$impSolucion = "";
		} else {

			$impSolucion = "Solución: " . $respuestaServicio["solucion"];
		}


		$totalServicio = number_format($respuestaServicio["total"], 2);

		$itemVendedor = "id";
		$valorVendedor = $respuestaServicio["id_empleado"];

		$respuestaVendedor = ControladorUsuarios::ctrMostrarUsuarios($itemVendedor, $valorVendedor);


		if ($respuestaServicio["estatus"] == 1) {

			$estatus = " Estatus del servicio: Abierto";
		} else if ($respuestaServicio["estatus"] == 2) {

			$estatus = " Estatus del servicio: En proceso (Trabajando)";
		} else if ($respuestaServicio["estatus"] == 3) {

			$estatus = " Estatus del servicio: Terminado";
		} else if ($respuestaServicio["estatus"] == 4) {

			$estatus = " Estatus del servicio: Suspendido";
		} else if ($respuestaServicio["estatus"] == 5) {

			$estatus = " Estatus del servicio: Cancelado";
		} else if ($respuestaServicio["estatus"] == 6) {

			$estatus = " Estatus del servicio: Entregado";
		}

		//REQUERIMOS LA CLASE TCPDF

		require_once('tcpdf_include.php');

		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		$pdf->SetAutoPageBreak($margin = 0);

		$pdf->SetTitle('Nota de servicio');

		$pdf->startPageGroup();

		$pdf->AddPage();


		// ---------------------------------------------------------
		$html = <<<EOF
		<!-- EXAMPLE OF CSS STYLE -->
		<style>
			h3 {
				color: #000;
				font-family: times;
				font-size: 11pt;
				text-decoration: underline;
			}
			p.first {
				color: #003300;
				font-family: helvetica;
				font-size: 12pt;
			}
			p.first span {
				color: #006600;
				font-style: italic;
			}
			p#second {
				color: #CC0000;
				font-family: times;
				font-size: 12pt;
				text-align: justify;
			}
			p#second > span {
				background-color: #fff;
			}
			table.first {
				color: #003300;
				font-family: helvetica;
				font-size: 8pt;
				border-left: 3px solid red;
				border-right: 3px solid #CC0000;
				border-top: 3px solid red;
				border-bottom: 3px solid red;
				background-color: #fff;
			}
			td {
				border: 2px solid #ff4f30;
				background-color: #fff;
			}
			td.second {
				border: 2px dashed green;
			}
			div.test {
				color: #CC0000;
				background-color: #FFFF66;
				font-family: helvetica;
				font-size: 10pt;
				border-style: solid solid solid solid;
				border-width: 2px 2px 2px 2px;
				border-color: green #FF00FF #ff4f30 red;
				text-align: center;
			}
			.lowercase {
				text-transform: lowercase;
			}
			.uppercase {
				text-transform: uppercase;
			}
			.capitalize {
				text-transform: capitalize;
				text-align:center;
			}
			.img {

				width:65px;
			}
			.folio{

				color: red;
				font-size:10px;
			}
			.estatus{

				color:#930000;

			}
			.hrStyle{
				width:200px;
			}
		</style>		

		<table class="first" cellpadding="4" cellspacing="6">

		<tr>
			<td width="540" align="center"><b>Nota de servicio</b></td>
	   </tr>

	   <tr>
	   <td width="130" align="center">

	   <img class="img" src="images/logo-negro2.png">
	   
	   </td>
	   <td width="130" align="center">
			
	   		&nbsp;	
			
	   		<br>

	   		<b>León Gto, México

	   		<br>
	   		Dirección: Blvd. Vicente Valtierra #2703 Col. San Manuel</b>
	   
	   </td>
	   <td width="130" align="center">
	   &nbsp;
	   <br>
	   	<b>
		   Teléfonos: (477) 3112875 o Whatsapp:; 4776632304
		   
		   <br>
		   Email: soporte_hell@hotmail.com	   
	   </b>
	   
	   </td>

	   <td width="130" align="center">
	   	<b class="folio">
		   NO. FOLIO $respuestaServicio[folio]
		</b>

		<br>

		<b class="estatus">
			$estatus
	 	</b>

		 <br>

	   	<b>
		  Horarios L-V 10 am - 7 pm, Sab 10 am- 4 pm horario corrido
	   </b>
	   
	   </td>
	  </tr>

	  <tr>

	  <td width="266" align="center">

	   	<b>
		   Cliente: $respuestaServicio[cliente], Tel: $respuestaServicio[telefono]
		</b>

		<br>

		<b>
			Vendedor: $respuestaVendedor[nombre]
		</b>
	   
	   </td>
	   <td width="266" align="center">

	   	<b>
		   Fecha de llegada: $fechaLlegada
		</b>

		<br>

			 $impFechaEntrega
	   
	   </td>
	  </tr>



	  <tr>

	  	<td width="540" align="justify">

		<h3>Detalles</h3>

		  Equipo: $respuestaServicio[equipo], Marca: $respuestaServicio[marca], Procesador: $respuestaServicio[procesador], RAM: $respuestaServicio[ram], HDD: $respuestaServicio[dd], SSD: $respuestaServicio[ssd], SO: $respuestaServicio[so]

		  <br>Falla: $respuestaServicio[falla]
			
		  <br>Notas: $respuestaServicio[obs]. Contraseña del equipo: $respuestaServicio[contrasena], Entrega de cargador: $respuestaServicio[cargador]
		  <br>$impSolucion
		  

	  	</td>
	  </tr>

	  <tr>

	  	<td width="266" align="justify">

		<h3>Total del servicio sin IVA:</h3>

	  	</td>

		<td width="266" align="center">

			<h4>$ $totalServicio</h4>
  
		</td>
	  </tr>

	  <tr>

	  	<td width="540" align="justify">

		<b>IMPORTANTE: USTED TIENE 10 DÍAS PARA RECOGER SU EQUIPO A PARTIR DE LA FECHA DE NOTA DE LO CONTRARIO NO NOS HACEMOS RESPONSABLES DE SU EQUIPO.NO SOMOS BODEGA COSTO $10 X DÍA. <br>
		1.– El servicio se paga hasta que se entregue su equipo.<br>
		2.– Garantía en servicio de 15 días, en cambio de piezas de acuerdo a proveedor.<br>
		3.– No nos hacemos responsables por problemas que no tengan que ver con lo reparado.<br>
		4.– Toda revisión  tiene un costo de $100 pesos.</b>

	  	</td>
	  </tr>

	  <tr>

			<td width="266" align="center">
					
				<div width="264"></div>
				<hr class="hrStyle">
				<br><b>Firma de conformidad cliente</b>

			</td>

			<td width="266" align="center">
			
				<div width="264"></div>
				<hr class="hrStyle">
				<br><b>Firma de conformidad técnico</b>

			</td>

	  </tr>			

	</table>
EOF;

		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');

		$htmlCopy = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
		<style>
			h3 {
				color: #000;
				font-family: times;
				font-size: 11pt;
				text-decoration: underline;
			}
			p.first {
				color: #003300;
				font-family: helvetica;
				font-size: 12pt;
			}
			p.first span {
				color: #006600;
				font-style: italic;
			}
			p#second {
				color: #CC0000;
				font-family: times;
				font-size: 12pt;
				text-align: justify;
			}
			p#second > span {
				background-color: #fff;
			}
			table.first {
				color: #003300;
				font-family: helvetica;
				font-size: 8pt;
				border-left: 3px solid red;
				border-right: 3px solid #CC0000;
				border-top: 3px solid red;
				border-bottom: 3px solid red;
				background-color: #fff;
			}
			td {
				border: 2px solid #ff4f30;
				background-color: #fff;
			}
			td.second {
				border: 2px dashed green;
			}
			div.test {
				color: #CC0000;
				background-color: #FFFF66;
				font-family: helvetica;
				font-size: 10pt;
				border-style: solid solid solid solid;
				border-width: 2px 2px 2px 2px;
				border-color: green #FF00FF #ff4f30 red;
				text-align: center;
			}
			.lowercase {
				text-transform: lowercase;
			}
			.uppercase {
				text-transform: uppercase;
			}
			.capitalize {
				text-transform: capitalize;
				text-align:center;
			}
			.img {

				width:65px;
			}
			.folio{

				color: red;
				font-size:10px;
			}
			.estatus{

				color:#930000;

			}
			.hrStyle{
				width:200px;
			}
		</style>		

		<table class="first" cellpadding="4" cellspacing="6">

		<tr>
			<td width="540" align="center"><b>Nota de servicio</b></td>
	   </tr>

	   <tr>
	   <td width="130" align="center">

	   <img class="img" src="images/logo-negro2.png">
	   
	   </td>
	   <td width="130" align="center">
			
	   		&nbsp;	
			
	   		<br>

	   		<b>León Gto, México

	   		<br>
	   		Dirección: Blvd. Vicente Valtierra #2703 Col. San Manuel</b>
	   
	   </td>
	   <td width="130" align="center">
	   &nbsp;
	   <br>
	   	<b>
		   Teléfonos: (477) 3112875 o Whatsapp:; 4776632304
		   
		   <br>
		   Email: soporte_hell@hotmail.com	   
	   </b>
	   
	   </td>

	   <td width="130" align="center">
	   	<b class="folio">
		   NO. FOLIO $respuestaServicio[folio]
		</b>

		<br>

		<b class="estatus">
			$estatus
	 	</b>

		 <br>

	   	<b>
		  Horarios L-V 10 am - 7 pm, Sab 10 am- 4 pm horario corrido
	   </b>
	   
	   </td>
	  </tr>

	  <tr>

	  <td width="266" align="center">

	   	<b>
		   Cliente: $respuestaServicio[cliente], Tel: $respuestaServicio[telefono]
		</b>

		<br>

		<b>
			Vendedor: $respuestaVendedor[nombre]
		</b>
	   
	   </td>
	   <td width="266" align="center">

	   	<b>
		   Fecha de llegada: $fechaLlegada
		</b>

		<br>

			 $impFechaEntrega
	   
	   </td>
	  </tr>



	  <tr>

	  	<td width="540" align="justify">

		<h3>Detalles</h3>

		  Equipo: $respuestaServicio[equipo], Marca: $respuestaServicio[marca], Procesador: $respuestaServicio[procesador], RAM: $respuestaServicio[ram], HDD: $respuestaServicio[dd], SSD: $respuestaServicio[ssd], SO: $respuestaServicio[so]

		  <br>Falla: $respuestaServicio[falla]
			
		  <br>Notas: $respuestaServicio[obs]. Contraseña del equipo: $respuestaServicio[contrasena], Entrega de cargador: $respuestaServicio[cargador]
		  <br>$impSolucion
		  

	  	</td>
	  </tr>

	  <tr>

	  	<td width="266" align="justify">

		<h3>Total del servicio sin IVA:</h3>

	  	</td>

		<td width="266" align="center">

			<h4>$ $totalServicio</h4>
  
		</td>
	  </tr>

	  <tr>

	  	<td width="540" align="justify">

		<b>IMPORTANTE: USTED TIENE 10 DÍAS PARA RECOGER SU EQUIPO A PARTIR DE LA FECHA DE NOTA DE LO CONTRARIO NO NOS HACEMOS RESPONSABLES DE SU EQUIPO.NO SOMOS BODEGA COSTO $10 X DÍA. <br>
		1.– El servicio se paga hasta que se entregue su equipo.<br>
		2.– Garantía en servicio de 15 días, en cambio de piezas de acuerdo a proveedor.<br>
		3.– No nos hacemos responsables por problemas que no tengan que ver con lo reparado.<br>
		4.– Toda revisión  tiene un costo de $100 pesos.</b>

	  	</td>
	  </tr>

		<tr>

			<td width="266" align="center">
					
				<div width="264"></div>
				<hr class="hrStyle">
				<br><b>Firma de conformidad cliente</b>

			</td>

			<td width="266" align="center">
			
				<div width="264"></div>
				<hr class="hrStyle">
				<br><b>Firma de conformidad técnico</b>

			</td>

		</tr>				
	</table>
		
EOF;

		// output the HTML content
		$pdf->writeHTML($htmlCopy, true, false, true, false, '');


		// ---------------------------------------------------------
		//SALIDA DEL ARCHIVO 

		//$pdf->Output('factura.pdf', 'D');
		$pdf->Output('servicio.pdf');
	}
}

$factura = new imprimirFactura();
$factura->codigo = $_GET["codigo"];
$factura->traerImpresionFactura();
