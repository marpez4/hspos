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

      Administración de cajas

    </h1>

    <ol class="breadcrumb">

      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Administración de cajas</li>

    </ol>

  </section>

  <section class="content">

    <div class="box">

      <?php

      $item = "estatus";
      $valor = 1;

      $estatusCaja = ControladorCajas::ctrMostrarCajas($item, $valor);

      if ($estatusCaja == false) {

      ?>
        <div class="box-header with-border">

          <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarCaja">

          <span class="fa fa-unlock"></span>

          </button>

        </div>

      <?php

      } else {

      ?>

        <div class="box-header with-border">

          <button class="btn btn-danger" data-toggle="modal">

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
              <th>Nombre Caja</th>
              <th>Fecha Apertura</th>
              <th>Estatus</th>
              <th>Acciones</th>

            </tr>

          </thead>

          <tbody>

            <?php

            $item = null;
            $valor = null;

            $cajas = ControladorCajas::ctrMostrarCajas($item, $valor);

            foreach ($cajas as $key => $value) {

              echo ' <tr>

                    <td>' . ($key + 1) . '</td>

                    <td class="text-uppercase">' . $value["nombre"] . '</td>
                    <td class="text-uppercase">' . $value["fecha_apertura"] . '</td>';
              if ($value["estatus"] == 1) {

                echo '<td class="text-uppercase"><span class="label label-success">Caja abierta</span></td>';
              } else {

                echo '<td class="text-uppercase"><span class="label label-danger">Caja cerrada</span></td>';
              }

              echo '<td>

                      <div class="btn-group">
                          
                        <button class="btn btn-warning btnEditarCaja" idCaja="' . $value["id"] . '" data-toggle="modal" data-target="#modalEditarCaja"><i class="fa fa-pencil"></i></button>';

              // if($_SESSION["perfil"] == "Administrador"){

              //   echo '<button class="btn btn-danger btnEliminarCategoria" idCategoria="'.$value["id"].'"><i class="fa fa-times"></i></button>';

              // }

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
MODAL AGREGAR CATEGORÍA
======================================-->

<div id="modalAgregarCaja" class="modal fade" role="dialog">

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

            <!-- ENTRADA PARA EL NOMBRE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoNombre" placeholder="Ingresar nombre de la caja" required>

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

        $crearCaja = new ControladorCajas();
        $crearCaja->ctrCrearCajas();

        ?>

      </form>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR CAJA
======================================-->

<div id="modalEditarCaja" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar nombre de la caja</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                <input type="text" class="form-control input-lg" name="editarNombre" id="editarNombre" required>

                <input type="hidden" name="idCaja" id="idCaja" required>

              </div>

            </div>

          </div>

        </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar cambios</button>

        </div>

        <?php

        $editarCaja = new ControladorCajas();
        $editarCaja->ctrEditarCaja();

        ?>

      </form>

    </div>

  </div>

</div>

<?php

// $borrarCategoria = new ControladorCategorias();
// $borrarCategoria -> ctrBorrarCategoria();

?>