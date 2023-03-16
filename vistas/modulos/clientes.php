<?php

if ($_SESSION["perfil"] == "Especial") {

  echo '<script>

    window.location = "inicio";

  </script>';

  return;
}

?>

<div class="content-wrapper">

  <section class="content-header">

    <h1>

      Administrar clientes

    </h1>

    <ol class="breadcrumb">

      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Administrar clientes</li>

    </ol>

  </section>

  <section class="content">

    <div class="box">

      <div class="box-header with-border">

        <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarCliente">

          Agregar cliente

        </button>

      </div>

      <div class="box-body">

        <table class="table table-bordered table-striped dt-responsive tablas" width="100%">

          <thead>

            <tr>

              <th style="width:10px">#</th>
              <th>Nombre</th>
              <th>Email</th>
              <th>Teléfono</th>
              <th>Total compras</th>
              <th>Última compra</th>
              <th>Tipo cliente</th>
              <th>Acciones</th>

            </tr>

          </thead>

          <tbody>

            <?php

            $item = null;
            $valor = null;

            $clientes = ControladorClientes::ctrMostrarClientes($item, $valor);

            foreach ($clientes as $key => $value) {


              echo '<tr>

                    <td>' . ($key + 1) . '</td>

                    <td>' . $value["nombre"] . '</td>

                    <td>' . $value["email"] . '</td>

                    <td>' . $value["telefono"] . '</td>       

                    <td>' . $value["compras"] . '</td>

                    <td>' . $value["ultima_compra"] . '</td>';

              if ($value["frecuente"] == 1) {

                echo '<td> <span class="badge alert-success">CF</span></td>';
              } else if ($value["frecuente"] == 2) {

                echo '<td> <span class="badge alert-primary">CNF</span></td>';
              } else if ($value["frecuente"] == 3) {

                echo '<td> <span class="badge alert-warning">ML</span></td>';
              }


              echo '<td>

                      <div class="btn-group">
                          
                        <button class="btn btn-warning btnEditarCliente" data-toggle="modal" data-target="#modalEditarCliente" idCliente="' . $value["id"] . '"><i class="fa fa-pencil"></i></button>';

              if ($_SESSION["perfil"] == "Administrador") {

                echo '<button class="btn btn-danger btnEliminarCliente" idCliente="' . $value["id"] . '"><i class="fa fa-times"></i></button>';
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
MODAL AGREGAR CLIENTE
======================================-->

<div id="modalAgregarCliente" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Agregar cliente</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE -->

            <div class="form-group">

              <label for="nombre">Nombre / Razón Social</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoCliente" required>

              </div>

            </div>

            <!-- ENTRADA PARA CLIENTE FRECUENTE -->

            <div class="form-group">

              <label for="tipoCliente">Tipo de cliente</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-calendar-check-o"></i></span>

                <select name="frecuente" class="form-control" required>

                  <option value="">[SELECCIONE EL TIPO DE CLIENTE]</option>
                  <option value="1">Cliente frecuente</option>
                  <option value="2">Cliente NO frecuente</option>
                  <option value="3">Cliente Mercado Libre</option>

                </select>

              </div>

            </div>

            <!-- ENTRADA PARA EL EMAIL -->

            <div class="form-group">

              <label for="correo">Correo electrónico</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

                <input type="email" class="form-control input-lg" name="nuevoEmail">

              </div>

            </div>

            <!-- ENTRADA PARA EL TELÉFONO -->

            <div class="form-group">

              <label for="phone">Número de teléfono</label>

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-phone"></i></span>

                <input type="text" class="form-control input-lg" name="nuevoTelefono" data-inputmask="'mask':'(999) 999-9999'" data-mask>

              </div>

            </div>

            <!-- DATOS DE FACTURACIÓN -->

            <div class="form-group" style="text-align: right;">

              <label>
                <input type="checkbox" class="minimal checkDatosFact">
                Agregar datos para facturar
              </label>

            </div>
            <div class="datosFact hidden">
              <div class="box box-info">

                <div class="box-header ui-sortable-handle">

                  <div class="row">

                    <div class="col-lg-6">

                      <!-- ENTRADA PARA EL RFC -->

                      <div class="form-group">

                        <label for="rfc">RFC</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="text" maxlength="13" class="form-control input-lg" name="nuevoRfc" id="nuevoRfc">

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-6">

                      <!-- ENTRADA PARA EL CP -->

                      <div class="form-group">

                        <label for="UsoCFDI">C.P</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="number" maxlength="5" class="form-control input-lg" name="nuevoCp" id="nuevoCp">

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL Uso cfdi -->

                      <div class="form-group">

                        <label for="UsoCFDI">Uso de la factura</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <select style="width:100%; height: auto;" class="form-control chosen-select" name="nuevoCfdi" id="nuevoCfdi">

                            <option value="">Seleccionar uso de la factura </option>

                            <?php

                            $tabla = "catalogocfdi";

                            $uso = ControladorFacturacion::ctrMostrarCatalogos($tabla);

                            foreach ($uso as $key => $value) {

                              echo '<option value="' . $value["usoCfdi"] . '">' . $value["usoCfdi"] . ' - ' . $value["descripcion"] . '</option>';
                            }


                            ?>

                          </select>

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL regimen -->

                      <div class="form-group">

                        <label for="UsoCFDI">Régimen fiscal</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <select style="width:100%; height: auto;" class="form-control chosen-select" name="nuevoRegimen" id="nuevoRegimen">

                            <option value="">Seleccionar el régimen fiscal </option>

                            <?php

                            $tabla = "catalogoregimen";

                            $regimen = ControladorFacturacion::ctrMostrarCatalogos($tabla);

                            foreach ($regimen as $key => $value) {

                              echo '<option value="' . $value["codigo"] . '">' . $value["codigo"] . ' - ' . $value["descripcion"] . '</option>';
                            }


                            ?>

                          </select>

                        </div>

                      </div>

                    </div>


                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL Calle-->

                      <div class="form-group">

                        <label for="calle">Calle</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="text" class="form-control input-lg" name="nuevoCalle" id="nuevoCalle">

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-6">

                      <!-- ENTRADA PARA EL No Ext-->

                      <div class="form-group">

                        <label for="noExt">No. exterior</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="number" class="form-control input-lg" name="nuevoNoExt" id="nuevoNoExt">

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-6">

                      <!-- ENTRADA PARA EL No Int-->

                      <div class="form-group">

                        <label for="noInt">No. interior</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="number" class="form-control input-lg" name="nuevoNoInt" id="nuevoNoInt">

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL Colonia-->

                      <div class="form-group">

                        <label for="noInt">Colonia</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="text" class="form-control input-lg" name="nuevoColonia" id="nuevoColonia">

                        </div>

                      </div>

                    </div>

                    <!-- <div class="col-lg-12"> -->

                      <!-- ENTRADA PARA EL Localidad-->

                      <!-- <div class="form-group">

                        <label for="Localidad">Localidad</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="text" class="form-control input-lg" name="nuevoLocalidad" id="nuevoLocalidad">

                        </div>

                      </div>

                    </div> -->
                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL Municipio-->

                      <div class="form-group">

                        <label for="Municipio">Municipio</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <input type="text" class="form-control input-lg" name="nuevoMunicipio" id="nuevoMunicipio">

                        </div>

                      </div>

                    </div>
                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL Estado-->

                      <div class="form-group">

                        <label for="Estado">Estado</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <select style="width:100%; height: auto;" class="form-control chosen-select" name="nuevoEstado" id="nuevoEstado">

                            <option value="">Seleccionar el estado </option>

                            <?php

                            $tabla = "catalogoEstados";

                            $regimen = ControladorFacturacion::ctrMostrarCatalogos($tabla);

                            foreach ($regimen as $key => $value) {

                              echo '<option value="' . $value["estado"] . '">' . $value["estado"] . '</option>';
                            }


                            ?>

                          </select>

                        </div>

                      </div>

                    </div>

                    <div class="col-lg-12">

                      <!-- ENTRADA PARA EL Pais-->

                      <div class="form-group">

                        <label for="Pais">Pais</label>

                        <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-circle-o"></i></span>

                          <select name="nuevoPais" id="nuevoPais" class="form-control" required>

                            <option value="MEXICO">MÉXICO</option>

                          </select>

                        </div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>
            </div>

          </div>

        </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar cliente</button>

        </div>

      </form>

      <?php

      $crearCliente = new ControladorClientes();
      $crearCliente->ctrCrearCliente();

      ?>

    </div>

  </div>

</div>

<!--=====================================
MODAL EDITAR CLIENTE
======================================-->

<div id="modalEditarCliente" class="modal fade" role="dialog">

  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar cliente</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <!-- ENTRADA PARA EL NOMBRE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-user"></i></span>

                <input type="text" class="form-control input-lg" name="editarCliente" id="editarCliente" required>
                <input type="hidden" id="idCliente" name="idCliente">
              </div>

            </div>
            <!-- ENTRADA PARA CLIENTE FRECUENTE -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-calendar-check-o"></i></span>

                <select name="editarFrecuente" id="editarFrecuente" class="form-control" required>

                  <option value="">[SELECCIONE EL TIPO DE CLIENTE]</option>
                  <option value="1">Cliente frecuente</option>
                  <option value="2">Cliente NO frecuente</option>
                  <option value="3">Cliente Mercado Libre</option>

                </select>

              </div>

            </div>

            <!-- ENTRADA PARA EL DOCUMENTO ID -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-key"></i></span>

                <input type="number" min="0" class="form-control input-lg" name="editarDocumentoId" id="editarDocumentoId" required>

              </div>

            </div>

            <!-- ENTRADA PARA EL EMAIL -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>

                <input type="email" class="form-control input-lg" name="editarEmail" id="editarEmail" required>

              </div>

            </div>

            <!-- ENTRADA PARA EL TELÉFONO -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-phone"></i></span>

                <input type="text" class="form-control input-lg" name="editarTelefono" id="editarTelefono" data-inputmask="'mask':'(999) 999-9999'" data-mask required>

              </div>

            </div>

            <!-- ENTRADA PARA LA EMPRESA -->

            <div class="form-group">

              <div class="input-group">

                <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>

                <input type="text" class="form-control input-lg" name="editarEmpresa" id="editarEmpresa" required>

              </div>

            </div>

            <!-- ENTRADA PARA LA FECHA DE NACIMIENTO -->

            <!-- <div class="form-group">
              
              <div class="input-group">
              
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 

                <input type="text" class="form-control input-lg" name="editarFechaNacimiento" id="editarFechaNacimiento"  data-inputmask="'alias': 'yyyy/mm/dd'" data-mask required>

              </div>

            </div> -->

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

      $editarCliente = new ControladorClientes();
      $editarCliente->ctrEditarCliente();

      ?>



    </div>

  </div>

</div>

<?php

$eliminarCliente = new ControladorClientes();
$eliminarCliente->ctrEliminarCliente();

?>