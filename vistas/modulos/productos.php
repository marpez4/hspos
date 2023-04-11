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

      Administrar inventario

    </h1>

    <ol class="breadcrumb">

      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Administrar inventario</li>

    </ol>

  </section>

  <section class="content">

    <div class="box">

      <div class="box-header with-border">

        <!-- <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarProducto"> -->
        <button class="btn btn-primary">

          <a href="altaProductos" style="color:white;">
            Agregar producto
          </a>

        </button>

      </div>

      <div class="box-body">

        <table class="table table-bordered table-striped dt-responsive tablaProductos" width="100%">

          <thead>

            <tr>

              <th style="width:10px">#</th>
              <th>Imagen</th>
              <th>Código</th>
              <th>Descripción</th>
              <th>Categoría</th>
              <th>Llegadas</th>
              <th>Bodega</th>
              <th>Stock</th>
              <th>Precio de compra</th>
              <th>Precio de venta</th>
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

<!--=====================================
MODAL AGREGAR PRODUCTO
======================================-->

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


            <!-- ENTRADA PARA SELECCIONAR CATEGORÍA -->

            <div class="form-group">

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

            <!-- ENTRADA PARA EL CÓDIGO -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-code"></i></span>

                <input type="text" class="form-control input-lg" id="nuevoCodigo" name="nuevoCodigo" placeholder="Ingresar código" required>

              </div>

            </div>

            <!-- ENTRADA PARA LA DESCRIPCIÓN -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>

                <input type="text" class="form-control input-lg" name="nuevaDescripcion" placeholder="Ingresar descripción" required>

              </div>

            </div>

            <!-- INICIA FORM COMPUTADORAS -->

            <div id="computadoras" name="computadoras" class="hidden">

              <!-- ENTRADA MARCA -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-bars"></i></span>

                  <input type="text" class="form-control input-lg" name="nuevaMarca" id="nuevaMarca" placeholder="Ingresar Marca">

                </div>

              </div>

              <!-- RAM -->
              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-microchip"></i></span>


                  <select class="form-control input-lg" id="nuevaRam" name="nuevaRam" required>

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
              <!-- DD -->
              <!-- <div class="form-group">
              
                    <div class="input-group">
                    
                      <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span> 

                      <select class="form-control input-lg" name="nuevaDd" id="nuevaDd" required>
                  
                        <option value="">Selecionar DD</option>

                        <?php

                        // $item = "tipo";
                        // $valor = "DD";

                        // $componentes = ControladorComponentes::ctrMostrarComponente($item, $valor);

                        // foreach ($componentes as $key => $value) {

                        //   echo '<option value="'.$value["id"].'">'.$value["capacidad"].' '.$value["acron"].'</option>';
                        // }

                        ?>
        
                      </select>

                    </div>

                  </div> -->
              <!-- PROCESADOR -->
              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                  <input type="text" class="form-control input-lg" name="nuevaProcesedor" id="nuevaProcesedor" placeholder="Ingresar Procesador">

                </div>

              </div>
              <!-- PANTALLA -->
              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-desktop"></i></span>

                  <input type="text" class="form-control input-lg" name="nuevaPantalla" id="nuevaPantalla" placeholder="Ingresar pantalla">

                </div>

              </div>
              <!-- GRAFICOS -->
              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                  <select class="form-control input-lg" name="nuevaGraficos" id="nuevaGraficos" required>

                    <option value="">Selecionar Graficos</option>

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
              <!-- SSD -->
              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                  <select class="form-control input-lg" name="nuevaSsd" id="nuevaSsd" required>

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
              <!-- HHD -->
              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                  <select class="form-control input-lg" name="nuevaHhd" id="nuevaHhd" required>

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
            <!-- TERMINA FORM COMPUTADORAS -->

            <!-- ENTRADA PARA STOCK -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-check"></i></span>

                <input type="number" class="form-control input-lg" name="nuevoStock" min="0" placeholder="Stock" required>

              </div>

            </div>

            <div class="form-group row">

              <!-- ENTRADA PARA PRECIO DE CLIENTE FRECUENTE  -->

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                  <input type="number" class="form-control input-lg" id="nuevoPrecioClienteF" name="nuevoPrecioClienteF" step="any" min="0" placeholder="Precio de cliente frecuente" required>

                </div>

              </div>

              <!-- ENTRADA PARA PRECIO DE ML  -->

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-money"></i></span>

                  <input type="number" class="form-control input-lg" id="nuevoPrecioMl" name="nuevoPrecioMl" step="any" min="0" placeholder="Precio de mercado libre" required>

                </div>

              </div>

            </div>

            <!-- ENTRADA PARA PRECIO COMPRA -->

            <div class="form-group row">

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span>

                  <input type="number" class="form-control input-lg" id="nuevoPrecioCompra" name="nuevoPrecioCompra" step="any" min="0" placeholder="Precio de compra" required>

                </div>

              </div>

              <!-- ENTRADA PARA PRECIO VENTA -->

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span>

                  <input type="number" class="form-control input-lg" id="nuevoPrecioVenta" name="nuevoPrecioVenta" step="any" min="0" placeholder="Precio de venta" required>

                </div>

                <br>

                <!-- CHECKBOX PARA PORCENTAJE -->

                <div class="col-xs-6">

                  <div class="form-group">

                    <label>

                      <input type="checkbox" class="minimal porcentaje" checked>
                      Utilizar procentaje
                    </label>

                  </div>

                </div>

                <!-- ENTRADA PARA PORCENTAJE -->

                <div class="col-xs-6" style="padding:0">

                  <div class="input-group">

                    <input type="number" class="form-control input-lg nuevoPorcentaje" min="0" value="40" required>

                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>

                  </div>

                </div>

              </div>

            </div>

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

          <button type="submit" class="btn btn-primary">Guardar producto</button>

        </div>

      </form>

      <?php

      $crearProducto = new ControladorProductos();
      $crearProducto->ctrCrearProducto();

      ?>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR PRODUCTO
======================================-->

<div id="modalEditarProducto" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

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

            <!-- ENTRADA PARA SELECCIONAR CATEGORÍA -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-th"></i></span>

                <select class="form-control input-lg" name="editarCategoria" readonly required>

                  <option id="editarCategoria"></option>

                </select>

              </div>

            </div>

            <!-- ENTRADA PARA EL CÓDIGO -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-code"></i></span>

                <input type="text" class="form-control input-lg" id="editarCodigo" name="editarCodigo" readonly required>

              </div>

            </div>

            <!-- ENTRADA PARA LA DESCRIPCIÓN -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>

                <input type="text" class="form-control input-lg" id="editarDescripcion" name="editarDescripcion" required>

              </div>

            </div>

            <!-- ENTRADAS PARA FORM COMPUTADORAS -->

            <div id="computadorasEditar" name="computadorasEditar" class="hidden">

              <!-- ENTRADA MARCA -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-bars"></i></span>

                  <input type="text" class="form-control input-lg" name="editarMarca" id="editarMarca">

                </div>

              </div>

              <!-- RAM -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                  <select class="form-control input-lg" id="editarRam" name="editarRam" required>

                    <option value="">Editar</option>

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

              <!-- DD -->
              <!-- <div class="form-group">
        
              <div class="input-group">
              
                <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span> 

                <select class="form-control input-lg" name="editarDd" id="editarDd" required>
            
                  <option value="">Editar DD</option>

                  <?php

                  // $item = "tipo";
                  // $valor = "DD";

                  // $componentes = ControladorComponentes::ctrMostrarComponente($item, $valor);

                  // foreach ($componentes as $key => $value) {

                  //   echo '<option value="'.$value["id"].'">'.$value["capacidad"].' '.$value["acron"].'</option>';
                  // }

                  ?>
  
                </select>

              </div>

            </div>      -->

              <!-- PROCESADOR -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                  <input type="text" class="form-control input-lg" name="editarProcesedor" id="editarProcesedor" placeholder="Editar Procesador">

                </div>

              </div>

              <!-- PANTALLA -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-desktop"></i></span>

                  <input type="text" class="form-control input-lg" name="editarPantalla" id="editarPantalla" placeholder="Editar pantalla">

                </div>

              </div>

              <!-- GRAFICOS -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-microchip"></i></span>

                  <select class="form-control input-lg" name="editarGraficos" id="editarGraficos">

                    <option value="">Editar Graficos</option>

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

              <!-- SSD -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                  <select class="form-control input-lg" name="editarSsd" id="editarSsd" required>

                    <option value="">Editar SSD</option>

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

              <!-- HHD -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-hdd-o"></i></span>

                  <select class="form-control input-lg" name="editarHhd" id="editarHhd" required>

                    <option value="">Editar HHD</option>

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

            <!-- TERMINA ENTRADAS PARA FORM COMPUTADORAS -->

            <!-- ENTRADA PARA STOCK -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-check"></i></span>

                <input type="number" class="form-control input-lg" id="editarStock" name="editarStock" min="0" required>

              </div>

            </div>

            <!-- ENTRADA PARA PRECIO DE CLIENTE FRECUENTE  -->

            <div class="form-group row">

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-usd"></i></span>

                  <input type="number" class="form-control input-lg" id="editarPrecioClienteF" name="editarPrecioClienteF" step="any" min="0" placeholder="Editar precio de cliente frecuente" required>

                </div>

              </div>

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-money"></i></span>

                  <input type="number" class="form-control input-lg" id="editarPrecioMl" name="editarPrecioMl" step="any" min="0" placeholder="Editar precio de ML" required>

                </div>

              </div>

            </div>

            <!-- ENTRADA PARA PRECIO COMPRA -->

            <div class="form-group row">

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span>

                  <input type="number" class="form-control input-lg" id="editarPrecioCompra" name="editarPrecioCompra" step="any" min="0" required>

                </div>

              </div>

              <!-- ENTRADA PARA PRECIO VENTA -->

              <div class="col-xs-6">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span>

                  <input type="number" class="form-control input-lg" id="editarPrecioVenta" name="editarPrecioVenta" step="any" min="0" readonly required>

                </div>

                <br>

                <!-- CHECKBOX PARA PORCENTAJE -->

                <div class="col-xs-6">

                  <div class="form-group">

                    <label>

                      <input type="checkbox" class="minimal porcentaje" checked>
                      Utilizar procentaje
                    </label>

                  </div>

                </div>

                <!-- ENTRADA PARA PORCENTAJE -->

                <div class="col-xs-6" style="padding:0">

                  <div class="input-group">

                    <input type="number" class="form-control input-lg nuevoPorcentaje" min="0" value="40" required>

                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>

                  </div>

                </div>

              </div>

            </div>

            <!-- ENTRADA PARA SUBIR FOTO -->

            <div class="form-group">

              <div class="panel">SUBIR IMAGEN</div>

              <input type="file" class="nuevaImagen" name="editarImagen">

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

          <button type="submit" class="btn btn-primary">Guardar cambios</button>

        </div>

      </form>

      <?php

      $editarProducto = new ControladorProductos();
      $editarProducto->ctrEditarProducto();

      ?>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR PRODUCTO
======================================-->

<div id="modalMovBodega" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Agregar movimiento a bodega</h4>

        </div>

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA DEL ID DEL PRODUCTO -->

            <input type="number" class="form-control input-lg hidden" name="idProductoMov" id="idProductoMov" hidden>

            <!-- ENTRADA DEL ID DE LA BODEGA -->

            <input type="number" class="form-control input-lg hidden" name="idBodegaMov" id="idBodegaMov" hidden>

            <!-- ENTRADA DEL USUARIO -->

            <input type="hidden" name="idUsuario" value="<?php echo $_SESSION["id"]; ?>">

            <!-- ENTRADA PARA FECHA LLEGADA -->

            <div class="form-group col-md-6">

              <label for="">Tipo de movimiento</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                <select class="form-control input-lg" id="tipoMov" name="tipoMov" id="tipoMov" onChange="mostrarInLlegadas()" required>

                  <option value="">Selecciona</option>
                  <option value="1">Entrada a bodega</option>
                  <option value="0">Salida a tienda</option>

                </select>

              </div>

            </div>

            <!-- ENTRADA PARA FECHA LLEGADA -->

            <div class="form-group col-md-6">

              <label for="">Cantidad</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                <input type="number" class="form-control input-lg" min="0" name="cantidadMov" required>

              </div>

            </div>

            <!-- ENTRADA PARA LLEGADAS -->

            <div id="divCantidadLlegadas" class="form-group col-md-6 hidden">

              <label for="">Cantidad de llegadas</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                <input type="number" class="form-control input-lg" min="0" name="cantidadLlegadas" id="cantidadLlegadas">

              </div>

            </div>

            <!-- ENTRADA PARA FECHA LLEGADA -->

            <div class="form-group col-md-12">

              <label for="">Descripción</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-gear"></i></span>

                <textarea class="form-control input-lg" name="descripcionMov" id="" cols="2" rows="2"></textarea>

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

      </form>

      <?php

      $movBodega = new ControladorProductos();
      $movBodega->ctrMovBodega();

      ?>

    </div>

  </div>

</div>

<?php

$eliminarProducto = new ControladorProductos();
$eliminarProducto->ctrEliminarProducto();

?>