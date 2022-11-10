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

            Administrar servicios

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Administrar servicios</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">

                <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarCategoria">

                    Agregar servicio

                </button>

                <button type="button" class="btn btn-default pull-right" id="daterangeServicio-btn">

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
                            <th>Fecha llegada</th>
                            <th>Cliente</th>
                            <th>Empleado</th>
                            <th>Equipo</th>
                            <th>Falla</th>
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

                        $respuesta = ControladorServicios::ctrRangoFechasServicios($fechaInicial, $fechaFinal);

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
                                  <td class="text-uppercase">' . $value["falla"] . '</td>';
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
                                </button>
  
                                <button class="btn btn-warning btnEditarServicio" idServicio="' . $value["id"] . '" data-toggle="modal" data-target="#modalEditarServicio"><i class="fa fa-pencil"></i></button>';

                            if ($_SESSION["perfil"] == "Administrador") {

                                echo '<button class="btn btn-danger btnEliminarServicio" idServicio="' . $value["id"] . '"><i class="fa fa-times"></i></button>';
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
MODAL AGREGAR SERVICIO
======================================-->

<div id="modalAgregarCategoria" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Agregar Servicio</h4>

                </div>

                <!--=====================================
                CUERPO DEL MODAL
                ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <div class="form-group col-md-6">

                            <label for="">No. Folio</label>


                            <!-- NUMERO DE FOLIO -->

                            <?php

                            $item = null;
                            $valor = null;

                            $servicios = ControladorServicios::ctrMostrarServicios($item, $valor);

                            if (!$servicios) {

                                echo '<input type="text" class="form-control" id="nuevoFolio" name="nuevoFolio" value="10001" readonly>';
                            } else {

                                foreach ($servicios as $key => $value) {
                                }

                                $folio = $value["folio"] + 1;

                                echo '<input type="text" class="form-control" id="nuevoFolio" name="nuevoFolio" value="' . $folio . '" readonly>';
                            }


                            ?>

                        </div>

                        <!-- ENTRADA PARA FECHA LLEGADA -->

                        <div class="form-group col-md-12">

                            <label for="">Ingresar fecha de llegada</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="date" class="form-control input-lg" name="nuevaFechaLl" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA CLIENTE -->

                        <div class="form-group col-md-12">

                            <label for="">Ingresar nombre del cliente</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoCliente" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA EMPLEADO -->

                        <div class="form-group col-md-12">

                            <label for="">Nombre de empleado</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <!-- <input type="text" class="form-control" id="nuevoVendedor" value="<?php echo $_SESSION["nombre"]; ?>" readonly> -->

                                <!-- <input type="hidden" name="idVendedor" value="<?php echo $_SESSION["id"]; ?>"> -->

                                <select style="height: 100%; width: 100%" class="form-control chosen-select" id="nuevoEmpleado" name="nuevoEmpleado">

                                    <option value="">Seleccionar empleado</option>

                                    <?php

                                    $item = null;
                                    $valor = null;

                                    $empleado = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

                                    foreach ($empleado as $key => $value) {

                                        echo '<option value="' . $value["id"] . '">' . $value["nombre"] . '</option>';
                                    }

                                    ?>

                                </select>

                            </div>

                        </div>
                        <!-- ENTRADA PARA EQUIPO -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar Equipo</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaEquipo" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA MARCA -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar Marca</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaMarca" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA PROCESADOR -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar Procesador</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoProcesador" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA RAM -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar RAM</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaRam" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA DD -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar DD</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaDd" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA SO-->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar SO</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoSo" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA FALLA -->

                        <div class="form-group col-md-12">

                            <label for="">¿Cuál es la falla?</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control" rows="3" name="nuevaFalla" required></textarea>

                            </div>

                        </div>
                        <!-- ENTRADA PARA SOLUCION-->

                        <div class="form-group col-md-12">

                            <label for="">¿Cuál fue la solución?</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control" rows="3" name="nuevaSolución"></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA OBS -->

                        <div class="form-group col-md-12">

                            <label for="">Observaciones</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control" rows="3" name="nuevaObs"></textarea>

                            </div>

                        </div>
                        <!-- ENTRADA PARA FECHA ENTREGA -->

                        <div class="form-group col-md-12">

                            <label for="">Fecha de entrega</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="date" class="form-control input-lg" name="nuevaFechaEn">

                            </div>

                        </div>

                        <!-- ENTRADA PARA ESTATUS -->

                        <div class="form-group col-md-6">

                            <label for="">Estado del servicio</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <select class="form-control input-lg" name="nuevoEstatus" id="nuevoEstatus" required>

                                    <option value="">Seleccione </option>
                                    <option value="1">Abierto</option>
                                    <option value="2">En proceso(Trabajando)</option>
                                    <option value="3">Terminado</option>
                                    <option value="4">Suspendido</option>
                                    <option value="5">Cancelado</option>
                                    <option value="6">Entregado</option>

                                </select>

                            </div>

                        </div>

                        <!-- ENTRADA PARA PRECIO DEL SERVICIO -->

                        <div class="form-group col-md-6">

                            <label for="">Costo del servicio</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                                <input type="number" class="form-control input-lg" name="nuevoServicio">

                            </div>

                        </div>

                    </div>

                </div>

                <!--=====================================
        PIE DEL MODAL
        ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                    <button type="submit" class="btn btn-primary">Guardar servicio</button>

                </div>

                <?php

                $crearServicio = new ControladorServicios();
                $crearServicio->ctrCrearServicio();

                ?>

            </form>

        </div>

    </div>

</div>

<!--=====================================
MODAL EDITAR CATEGORÍA
======================================-->

<div id="modalEditarServicio" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Editar servicio</h4>

                </div>

                <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <!-- FOLIO -->

                        <div class="form-group col-md-6">

                        <label for="">No. Folio</label>

                            <input type="text" class="form-control input-lg" name="editarFolio" id="editarFolio" readonly>

                        </div>

                        <!-- ENTRADA PARA FECHA LLEGADA -->

                        <div class="form-group col-md-12">

                            <label for="">Ingresar fecha de llegada</label>

                            <input type="hidden" name="idServicio" id="idServicio" required>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarFechaLl" id="editarFechaLl" placeholder="" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA CLIENTE -->

                        <div class="form-group col-md-12">

                            <label for="">Nombre del cliente</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarCliente" id="editarCliente">

                            </div>

                        </div>

                        <!-- ENTRADA PARA EMPLEADO -->

                        <!-- <div class="form-group">

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarEmpleado" id="editarEmpleado">

                            </div>

                        </div> -->

                        <!-- ENTRADA PARA EQUIPO -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar Equipo</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarEquipo" id="editarEquipo" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA MARCA -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar Marca</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarMarca" id="editarMarca" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA PROCESADOR -->

                        <div class="form-group col-md-6">

                            <label for="">Ingresar Procesador</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarProcesador" id="editarProcesador" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA RAM -->

                        <div class="form-group col-md-6">

                            <label for="">Editar Ram</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarRam" id="editarRam" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA DD -->

                        <div class="form-group col-md-6">

                            <label for="">Editar DD</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarDd" id="editarDd" required>

                            </div>

                        </div>
                        <!-- ENTRADA PARA SO-->

                        <div class="form-group col-md-6">

                            <label for="">Editar SO</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="text" class="form-control input-lg" name="editarSo" id="editarSo" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA FALLA -->

                        <div class="form-group col-md-12">

                            <label for="">¿Cuál es la falla?</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control" rows="3" name="editarFalla" id="editarFalla" required></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA SOLUCION-->

                        <div class="form-group col-md-12">

                            <label for="">¿Cuál fue la solución?</label>

                            <div class="input-group col-md-12">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control" rows="3" name="editarSolucion" id="editarSolucion"></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA OBS -->

                        <div class="form-group col-md-12">

                            <label for="">Observaciones</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <textarea class="form-control" rows="3" name="editarObs" id="editarObs"></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA FECHA ENTREGA -->

                        <div class="form-group col-md-12">

                            <label for="">Fecha de entrega</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <input type="date" class="form-control input-lg" name="editarFechaEn" id="editarFechaEn" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA ESTATUS -->

                        <div class="form-group col-md-6">

                            <label for="">Estado del servicio</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                                <select class="form-control input-lg" name="editarEstatus" id="editarEstatus" required>

                                    <option value="">Selecciona</option>
                                    <option value="1">Abierto</option>
                                    <option value="2">En proceso(Trabajando)</option>
                                    <option value="3">Terminado</option>
                                    <option value="4">Suspendido</option>
                                    <option value="5">Cancelado</option>
                                    <option value="6">Entregado</option>

                                </select>

                            </div>

                        </div>

                        <!-- ENTRADA PARA PRECIO DEL SERVICIO -->

                        <div class="form-group col-md-6">

                            <label for="">Costo Servicio</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                                <input type="number" class="form-control input-lg" name="editarServicio" id="editarServicio">

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

                $editarServicio = new ControladorServicios();
                $editarServicio->ctrEditarServicio();

                ?>

            </form>

        </div>

    </div>

</div>

<?php

$borrarServicio = new ControladorServicios();
$borrarServicio->ctrBorrarServicio();

?>