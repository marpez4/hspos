    <!--=====================================
    MODAL AGREGAR CATEGORÍA
    ======================================-->

    <div id="modalAgregarAbono" class="modal fade" role="dialog">

        <div class="modal-dialog">

            <div class="modal-content">

                <form role="form" method="post">

                    <!--=====================================
                    CABEZA DEL MODAL
                    ======================================-->

                    <div class="modal-header" style="background:#3c8dbc; color:white">

                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <h4 class="modal-title">Abonos</h4>

                    </div>

                    <!--=====================================
                    CUERPO DEL MODAL
                    ======================================-->

                    <div class="modal-body">

                        <div class="box-body">



                            <div class="form-group row">

                                <!-- ENTRADA PARA EL FOLIO -->

                                <div class="col-xs-6">

                                    <label for="">Folio venta</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-list-ol"></i></span>

                                        <input type="number" class="form-control input-lg" name="folio" id="folio" readonly>

                                    </div>

                                </div>

                                <!-- ENTRADA PARA TOTAL -->

                                <div class="col-xs-6">

                                    <label for="">Total venta</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-list-ol"></i></span>

                                        <input type="text" class="form-control input-lg" name="totalVenta" id="totalVenta" readonly>

                                    </div>

                                </div>

                                <!-- ENTRADA PARA TOTAL -->

                                <div class="col-xs-6">

                                    <label for="">Total abonado hasta el momento</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-list-ol"></i></span>

                                        <input type="text" class="form-control input-lg" name="totalAbonado" id="totalAbonado" readonly>

                                    </div>

                                </div>

                                <!-- ENTRADA PARA EL ABONO -->

                                <div class="col-xs-8">

                                    <label for="">Nuevo abono</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                        <input type="number" class="form-control input-lg" name="nuevoAbono" id="nuevoAbono">

                                    </div>

                                </div>

                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>

                                <div style="margin-top:5em">
                                    &nbsp;
                                </div>

                                <hr class="box box-warning">

                                <h4>Listado de abonos</h4>

                                <table style="width: 100%;" border="1">

                                    <thead>
                                        <tr>
                                            <th>Num.</th>
                                            <th>Fecha</th>
                                            <th>Abono</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mTableBody"></tbody>
                                </table>

                            </div>

                        </div>

                    </div>

                    <!--=====================================
                        PIE DEL MODAL
                    ======================================-->

                    <div class="modal-footer">

                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                        <button type="submit" class="btn btn-primary">Guardar abono</button>

                    </div>

                    <?php

                    // $crearfactura = new ControladorFacturacion();
                    // $crearfactura->ctrEmitirfactura();

                    ?>

                </form>

            </div>

        </div>

    </div>