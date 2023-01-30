<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Pedidos por paquetería</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="icon" href="vistas/img/plantilla/icono-negro.png">

    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="vistas/bower_components/bootstrap/dist/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="vistas/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="vistas/bower_components/Ionicons/css/ionicons.min.css">

    <!-- Theme style -->
    <link rel="stylesheet" href="vistas/dist/css/AdminLTE.css">

    <!-- AdminLTE Skins -->
    <link rel="stylesheet" href="vistas/dist/css/skins/_all-skins.min.css">

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <!-- jQuery 3 -->
    <script src="vistas/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap 3.3.7 -->
    <script src="vistas/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- SweetAlert 2 -->
    <script src="vistas/plugins/sweetalert2/sweetalert2.all.js"></script>

    <!-- By default SweetAlert2 doesn't support IE. To enable IE 11 support, include Promise polyfill:-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

    

</head>

<body class="hold-transition skin-blue sidebar-collapse sidebar-mini pedido-paqueteria">

    <section class="content">

        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="box box-danger">

                <div class="box-header">

                    <div class="login-logo">

                        <img src="vistas/img/plantilla/logo-blanco-bloque.png" class="img-responsive" style="padding:30px 100px 0px 100px">

                    </div>

                    <h3 class="box-title">Datos de envío</h3>

                </div>
                <div class="box-body">

                    <form enctype="multipart/form-data" method="post" id="formularioPedidos">

                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Nombre completo" name="nombre" id="nombre" required >
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Calle" name="calle" id="calle" required >
                            <span class="glyphicon glyphicon-home form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Colonia" name="colonia" id="colonia" required >
                            <span class="glyphicon glyphicon glyphicon-road form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <input type="number" class="form-control" placeholder="CP" name="cp" id="cp" required >
                            <span class="glyphicon glyphicon-inbox form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Ciudad" name="ciudad" id="ciudad" required >
                            <span class="glyphicon glyphicon-bookmark form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Estado" name="estado" id="estado" required >
                            <span class="glyphicon glyphicon-flag form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <input type="number" class="form-control" placeholder="Teléfono" name="telefono" id="telefono" required >
                            <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <textarea class="form-control" id="" rows="2" placeholder="Entre calles" name="entreCalles" id="entreCalles" required ></textarea>
                            <span class="glyphicon glyphicon-sort form-control-feedback"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <textarea class="form-control" id="" rows="2" placeholder="Referencias" name="referencias" id="referencias" required ></textarea>
                            <span class="glyphicon glyphicon-pushpin form-control-feedback"></span>
                        </div>
                        
                        <div class="form-group has-feedback">
                            <input type="file" class="form-control" placeholder="Archivo" name="archivo" id="archivo" required >
                            <span class="glyphicon glyphicon-folder-open form-control-feedback"></span>
                        </div>

                        <div class="row">
                            <div class="col-xs-8">
                                <div class="checkbox icheck">
                                    <label>
                                        <div class="icheckbox_square-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>Acepto los <a href="#">terminos y condiciones</a>
                                    </label>
                                </div>
                            </div>

                            <div class="col-xs-4">
                                <button type="submit" class="btn btn-danger btn-block btn-flat btnPedidoPaqueteria">Enviar</button>
                            </div>

                        </div>

                        <?php

                        $registro = new ControladorExt();

                        $registro->ctrIngresarPedidoPaqueteria();

                        ?>
                    </form>

                </div>

            </div>

        </div>
        <div class="col-md-4"></div>

    </section>

</body>

</html>

<!-- pedidosPaqueteria js -->
<!-- <script src="vistas/js/pedidosPaqueteria.js"></script> -->