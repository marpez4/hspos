<?php
require __DIR__ . '/../vendor/autoload.php';

require_once "../../controladores/ventas.controlador.php";
require_once "../../modelos/ventas.modelo.php";

require_once "../../controladores/clientes.controlador.php";
require_once "../../modelos/clientes.modelo.php";

require_once "../../controladores/usuarios.controlador.php";
require_once "../../modelos/usuarios.modelo.php";

require_once "../../controladores/productos.controlador.php";
require_once "../../modelos/productos.modelo.php";



$mpdf = new \Mpdf\Mpdf();

// public $codigo;

$itemVenta = "codigo";
// $valorVenta = $this->codigo;
$valorVenta = 10001;

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

// Configurar la imagen de fondo
$mpdf->SetWatermarkImage('imgs/cartaVenta2.jpg');
$mpdf->showWatermarkImage = true;

$html = '
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 8px;
        text-align: left;
        font-size: 12px;
    }
    th {
        background-color: #f2f2f2;
        color: black;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:nth-child(odd) {
        background-color: #ffffff;
    }
</style>

<br>
<br>
<br>
<div style="text-align:right;">
    <h3>León, Guanajuato a ' . $diaExPr . ' de ' . $mesExPr . ' de ' . $añoExPr . '</h3>
</div>

<div style="text-align:right;">
<h2><u>Sr.(a) ' . $nombreCliente . ' </u></h2>
</div>

<br>

<table>
    <tr>
        <th>POSICIÓN (PARTIDA)</th>
        <th>CANTIDAD</th>
        <th>DESCRIPCIÓN CORTA DE LOS PRODUCTOS PROPUESTOS POR LA EMPRESA MARCA Y MODELO</th>
        <th>IMPORTE NETO UNITARIO (SIN IVA)</th>
        <th>IMPORTE NETO TOTAL (SIN IVA)</th>
    </tr>';
$totalProductos = 0;
foreach ($productos as $key => $item) {
    $valorUnitario = number_format($item["precio"], 2);
    $precioTotal = number_format($item["subTotal"], 2);
    $partida = $key + 1;

    $totalProductos += $item["subTotal"];
    $totalProductos = number_format($totalProductos, 2);

    $html .= '<tr>
            <td>' . $partida . '</td>
            <td>' . $item["cantidad"] . '</td>
            <td>' . $item["descripcion"] . '</td>
            <td>$' . $valorUnitario . '</td>
            <td>$' . $precioTotal . '</td>
        </tr>
        ';
}
$html .= '<tr>
<td></td>
<td></td>
<td></td>
<td>TOTAL, SIN IVA</td>
<td>$' . $totalProductos . '</td>
</tr>';
$html .= '</table>';

$html .= '
<br>
<br>
<table style="border: 1px solid #666; padding:1px;">

			<tr style="font-size:8px;">

				<td>
					<b>Nota: Garantía 90 días con nosotros (15 días en accesorios), únicamente por defecto de fábrica, no aplican en: caídas, derrames de líquidos, descargas eléctricas, (Conecte a un regulador o no break forzosamente), sistema operativo, ni en la pila de laptop o cargador (Pila puede retener o no carga). En caso de devolución aplica un 20% del valor total de la compra. Nota válida para aplicar garantía sin excepciones, No nos hacemos responsables por daños de traslado o robos, garantía solamente aplica en equipos. (No nos hacemos responsables por daños de envió.) En equipos, monitores o accesorios con defecto no aplica ninguna garantía.</b>
				</td>

			</tr>
		</table>
';


// Agregar HTML al PDF
$mpdf->WriteHTML($html);

// Genera un archivo PDF directamente al navegador
$mpdf->Output();
