<?php

if ($_SESSION["perfil"] == "Vendedor") {

    echo '<script>

    window.location = "inicio";

  </script>';

    return;
}

?>

<div class="content-wrapper">

<!-- 
    https://codigosdeprogramacion.com/2017/02/14/curso-de-php-y-mysql-15-generar-codigo-de-barras/
    https://www.youtube.com/watch?v=qOd2uaDRuwI
-->

    <section class="content-header">

        <h1>

            Administrar códigos de productos

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Administrar códigos de productos</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">

                <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarCodigoProducto">

                    Agregar códigos de producto

                </button>

            </div>

            <div class="box-body">

                <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

                    <thead>

                        <tr>

                            <th style="width:10px">#</th>
                            <th>Código</th>
                            <th>Descripción</th>
                            <th>Fecha</th>
                            <th>Img. Código</th>
                            <th>Acciones</th>

                        </tr>

                    </thead>

                    <tbody>

                        <?php

                        $item = null;
                        $valor = null;

                        $cProductos = ControladorCodigosProductos::ctrMostrarCodigoProducto();

                        foreach ($cProductos as $key => $value) {

                            echo ' <tr>

                    <td>' . ($key + 1) . '</td>

                    <td class="text-uppercase">' . $value["codigo"] . '</td>
                    <td class="text-uppercase">' . $value["descripcion"] . '</td>
                    <td class="text-uppercase">' . $value["fecha"] . '</td>
                    <td class="text-uppercase">
                        <a href="extensiones/tcpdf/pdf/codigos/'.$value["codigo"].'.png" target="_blank">
                         <img src="vistas/img/otros/bardcode.png" class="img-thumbnail" width="60px">
                        </a>
                    </td>

                    <td>

                      <div class="btn-group">

                        <button class="btn btn-default btnVerCPr" idCPr="' . $value["id"] . '"><i class="fa fa-barcode"></i></button>';
                          
                        // <button class="btn btn-warning btnEditarCategoria" idCategoria="' . $value["id"] . '" data-toggle="modal" data-target="#modalEditarCategoria"><i class="fa fa-pencil"></i></button>';

                            if ($_SESSION["perfil"] == "Administrador") {

                                echo '<button class="btn btn-danger btnEliminarCodigoB" idCodigoB="' . $value["codigo"] . '"><i class="fa fa-times"></i></button>';
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

<div id="modalAgregarCodigoProducto" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <div class="modal-content">

            <form role="form" method="post">

                <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

                <div class="modal-header" style="background:#3c8dbc; color:white">

                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h4 class="modal-title">Agregar códigos de producto</h4>

                </div>

                <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

                <div class="modal-body">

                    <div class="box-body">

                        <!-- ENTRADA PARA EL PRODUCTO -->

                        <!-- <div class="form-group">

                        <label for="">Producto</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoProducto" required>

                            </div>

                        </div> -->

                        <!-- ENTRADA PARA EL CÓDIGO -->

                        <div class="form-group">

                            <label for="">Código</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevoCodigo" id="nuevoCodigo" required>

                                <span class="input-group-addon"><button class="btn btn-default" id="btnCrearCodigo"><i class="fa fa-retweet"></i> </button></span>

                            </div>

                        </div>

                        <!-- ENTRADA PARA CANTDAD -->

                        <!-- <div class="form-group">

                            <label for="">Cantidad</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <input type="text" class="form-control input-lg" name="nuevaCantidad" required>

                            </div>

                        </div> -->

                        <!-- ENTRADA PARA DESCRIPCION -->

                        <div class="form-group">

                        <label for="">Descripción</label>

                            <div class="input-group">

                                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                                <textarea class="form-control input-lg" name="nuevaDescripcion" cols="3" required></textarea>

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

                $crearCodigoProducto = new ControladorCodigosProductos();
                $crearCodigoProducto->ctrCrearCodigoProducto();

                ?>

            </form>

        </div>

    </div>

</div>

<?php

$borrarCodigoB = new ControladorCodigosProductos();
$borrarCodigoB->ctrEliminarCodigo();

?>