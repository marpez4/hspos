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

            Administrar envíos de paquetería

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Administrar envíos de paquetería</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">

                <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarPedidoPaqueteria">

                    Agregar envío

                </button>

            </div>

            <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

                    <thead>

                        <tr>

                            <th style="width:10px">#</th>
                            <th>Nombre cliente</th>
                            <th>Calle</th>
                            <th>CP</th>
                            <th>Colonia</th>
                            <th>Ciudad</th>
                            <th>Estado</th>
                            <th>Teléfono</th>
                            <th>Estatus</th>
                            <th>Acciones</th>

                        </tr>

                    </thead>

                    <tbody>

                        <?php

                        $item = null;
                        $valor = null;

                        $pedidosP = ControladorPedidosPaqueteria::ctrMostrarPaqueteria($item, $valor);

                        foreach ($pedidosP as $key => $value) {

                            echo ' <tr>

                    <td>' . ($key + 1) . '</td>

                    <td class="text-uppercase">' . $value["nombreCompleto"] . '</td>
                    <td class="text-uppercase">' . $value["calle"] . '</td>
                    <td class="text-uppercase">' . $value["cp"] . '</td>
                    <td class="text-uppercase">' . $value["colonia"] . '</td>
                    <td class="text-uppercase">' . $value["idCiudad"] . '</td>
                    <td class="text-uppercase">' . $value["idEstado"] . '</td>
                    <td class="text-uppercase">' . $value["telefono"] . '</td>';

                            switch ($value["estatus"]) {

                                case 1:
                                    $estatus = "Recibido";
                                    $color = "primary";
                                    break;
                                case 2:
                                    $estatus = "Empaquetado";
                                    $color = "warning";
                                    break;
                                case 3:
                                    $estatus = "Enviado";
                                    $color = "info";
                                    break;
                                case 4:
                                    $estatus = "Entregado";
                                    $color = "success";
                                    break;
                                case 5:
                                    $estatus = "Terminado";
                                    $color = "danger";
                                    break;
                            }


                            echo '<td class="text-uppercase">
                    
                        <div class="btn-group">
                            <button type="button" class="btn btn-' . $color . ' dropdown-toggle" data-toggle="dropdown">
                            ' . $estatus . ' <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" class="actionEstatus" estatus="1" idPedidoPaqueteria="' . $value["id"] . '" usuario="' . $_SESSION["usuario"] . '">Recibido</a></li>
                                <li><a href="#" class="actionEstatus" estatus="2" idPedidoPaqueteria="' . $value["id"] . '" usuario="' . $_SESSION["usuario"] . '">Empaquetado</a></li>
                                <li><a href="#" class="actionEstatus" estatus="3" idPedidoPaqueteria="' . $value["id"] . '" usuario="' . $_SESSION["usuario"] . '">Enviado</a></li>
                                <li><a href="#" class="actionEstatus" estatus="4" idPedidoPaqueteria="' . $value["id"] . '" usuario="' . $_SESSION["usuario"] . '">Entregado</a></li>
                                <li><a href="#" class="actionEstatus" estatus="5" idPedidoPaqueteria="' . $value["id"] . '" usuario="' . $_SESSION["usuario"] . '">Terminado</a></li>
                                <li class="divider"></li>
                                <li><a href="#" class="verHistorial" data-toggle="modal" data-target="#modalVerHistorialPaq" idPedidoPaqueteria="' . $value["id"] . '">Historial</a></li>
                            </ul>
                        </div>
                    
                    </td>

                    <td>

                      <div class="btn-group">

                        <button class="btn btn-info btnImprimirPaqueteria" codigoPaqueteria="' . $value["id"] . '"><i class="fa fa-print"></i>
                         </button>
                          
                        <button class="btn btn-warning btnEditarPedidoPaqueteria" idPedidoPaqueteria="' . $value["id"] . '" data-toggle="modal" data-target="#modalEditarPedidoPaqueteria"><i class="fa fa-pencil"></i></button>';

                            if ($_SESSION["perfil"] == "Administrador") {

                                echo '<button class="btn btn-danger btnEliminaPedidoPaqueteria" idPedidoPaqueteria="' . $value["id"] . '"><i class="fa fa-times"></i></button>';
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
MODAL AGREGAR CATEGORÍA
======================================-->

<div id="modalAgregarPedidoPaqueteria" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Agregar Pedido Paqueteria</h4>

                </div>

                <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <!-- ENTRADA PARA EL NOMBRE -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoNombre" placeholder="Ingresar Nombre completo" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CALLE -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaCalle" placeholder="Ingresar Calle" required>

                            </div>

                        </div>


                        <!-- ENTRADA PARA EL COLONIA -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon glyphicon-road"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaColonia" placeholder="Ingresar Colonia" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CP -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon glyphicon-inbox"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoCp" placeholder="Ingresar CP" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CIUDAD -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-bookmark"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaCiudad" placeholder="Ingresar Ciudad" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL ESTADO -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-flag"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoEstado" placeholder="Ingresar Estado" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL TELEFONO -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoTelefono" placeholder="Ingresar teléfono" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL ENTRE CALLES -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-sort"></i></span>

                                <textarea class="form-control input-lg" id="" rows="2" placeholder="Ingresar entre que calles" name="nuevaCalles" required></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL REFERENCIAS -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>

                                <textarea class="form-control input-lg" id="" rows="2" placeholder="Ingresar referencias" name="nuevaReferencia" required></textarea>

                            </div>

                        </div>

                    </div>

                </div>

                <!--=====================================
        PIE DEL MODAL
        ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                    <button type="submit" class="btn btn-primary">Guardar pedido</button>

                </div>

                <?php

                $crearPedido = new ControladorPedidosPaqueteria();
                $crearPedido->ctrCrearPaqueteria();

                ?>

            </form>

        </div>

    </div>

</div>

<!--=====================================
MODAL EDITAR CATEGORÍA
======================================-->

<div id="modalEditarPedidoPaqueteria" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Editar Pedido Paqueteria</h4>

                </div>

                <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <!-- ENTRADA PARA EL NOMBRE -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                                <input type="text" class="form-control input-lg" name="editarNombre" id="editarNombre" placeholder="Ingresar Nombre completo" required>

                                <input type="hidden" name="idPedidoPaqueteria" id="idPedidoPaqueteria" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CALLE -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>

                                <input type="text" class="form-control input-lg" name="editarCalle" id="editarCalle" placeholder="Ingresar Calle" required>

                            </div>

                        </div>


                        <!-- ENTRADA PARA EL COLONIA -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon glyphicon-road"></i></span>

                                <input type="text" class="form-control input-lg" name="editarColonia" id="editarColonia" placeholder="Ingresar Colonia" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CP -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon glyphicon-inbox"></i></span>

                                <input type="text" class="form-control input-lg" name="editarCp" id="editarCp" placeholder="Ingresar CP" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CIUDAD -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-bookmark"></i></span>

                                <input type="text" class="form-control input-lg" name="editarCiudad" id="editarCiudad" placeholder="Ingresar Ciudad" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL ESTADO -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-flag"></i></span>

                                <input type="text" class="form-control input-lg" name="editarEstado" id="editarEstado" placeholder="Ingresar Estado" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL TELEFONO -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>

                                <input type="text" class="form-control input-lg" name="editarTelefono" id="editarTelefono" placeholder="Ingresar teléfono" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL ENTRE CALLES -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-sort"></i></span>

                                <textarea class="form-control input-lg" rows="3" placeholder="Entre calles" name="editarCalles" id="editarCalles"></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL REFERENCIAS -->

                        <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>

                                <textarea class="form-control input-lg" rows="2" name="editarReferencia" id="editarReferencia" required></textarea>

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

                $editarPedidoPaqueteria = new ControladorPedidosPaqueteria();
                $editarPedidoPaqueteria->ctrEditarPedidoPaqueteria();

                ?>

            </form>

        </div>

    </div>

</div>

<?php

$borrarPedidoPaqueteria = new ControladorPedidosPaqueteria();
$borrarPedidoPaqueteria->ctrBorrarPedidoPaqueteria();

?>

<!--=====================================
MODAL AGREGAR CATEGORÍA
======================================-->

<div id="modalVerHistorialPaq" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Historial de movimientos del paquete</h4>

                </div>

                <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <div class="tableHistorial"></div>

                    </div>

                </div>

                <!--=====================================
        PIE DEL MODAL
        ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                </div>

            </form>

        </div>

    </div>

</div>