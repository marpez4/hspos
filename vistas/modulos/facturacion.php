<script src="extra/FacturamaJs/facturama.api.js"></script>
<!-- <script src="/hspos/extra/FacturamaJs/facturama.api.js"></script> -->
<!-- <script src="/ext/hspos/extra/Facturama/facturama.api.multiemisor.js"></script> -->

<?php


if ($_SESSION["perfil"] == "Vendedor") {

    echo '<script>

    window.location = "inicio";

  </script>';

    return;
}

?>

<script>
    // window.facturama().facturama;
</script>

<div class="content-wrapper">

    <section class="content-header">

        <h1>

            Facturas

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Facturas</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">

                <button type="button" class="btn btn-default pull-right" id="daterangeFact-btn">

                    <span>
                        <i class="fa fa-calendar"></i>

                        <?php

                        if (isset($_GET["fechaInicial"])) {

                            echo $_GET["fechaInicial"] . " - " . $_GET["fechaFinal"];
                        } else {

                            echo 'Rango de fecha';
                        }

                        ?>
                    </span>

                    <i class="fa fa-caret-down"></i>

                </button>

            </div>

            <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

                    <thead>

                        <tr>

                            <th style="width:10px">#</th>
                            <th>Folio</th>
                            <th>Id Factura</th>
                            <th>Nombre</th>
                            <th>Fecha</th>
                            <th>Estatus</th>
                            <th>Acciones</th>

                        </tr>

                    </thead>

                    <tbody>

                        <?php

                        if (isset($_GET["fechaInicial"])) {

                            $fechaInicial = $_GET["fechaInicial"];
                            $fechaFinal = $_GET["fechaFinal"];
                        } else {

                            $fechaInicial = null;
                            $fechaFinal = null;
                        }

                        $facturas = ControladorFacturacion::ctrRangoFechasFacturas($fechaInicial, $fechaFinal);

                        foreach ($facturas as $key => $value) {

                            $id = $value["respuesta"];

                            echo ' <tr>

                    <td>' . ($key + 1) . '</td>

                    <td class="text-uppercase">' . $value["folio"] . '</td>
                    <td class="text-uppercase">' . $value["respuesta"] . '</td>';

                            $Itemfolio = "codigo";
                            $valorFolio = $value["folio"];

                            $venta = ControladorVentas::ctrMostrarVentas($Itemfolio, $valorFolio);

                            $idCliente = $venta["id_cliente"];
                            $itemCliente = "id";

                            $cliente = ControladorVentas::ctrMostrarClientes($itemCliente, $idCliente);

                            echo '<td class="text-uppercase">' . $cliente["nombre"] . '</td>
                    <td class="text-uppercase">' . $value["fecha"] . '</td>';

                            if ($value["estatus"] == 1) {

                                echo '<td class="text-uppercase"><small class="label bg-green">Emitida</small></td>';
                            } else {

                                echo '<td class="text-uppercase"><small class="label bg-red">Cancelada</small></td>';
                            }


                            echo '<td>

                      <div class="btn-group">
                          
                        <button class="btn btn-danger btnPdfFactura" data-toggle="modal" idFactura ="' . $value["respuesta"] . '">PDF</button>
                        <button class="btn btn-success btnXmlFactura" data-toggle="modal" idFacturaXml ="' . $value["respuesta"] . '">XML</button>
                        <button class="btn btn-primary btnEmailFactura" data-toggle="modal" email ="' . $cliente["email"] . '" idFacturaEmail ="' . $value["respuesta"] . '">@</button>';

                            if ($_SESSION["perfil"] == "Administrador") {

                                echo '<button class="btn btn-warning btnCancelarFactura" data-toggle="modal" data-target="#modalCancelarFactura" idFactura="' . $value["respuesta"] . '">Cancelar</button>';
                            }

                            echo '</div>  

                    </td>

                  </tr>';
                        }
                        require_once "/modals/modal-cancelarFactura.php"

                        ?>

                    </tbody>

                </table>

            </div>

        </div>

    </section>

</div>