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

                                <!-- NAMEID -->

                                <input type="hidden" value="1" name="nameId">

                                <!-- EXPORTATION -->
                                <input type="hidden" value="01" name="exportation">

                                <!-- SERIE -->
                                <input type="hidden" value="Blue" name="serie">

                                <!-- ENTRADA PARA EL NOMBRE -->

                                <div class="col-xs-6">

                                    <label for="">Folio</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-list-ol"></i></span>

                                        <input type="number" class="form-control input-lg" name="folio" id="folio" readonly>

                                    </div>

                                </div>

                                <!-- ENTRADA PARA EL NOMBRE -->

                                <div class="col-xs-8">

                                    <label for="">Nombre del emisor</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                        <input type="text" class="form-control input-lg" name="nombreEmisor" id="nombreEmisor" readonly>

                                    </div>

                                </div>

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
                                            <th>Cant.</th>
                                            <th>Claves</th>
                                            <th>Descripción</th>
                                            <th>Precio</th>
                                            <th>Subtotal</th>
                                            <th>Impuestos</th>
                                            <th>Total</th>
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

                        <button type="submit" class="btn btn-primary">Emitir factura</button>

                    </div>

                    <?php

                    // $crearfactura = new ControladorFacturacion();
                    // $crearfactura->ctrEmitirfactura();

                    ?>

                </form>

            </div>

        </div>

    </div>