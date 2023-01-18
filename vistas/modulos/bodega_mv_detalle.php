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

            Administrar movimientos de productos

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Administrar movimientos de productos</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">
            <!-- 
            <div class="box-header with-border">

                <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarProducto">

                    Agregar producto

                </button>

            </div> -->

            <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

                    <thead>

                        <tr>
                            <th style="width:10px">#</th>
                            <th>Cantidad llegadas</th>
                            <th>Cantidad</th>
                            <th>Tipo movimiento</th>
                            <th>Fecha del movimiento</th>
                            <th>Usuario</th>
                            <!-- <th>Acciones</th> -->

                        </tr>

                    </thead>
                    <tbody>

                        <?php


                        $idBodega = $_GET["idBodega"];

                        $mov = ControladorProductos::ctrVerHistorialBodega($idBodega);

                        foreach ($mov as $key => $value) {

                            echo '<tr>
                                    <td>' . ($key + 1) . '</td>
                                    <td><button class="btn btn-info">' . $value["cantidadLlegadas"] . '</button></td>
                                    <td><button class="btn btn-primary">' . $value["cantidad"] . '</button></td>';

                            switch ($value["tipo_movimiento"]) {

                                case 1:
                                    $tipo = "<button class='btn btn-success'>Entrada a bodega</button>";
                                    break;
                                case 0:
                                    $tipo = "<button class='btn btn-info'>Salida a tienda</button>";
                                    break;
                            }
                            echo '<td>' . $tipo . '</td>
                                    <td>' . $value["fecha_mov"] . '</td>';

                            $itemUsuario = "id";
                            $valorUsuario = $value["id_usuario"];

                            $respuestaUsuario = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);

                            echo '<td>' . $respuestaUsuario["nombre"] . '</td>';
                            // <td><button class="btn btn-warning btnEditarMov" idMov="' . $value["id"] . '"><i class="fa fa-pencil"></i></button><button class="btn btn-danger btnEliminarMov" idMov="' . $value["id"] . '"><i class="fa fa-times"></i></button></td>
                            echo '</tr>';
                        }
                        ?>

                    </tbody>

                </table>

            </div>

        </div>

    </section>

</div>

<!--=====================================
MODAL Agregar mov bodega
======================================-->

<div id="modalMovBodega" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post" enctype="multipart/form-data">

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Editar movimiento a bodega</h4>

                </div>

                <div class="modal-body">

                    <div class="box-body">

                        <!-- ENTRADA DEL ID DEL PRODUCTO -->

                        <input type="number" class="form-control input-lg hidden" name="idProductoMov" id="idProductoMov" hidden>

                        <!-- ENTRADA DEL ID DE LA BODEGA -->

                        <input type="number" class="form-control input-lg hidden" name="idBodegaMov" id="idBodegaMov" hidden>

                        <!-- ENTRADA DEL USUARIO -->

                        <input type="hidden" name="idUsuario" value="<?php echo $_SESSION["id"]; ?>">

                        <!-- ENTRADA PARA FECHA LLEGADA -->

                        <div class="form-group col-md-6">

                            <label for="">Tipo de movimiento</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <select class="form-control input-lg" id="tipoMov" name="tipoMov" required>

                                    <option value="">Selecciona</option>
                                    <option value="1">Entrada a bodega</option>
                                    <option value="0">Salida a tienda</option>

                                </select>

                            </div>

                        </div>

                        <!-- ENTRADA PARA FECHA LLEGADA -->

                        <div class="form-group col-md-6">

                            <label for="">Cantidad</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="number" class="form-control input-lg" min="0" name="cantidadMov" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA FECHA LLEGADA -->

                        <div class="form-group col-md-12">

                            <label for="">Descripción</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control input-lg" name="descripcionMov" id="" cols="2" rows="2"></textarea>

                            </div>

                        </div>

                    </div>

                </div>

                <!--=====================================
        PIE DEL MODAL
        ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                    <button type="submit" class="btn btn-primary">Guardar</button>

                </div>

            </form>

            <?php

            $movBodega = new ControladorProductos();
            $movBodega->ctrMovBodega();

            ?>

        </div>

    </div>

</div>