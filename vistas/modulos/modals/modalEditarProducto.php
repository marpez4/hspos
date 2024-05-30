<div id="modalEditarProducto" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
                CABEZA DEL MODAL
                ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Editar producto</h4>

                </div>

                <!--=====================================
                CUERPO DEL MODAL
                ======================================-->

                <div class="modal-body">
                    <div class="box-body">

                        <input type="hidden" id="id_productoEd" name="id_productoEd">

                        <!-- Nombre Interno -->

                        <div class="form-group">

                            <label for="">Nombre producto</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>

                                <input type="text" class="form-control input-lg" name="editarNombre" id="editarNombre" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CÓDIGO -->

                        <div class="form-group">

                            <label for="">Código producto</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-code"></i></span>

                                <input type="text" class="form-control input-lg" id="editarCodigo" name="editarCodigo" required>

                            </div>

                        </div>

                        <!-- STOCK -->

                        <div class="form-group">

                            <label for="">Stock</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>

                                <input type="number" class="form-control input-lg" id="editarStock" name="editarStock" required>

                            </div>

                        </div>

                        <!-- DESCRIPCIÓN -->

                        <div class="form-group">

                            <label for="">Descripción</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>

                                <textarea name="editarDescripcion" id="editarDescripcion" cols="2" rows="2" class="form-control"></textarea>

                            </div>

                        </div>

                        <!-- ENTRADA PARA SELECCIONAR CATEGORÍA -->

                        <div class="form-group">

                            <label for="">Categoría</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <select class="form-control input-lg" id="editarCategoria" name="editarCategoria" required>

                                    <option value="">Selecionar categoría</option>

                                    <?php

                                    $item = null;
                                    $valor = null;

                                    $categorias = ControladorCategorias::ctrMostrarCategorias($item, $valor);

                                    foreach ($categorias as $key => $value) {

                                        echo '<option value="' . $value["id"] . '">' . $value["categoria"] . '</option>';
                                    }

                                    ?>

                                </select>

                            </div>

                        </div>

                        <!-- INICIA FORM COMPUTADORAS -->

                        <div id="computadorasEditar" name="computadorasEditar" class="hidden">

                            <div class="form-group row">

                                <div class="col-xs-6">

                                    <label for="">Marca del equipo</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-bars"></i></span>

                                        <input type="text" class="form-control input-lg" name="editarMarca" id="editarMarca">

                                    </div>

                                </div>

                                <div class="col-xs-6">

                                    <label for="">RAM</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>


                                        <select class="form-control input-lg" id="editarRam" name="editarRam" required>

                                            <option value="">Selecionar RAM</option>

                                            <?php

                                            $item = "tipo";
                                            $valor = "RAM";

                                            $componentes = ControladorComponentes::ctrMostrarComponente($item, $valor);

                                            foreach ($componentes as $key => $value) {

                                                echo '<option value="' . $value["id"] . '">' . $value["capacidad"] . ' ' . $value["acron"] . '</option>';
                                            }

                                            ?>

                                        </select>

                                    </div>

                                </div>

                                <div class="col-xs-6">

                                    <label for="">Procesador</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                                        <input type="text" class="form-control input-lg" name="editarProcesedor" id="editarProcesedor">

                                    </div>
                                </div>

                                <div class="col-xs-6">

                                    <label for="">Tamaño de pantalla</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-desktop"></i></span>

                                        <input type="text" class="form-control input-lg" name="editarPantalla" id="editarPantalla" placeholder="Ingresar pantalla">

                                    </div>

                                </div>

                                <div class="col-xs-6">

                                    <label for="">Tarjeta gráfica</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                                        <select class="form-control input-lg" name="editarGraficos" id="editarGraficos" required>

                                            <option value="">Selecionar Gráficos</option>

                                            <?php

                                            $item = "tipo";
                                            $valor = "Graphics";

                                            $componentes = ControladorComponentes::ctrMostrarComponente($item, $valor);

                                            foreach ($componentes as $key => $value) {

                                                echo '<option value="' . $value["id"] . '">' . $value["capacidad"] . ' ' . $value["acron"] . '</option>';
                                            }

                                            ?>

                                        </select>

                                    </div>


                                </div>

                                <div class="col-xs-6">

                                    <label for="">SSD</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                                        <select class="form-control input-lg" name="editarSsd" id="editarSsd" required>

                                            <option value="">Seleciona SSD</option>

                                            <?php

                                            $item = "tipo";
                                            $valor = "SSD";

                                            $componentes = ControladorComponentes::ctrMostrarComponente($item, $valor);

                                            foreach ($componentes as $key => $value) {

                                                echo '<option value="' . $value["id"] . '">' . $value["capacidad"] . ' ' . $value["acron"] . '</option>';
                                            }

                                            ?>

                                        </select>

                                    </div>

                                </div>

                                <div class="col-xs-6">

                                    <label for="">HHD</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                                        <select class="form-control input-lg" name="editarHhd" id="editarHhd" required>

                                            <option value="">Seleciona HHD</option>

                                            <?php

                                            $item = "tipo";
                                            $valor = "HHD";

                                            $componentes = ControladorComponentes::ctrMostrarComponente($item, $valor);

                                            foreach ($componentes as $key => $value) {

                                                echo '<option value="' . $value["id"] . '">' . $value["capacidad"] . ' ' . $value["acron"] . '</option>';
                                            }

                                            ?>

                                        </select>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <!-- TERMINA FORM COMPUTADORAS -->


                        <div class="form-group row">

                            <!-- ENTRADA PARA PRECIO COMPRA -->

                            <div class="col-xs-6">

                                <label for="">Precio de compra</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span>

                                    <input type="number" class="form-control input-lg" id="editarPrecioCompra" name="editarPrecioCompra" step="any" min="0" required>

                                </div>

                            </div>

                            <!-- ENTRADA PARA PRECIO DE CLIENTE FRECUENTE  -->

                            <div class="col-xs-6">

                                <label for="">Precio cliente frecuente</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                                    <input type="number" class="form-control input-lg" id="editarPrecioClienteF" name="editarPrecioClienteF" step="any" min="0" required>

                                </div>

                            </div>

                            <!-- ENTRADA PARA PRECIO DE ML  -->

                            <div class="col-xs-6">

                                <label for="">Precio Mercado Libre</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>

                                    <input type="number" class="form-control input-lg" id="editarPrecioMl" name="editarPrecioMl" step="any" min="0" required>

                                </div>

                            </div>

                            <!-- ENTRADA PARA PRECIO VENTA -->

                            <div class="col-xs-6">

                                <label for="">Precio venta</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span>

                                    <input type="number" class="form-control input-lg" id="editarPrecioVenta" name="editarPrecioVenta" step="any" min="0" required>

                                </div>


                            </div>

                        </div>

                        <div class="form-group row">

                            <div class="col-xs-12">

                                <label for="">IVA</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="editarIva" name="editarIva" required>

                                        <option value="">Seleciona</option>
                                        <option value=".16">IVA 16%</option>
                                        <option value=".08">IVA 8%</option>
                                        <option value="0">IVA 0%</option>
                                        <option value="exento">Exento</option>

                                    </select>

                                </div>

                            </div>

                            <div class="col-xs-12">

                                <label for="">Clave de producto</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="editarClave" name="editarClave" required>

                                        <option value="">Seleciona una clave</option>

                                        <?php

                                        $item = null;
                                        $valor = null;

                                        $catalogo1 = ControladorCatalogosSat::ctrMostrarUnidades($item, $valor);

                                        foreach ($catalogo1 as $key => $value) {

                                            echo '<option value="' . $value["unidad"] . '">' . $value["unidad"] . "-" . $value["nombre"]  . '</option>';
                                        }

                                        ?>

                                    </select>

                                </div>

                            </div>

                            <div class="col-xs-12">

                                <label for="">Unidad del producto</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="editarUnidad" name="editarUnidad" required>

                                        <option value="">Seleciona la unidad</option>

                                        <?php

                                        $item = null;
                                        $valor = null;

                                        $catalogo2 = ControladorCatalogosSat::ctrMostrarClaves($item, $valor);

                                        foreach ($catalogo2 as $key => $value) {

                                            echo '<option value="' . $value["clave"] . '">' . $value["clave"] . "-" . $value["descripcion"]  . '</option>';
                                        }

                                        ?>

                                    </select>

                                </div>

                            </div>

                            <div class="col-xs-12">

                                <label for="">Objeto de impuesto</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="editarObjetoImpuesto" name="editarObjetoImpuesto" required>

                                        <option value="">Seleciona una opción</option>
                                        <option value="01">01-No objeto de impuesto</option>
                                        <option value="02">02-Si objeto de impuesto</option>
                                        <option value="03">03-Si objeto del impuesto y no obligado al desglose</option>
                                        <option value="04">04-Si objeto de impuesto y no causa im puesto</option>

                                    </select>

                                </div>

                            </div>

                        </div>

                        <br>

                        <!-- ENTRADA PARA SUBIR FOTO -->

                        <div class="form-group">

                            <div class="panel">SUBIR IMAGEN</div>

                            <input type="file" class="nuevaImagen" name="editarImagen" id="editarImagen">

                            <p class="help-block">Peso máximo de la imagen 2MB</p>

                            <img src="vistas/img/productos/default/anonymous.png" class="img-thumbnail previsualizar" width="100px">

                            <input type="hidden" name="imagenActual" id="imagenActual">

                        </div>

                    </div>
                </div>

                <!--=====================================
                PIE DEL MODAL
                ======================================-->

                <div class="modal-footer">

                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                    <button type="submit" class="btn btn-primary">Guardar producto</button>

                </div>


                <?php

                $editarProducto = new ControladorProductos();
                $editarProducto->ctrEditarProducto();

                ?>
            </form>

        </div>

    </div>

</div>