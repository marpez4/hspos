<!--=====================================
MODAL AGREGAR CATEGORÍA
======================================-->

<div id="modalAgregarFactura" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Nueva factura</h4>

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
                            <input type="hidden" value="null" name="serie">

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

                                    <input type="text" class="form-control input-lg" name="nombreEmisor" readonly>

                                </div>

                            </div>

                            <!-- ENTRADA PARA CP -->

                            <div class="col-xs-4">

                                <label for="">Código postal del emisor</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <input type="text" class="form-control input-lg" name="cpEmisor" readonly>

                                </div>

                            </div>

                            <!-- TIPO DE FACTURA -->

                            <div class="col-xs-8">

                                <label for="">Tipo de factura</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                                    <select class="form-control input-lg" name="cfdiType" required>

                                        <option value="">Seleciona tipo</option>
                                        <option value="I">Factura</option>
                                        <option value="I">Factura global</option>

                                    </select>

                                </div>

                            </div>

                            <!-- LUGAR DE EXPEDICION -->

                            <div class="col-xs-4">

                                <label for="">Lugar de expedición</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <input type="number" class="form-control input-lg" name="expeditionPlace" readonly>

                                </div>

                            </div>

                            <!-- FORMA DE PAGO  -->

                            <div class="col-xs-12">

                                <label for="">Forma de pago</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                                    <select class="form-control input-lg" name="paymentForm" required>

                                        <option value="">Seleciona forma</option>
                                        <option value="01">01-Efectivo</option>
                                        <option value="03">03-Transferencia electrónica de fondos</option>
                                        <option value="04">04-Tarjeta de credito</option>
                                        <option value="28">05-Tarjeta de debito</option>
                                        <option value="99">99-Por definir</option>

                                    </select>

                                </div>

                            </div>

                            <!-- METODO DE PAGO  -->

                            <div class="col-xs-12">

                                <label for="">Método de pago</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                                    <select class="form-control input-lg" name="paymentMethod" required>

                                        <option value="">Seleciona método</option>
                                        <option value="PPD">PPD-Pago en parcialidades ó diferido</option>
                                        <option value="PUE">PUE-Pago en una sola exhibición</option>

                                    </select>

                                </div>

                            </div>



                        </div>

                        <hr class="box box-success">

                        CLIENTE

                        <hr class="box box-warning">

                        PRODUCTOS

                    </div>

                </div>

                <!--=====================================
        PIE DEL MODAL
        ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                    <button type="submit" class="btn btn-primary">Guardar categoría</button>

                </div>

                <?php

                $crearCategoria = new ControladorCategorias();
                $crearCategoria->ctrCrearCategoria();

                ?>

            </form>

        </div>

    </div>

</div>