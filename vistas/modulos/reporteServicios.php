<?php

if ($_SESSION["perfil"] == "Vendedor") {

    echo '<script>

    window.location = "inicio";

  </script>';

    return;
}

?>

<div class="content-wrapper">

    <section class="content-header">

        <h1>

            Reporte de servicios

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Reporte de servicios</li>

        </ol>

    </section>

    <section class="content">

        <div class="row">

            <div class="col-md-12">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">General</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <?php

                    if (isset($_GET["fechaInicial"])) {

                        $fechaInicial = $_GET["fechaInicial"];
                        $fechaFinal = $_GET["fechaFinal"];
                    } else {

                        $fechaInicial = null;
                        $fechaFinal = null;
                    }

                    $respuesta = ControladorServicios::ctrRangoFechasReporteServiciosGral($fechaInicial, $fechaFinal);

                    ?>
                    <div class="box-body no-padding" style="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="info-box bg-yellow">
                                    <span class="info-box-icon"><i class="fa fa-usd"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text">Total de servicios MXN</span>
                                        <span class="info-box-number"><?php echo "$" . number_format($respuesta["totalServicio"], 2); ?></span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                            </div>

                            <div class="col-md-6">

                                <div class="info-box bg-green">
                                    <span class="info-box-icon"><i class="fa fa-dot-circle-o"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text">Número de servicios entregados</span>
                                        <span class="info-box-number"><?php echo $respuesta["totalNoServicios"]; ?></span>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <!--=====================================
GRÁFICO DE VENTAS
======================================-->


                                <div class="box box-solid bg-teal-gradient">

                                    <div class="box-header">

                                        <i class="fa fa-th"></i>

                                        <h3 class="box-title">Gráfico de servicios</h3>

                                    </div>

                                    <div class="box-body border-radius-none nuevoGraficoVentas">

                                        <div class="chart" id="line-chart-ventas" style="height: 250px;"></div>

                                    </div>

                                </div>

                                <?php

                                error_reporting(0);

                                if (isset($_GET["fechaInicial"])) {

                                    $fechaInicial = $_GET["fechaInicial"];
                                    $fechaFinal = $_GET["fechaFinal"];
                                } else {

                                    $fechaInicial = null;
                                    $fechaFinal = null;
                                }

                                $respuesta = ControladorServicios::ctrRangoFechasServiciosGrafica($fechaInicial, $fechaFinal);

                                $arrayFechas = array();
                                $arrayVentas = array();
                                $sumaPagosMes = array();

                                foreach ($respuesta as $key => $value) {

                                    #Capturamos sólo el año y el mes
                                    $fecha = substr($value["fecha_entrega"], 0, 10);

                                    // var_dump($fecha);

                                    #Introducir las fechas en arrayFechas
                                    array_push($arrayFechas, $fecha);

                                    #Capturamos las ventas
                                    $arrayVentas = array($fecha => $value["total"]);

                                    #Sumamos los pagos que ocurrieron el mismo mes
                                    foreach ($arrayVentas as $key => $value) {

                                        $sumaPagosMes[$key] += $value;
                                    }
                                }


                                $noRepetirFechas = array_unique($arrayFechas);


                                ?>

                                <script>
                                    var line = new Morris.Line({
                                        element: 'line-chart-ventas',
                                        resize: true,
                                        data: [

                                            <?php

                                            if ($noRepetirFechas != null) {

                                                foreach ($noRepetirFechas as $key) {

                                                    echo "{ y: '" . $key . "', ventas: " . $sumaPagosMes[$key] . " },";
                                                }

                                                echo "{y: '" . $key . "', ventas: " . $sumaPagosMes[$key] . " }";
                                            } else {

                                                echo "{ y: '0', ventas: '0' }";
                                            }

                                            ?>

                                        ],
                                        xkey: 'y',
                                        ykeys: ['ventas'],
                                        labels: ['ventas'],
                                        lineColors: ['#efefef'],
                                        lineWidth: 2,
                                        hideHover: 'auto',
                                        gridTextColor: '#fff',
                                        gridStrokeWidth: 0.4,
                                        pointSize: 4,
                                        pointStrokeColors: ['#efefef'],
                                        gridLineColor: '#efefef',
                                        gridTextFamily: 'Open Sans',
                                        preUnits: '$',
                                        gridTextSize: 10
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php


        ?>
    </section>
    <section class="content">

        <div class="box">

            <div class="box-header with-border">

                <button type="button" class="btn btn-danger pull-left" id="daterangeReporteServicio-btn">

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

                            <th style="width:5px">#</th>
                            <th width="1%">Folio</th>
                            <th width="1%">Fecha llegada</th>
                            <th width="10%">Cliente</th>
                            <th width="10%">Empleado</th>
                            <th width="10%">Equipo</th>
                            <th style="width:150px">Falla</th>
                            <th width="10%">$ Total</th>
                            <th width="1%">Estatus</th>
                            <th width="10%">Acciones</th>

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

                        $respuesta = ControladorServicios::ctrRangoFechasReporteServicios($fechaInicial, $fechaFinal);

                        foreach ($respuesta as $key => $value) {

                            $fechaLlegada =  date("d-m-Y", strtotime($value["fecha_llegada"]));

                            echo ' <tr>

                                    <td>' . ($key + 1) . '</td>

                                    <td class="text-uppercase">' . $value["folio"] . '</td>

                                    <td class="text-uppercase">' . $fechaLlegada . '</td>';

                            echo '<td class="text-uppercase">' . $value["cliente"] . '</td>';

                            $itemEmpleado = "id";
                            $valorEmpleado = $value["id_empleado"];

                            $respuestaEmpleado = ControladorUsuarios::ctrMostrarUsuarios($itemEmpleado, $valorEmpleado);

                            echo '<td class="text-uppercase">' . $respuestaEmpleado["nombre"] . '</td>';

                            echo '<td class="text-uppercase">' . $value["equipo"] . '</td>
                                  <td class="text-uppercase">' . $value["falla"] . '</td>
                                  <td class="text-uppercase"><b>$' . number_format($value["total"], 2). '</b></td>';
                            if ($value["estatus"] == 1) {

                                echo '<td class="text-uppercase"><button class="btn btn-primary">Abierto</button></td>';
                            } else if ($value["estatus"] == 2) {

                                echo '<td class="text-uppercase"><button class="btn btn-warning">En proceso (Trabajando)</button></td>';
                            } else if ($value["estatus"] == 3) {

                                echo '<td class="text-uppercase"><button class="btn btn-info">Terminado</button></td>';
                            } else if ($value["estatus"] == 4) {

                                echo '<td class="text-uppercase"><button class="btn btn-default">Suspendido</button></td>';
                            } else if ($value["estatus"] == 5) {

                                echo '<td class="text-uppercase"><button class="btn btn-danger">Cancelado</button></td>';
                            } else if ($value["estatus"] == 6) {

                                echo '<td class="text-uppercase"><button class="btn btn-success">Entregado</button></td>';
                            }

                            echo '<td>

                                 <div class="btn-group">
    
                                <button class="btn btn-info btnImprimirServcio" codigoServicio="' . $value["id"] . '"><i class="fa fa-print"></i>
                                </button>';

                            echo '</div>  

                                </td>

                                </tr>';
                        }

                        ?>

                    </tbody>

                </table>

            </div>

        </div>

    </section>

</div>