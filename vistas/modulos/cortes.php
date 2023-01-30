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

      Administración de cortes

    </h1>

    <ol class="breadcrumb">

      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Administración de cortes</li>

    </ol>

  </section>

  <section class="content">

    <div class="box">

      <?php

      $item = "estatus";
      $valor = 1;

      $estatusCaja = ControladorCajas::ctrMostrarCajas($item, $valor);

      $estatusCierre = ControladorCierreCortes::ctrMostrarCierreCortes($item, $valor);

      if ($estatusCaja == true && $estatusCierre == false) {

      ?>
        <div class="box-header with-border">

          <button class="btn btn-primary btnAgregaIdCaja" data-toggle="modal" data-target="#modalAbrirCaja">

            <span class="fa fa-unlock"></span>

          </button>

        </div>

      <?php

      } else if ($estatusCierre == true) {

      ?>

        <div class="box-header with-border">

          <button class="btn btn-warning btnCerrarCaja" data-toggle="modal" data-target="#modalCerrarCaja">

            <span class="fa fa-lock"></span>

          </button>

        </div>

      <?php

      }

      ?>

      <div class="box-body">

        <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

          <thead>

            <tr>

              <th style="width:10px">#</th>
              <th>Monto inicial</th>
              <th>Monto final</th>
              <th>Monto Total</th>
              <th>Fecha apertura</th>
              <th>Fecha cierre</th>
              <th>Total de ventas</th>
              <th>Total de servicios</th>
              <th>Estatus</th>
              <th>Acciones</th>

            </tr>

          </thead>

          <tbody>

            <?php

            $item = null;
            $valor = null;

            $cierres = ControladorCierreCortes::ctrMostrarCierreCortes($item, $valor);

            foreach ($cierres as $key => $value) {

              echo ' <tr>

                    <td>' . ($key + 1) . '

                    <td class="text-uppercase">$' . number_format($value["monto_inicial"], 2) . '</td>';

              if ($value["monto_final"] == "" && $value["monto_total"] == "") {

                echo '<td class="text-uppercase">$0.00</td>
                      <td class="text-uppercase">$0.00</td>';
              } else {

                echo '<td class="text-uppercase">$' . number_format($value["monto_final"], 2) . '</td>
                      <td class="text-uppercase">$' . number_format($value["monto_total"], 2) . '</td>';
              }


              echo '<td class="text-uppercase">' . $value["fecha_apertura"] . '</td>';

              if ($value["fecha_cierre"] == "") {

                echo '<td class="text-uppercase"><span class="label label-warning">Caja activa</span></td>';
              } else {

                echo '<td class="text-uppercase">' . $value["fecha_cierre"] . '</td>';
              }


              echo '<td class="text-uppercase">' . $value["total_ventas"] . '</td>';

              echo '<td class="text-uppercase">' . $value["total_servicios"] . '</td>';

              if ($value["estatus"] == 1) {

                echo '<td class="text-uppercase"><span class="label label-success">Caja abierta</span></td>';
              } else {

                echo '<td class="text-uppercase"><span class="label label-danger">Caja cerrada</span></td>';
              }

              echo '<td>

                      <div class="btn-group">';

              if ($_SESSION["perfil"] == "Administrador") {

                if ($value["estatus"] != 1) {

                  echo '<button class="btn btn-primary btnVerDetalleCierreCaja" idCaja="' . $value["id_caja"] . '" data-toggle="modal" data-target="#modalDetalleCaja"><i class="fa fa-search"></i></button>

                  <button class="btn btn-info btnImprimirCorte" idCaja="' . $value["id_caja"] . '"><i class="fa fa-print"></i>
                  </button>';

                } else {

                  echo '<button class="btn btn-default"><i class="fa fa-search"></i></button>';
                }
              }

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

<!--=====================================
MODAL AGREGAR CAJA
======================================-->

<div id="modalAbrirCaja" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Abrir caja</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA IDCAJA -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-dropbox"></i></span>

                <input type="text" class="form-control input-lg" name="nombreCaja" id="nombreCaja" placeholder="Caja Asignada" readonly>
                <input type="hidden" name="idCaja" id="idCaja">

              </div>

            </div>

            <!-- ENTRADA PARA EL MONTO -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-money"></i></span>

                <input type="number" step="any" class="form-control input-lg" name="nuevoMonto" placeholder="Ingresar monto" required>

              </div>

            </div>

          </div>

        </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Abrir caja</button>

        </div>

        <?php

        $abrirCorte = new ControladorCierreCortes();
        $abrirCorte->ctrCrearCajaCorte();

        ?>

      </form>

    </div>

  </div>

</div>

<!--=====================================
MODAL CERRAR CAJA
======================================-->

<div id="modalCerrarCaja" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Cerrar caja</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA MONTO INICIAL -->

            <div class="form-group">

              <label for=""> Monto inicial</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                <input type="number" class="form-control input-lg" name="montoInicial" id="montoInicial" required readonly>

                <input type="hidden" name="idCajaCierre" id="idCajaCierre" required>

              </div>

            </div>

            <!-- ENTRADA PARA MONTO FINAL -->

            <div class="form-group">

              <label for=""> Monto final</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                <input type="number" class="form-control input-lg" name="montoFinal" id="montoFinal" required readonly>

              </div>

            </div>

            <!-- ENTRADA PARA TOTAL VENTAS -->

            <div class="form-group">

              <label for=""> Total ventas</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-shopping-cart"></i></span>

                <input type="number" class="form-control input-lg" name="totalVentas" id="totalVentas" required readonly>

              </div>

            </div>

            <!-- ENTRADA PARA TOTAL SERVICIOS -->

            <div class="form-group">

              <label for=""> Servicios</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-cogs"></i></span>

                <input type="number" class="form-control input-lg" name="totalServicios" id="totalServicios" required readonly>

              </div>

            </div>

            <!-- ENTRADA PARA MONTO GENERAL -->

            <div class="form-group">

              <label for=""> Monto general</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                <input type="number" class="form-control input-lg" name="montoGeneral" id="montoGeneral" required readonly>

              </div>

            </div>

          </div>

        </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Cerrar caja</button>

        </div>

        <?php

        // $cerrarCaja = new ControladorCierreCortes();
        // $cerrarCaja->ctrCrearCierreCaja();

        ?>

      </form>

    </div>

  </div>

</div>
<!--=====================================
MODAL VER DETALLE CORTE
======================================-->

<div id="modalDetalleCaja" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <!-- <form role="form" method="post"> -->

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#ffca28; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Detalle caja</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <div class="tableVentas"></div>

          </div>

        </div>


        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <!-- <button type="submit" class="btn btn-primary">Cerrar caja</button> -->

        </div>

        <?php

        $cerrarCaja = new ControladorCierreCortes();
        $cerrarCaja->ctrCrearCierreCaja();

        ?>

      <!-- </form> -->

    </div>

  </div>

</div>