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

            Administrar productos

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Administrar productos</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">

                <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarProducto">

                    Agregar producto

                </button>

            </div>

            <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablaAltaProductos" width="100%">

                    <thead>

                        <tr>

                            <th style="width:10px">#</th>
                            <th>Imagen</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Categoría</th>
                            <th>Precio de compra</th>
                            <th>Precio de venta</th>
                            <th>Precio en ML</th>
                            <th>Precio Cliente F.</th>
                            <th>Agregado</th>
                            <th>Acciones</th>

                        </tr>

                    </thead>

                </table>

                <input type="hidden" value="<?php echo $_SESSION['perfil']; ?>" id="perfilOculto">

            </div>

        </div>

    </section>

</div>

<div id="modalAgregarProducto" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post" enctype="multipart/form-data">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Agregar producto</h4>

                </div>

                <!--=====================================
                CUERPO DEL MODAL
                ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <!-- Nombre Interno -->

                        <div class="form-group">

                            <label for="">Nombre producto</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaDescripcion" required>

                            </div>

                        </div>

                        <!-- ENTRADA PARA EL CÓDIGO -->

                        <div class="form-group">

                            <label for="">Código producto</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-code"></i></span>

                                <input type="text" class="form-control input-lg" id="nuevoCodigo" name="nuevoCodigo" required>

                            </div>

                        </div>



                        <!-- ENTRADA PARA SELECCIONAR CATEGORÍA -->

                        <div class="form-group">

                            <label for="">Categoría</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <select class="form-control input-lg" id="nuevaCategoria" name="nuevaCategoria" required>

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

                        <div class="form-group row">

                            <!-- ENTRADA PARA PRECIO COMPRA -->

                            <div class="col-xs-6">

                                <label for="">Precio de compra</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span>

                                    <input type="number" class="form-control input-lg" id="nuevoPrecioCompra" name="nuevoPrecioCompra" step="any" min="0" required>

                                </div>

                            </div>

                            <!-- ENTRADA PARA PRECIO DE CLIENTE FRECUENTE  -->

                            <div class="col-xs-6">

                                <label for="">Precio cliente frecuente</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                                    <input type="number" class="form-control input-lg" id="nuevoPrecioClienteF" name="nuevoPrecioClienteF" step="any" min="0" required>

                                </div>

                            </div>

                            <!-- ENTRADA PARA PRECIO DE ML  -->

                            <div class="col-xs-6">

                                <label for="">Precio Mercado Libre</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>

                                    <input type="number" class="form-control input-lg" id="nuevoPrecioMl" name="nuevoPrecioMl" step="any" min="0" required>

                                </div>

                            </div>

                            <!-- ENTRADA PARA PRECIO VENTA -->

                            <div class="col-xs-6">

                                <label for="">Precio venta</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span>

                                    <input type="number" class="form-control input-lg" id="nuevoPrecioVenta" name="nuevoPrecioVenta" step="any" min="0" required>

                                </div>


                            </div>

                        </div>

                        <div class="form-group row">

                            <div class="col-xs-6">

                                <label for="">IVA</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="nuevaIva" name="nuevaIva" required>

                                        <option value="">Seleciona</option>
                                        <option value="16">IVA 16%</option>
                                        <option value="8">IVA 8%</option>
                                        <option value="0">IVA 0%</option>
                                        <option value="exento">Exento</option>

                                    </select>

                                </div>

                            </div>

                            <div class="col-xs-6">

                                <label for="">Clave de producto</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="nuevaClave" name="nuevaClave" required>

                                        <option value="">Seleciona una clave</option>

                                        <?php

                                        $item = null;
                                        $valor = null;

                                        $catalogo1 = ControladorCatalogosSat::ctrMostrarClaves($item, $valor);

                                        foreach ($catalogo1 as $key => $value) {

                                            echo '<option value="' . $value["clave"] . '">' . $value["clave"] . '</option>';
                                        }

                                        ?>

                                    </select>

                                </div>

                            </div>

                            <div class="col-xs-6">

                                <label for="">Unidad del producto</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="nuevaUnidad" name="nuevaUnidad" required>

                                        <option value="">Seleciona la unidad</option>

                                        <?php

                                        $item = null;
                                        $valor = null;
                                        
                                        $catalogo2 = ControladorCatalogosSat::ctrMostrarUnidades($item, $valor);

                                        foreach ($catalogo2 as $key => $value) {

                                            echo '<option value="' . $value["unidad"] . '">' . $value["unidad"] . '</option>';
                                        }

                                        ?>

                                    </select>

                                </div>

                            </div>

                            <div class="col-xs-6">

                                <label for="">Objeto de impuesto</label>

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                    <select style="height: 100%; width: 100%" class="form-control chosen-select" id="nuevaImpuesto" name="nuevaImpuesto" required>

                                        <option value="">Seleciona una opción</option>
                                        <option value="">01-No objeto de impuesto</option>
                                        <option value="">02-Si objeto de impuesto</option>
                                        <option value="">03-Si objeto del impuesto y no obligado al desglose</option>
                                        <option value="">04-Si objeto de impuesto y no causa impuesto</option>
                                        
                                    </select>

                                </div>

                            </div>

                        </div>

                        <br>

                        <!-- ENTRADA PARA SUBIR FOTO -->

                        <div class="form-group">

                            <div class="panel">SUBIR IMAGEN</div>

                            <input type="file" class="nuevaImagen" name="nuevaImagen">

                            <p class="help-block">Peso máximo de la imagen 2MB</p>

                            <img src="vistas/img/productos/default/anonymous.png" class="img-thumbnail previsualizar" width="100px">

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

        </div>
    </div>
</div>