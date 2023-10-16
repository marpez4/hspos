<!--=====================================
MODAL AGREGAR CLIENTE MOSTRADOR 
======================================-->

<div id="modalAgregarCM" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Agregar Nombre del cliente a la nota de venta</h4>

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

                                <input type="hidden" name="codigoVenta" id="codigoVenta">

                                <input type="text" class="form-control input-lg" name="nuevoCliente" placeholder="Ingresar nombre del cliente" required>

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

                <?php

                $crearCM = new ControladorClientes();
                $crearCM->ctrCrearCM();

                ?>

            </form>

        </div>

    </div>

</div>