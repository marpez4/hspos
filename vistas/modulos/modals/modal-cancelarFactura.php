<!--=====================================
MODAL CANCELAR FACTURA
======================================-->

<div id="modalCancelarFactura" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Cancelar factura</h4>

                </div>

                <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <!-- ENTRADA PARA EL MOTIVO DE LA CANCELACIÓN -->

                        <div class="form-group">

                            <label for="">Motivo de la cancelación</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <select class="form-control input-lg" name="motivoCancelar" id="motivoCancelar" required>

                                    <option value="">Seleccona motivo</option>
                                    <option value="01">Errores con relación </option>
                                    <option value="02">Errores sin relación </option>
                                    <option value="03">No se llevó a cabo la operación</option>
                                    <option value="04">Operación nominativa,relacionada en una factura global</option>

                                </select>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL FOLIO FISCAL -->

                        <div class="form-group hidden inputFolioAnteririor">

                            <label for="">UUID de Reemplazo</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <input type="text" class="form-control input-lg" name="folioAnterior" id="folioAnterior">

                            </div>

                        </div>

                    </div>

                </div>

                <!--=====================================
        PIE DEL MODAL
        ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                    <button type="submit" class="btn btn-primary">Cancelar factura</button>

                </div>

                <?php

                $crearCategoria = new ControladorCategorias();
                $crearCategoria->ctrCrearCategoria();

                ?>

            </form>

        </div>

    </div>

</div>