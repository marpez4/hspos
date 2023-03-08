
<script src="/ext/hspos/extra/FacturamaJs/facturama.api.js"></script>
<!-- <script src="/ext/hspos/extra/Facturama/facturama.api.multiemisor.js"></script> -->

<?php


if ($_SESSION["perfil"] == "Vendedor") {

    echo '<script>

    window.location = "inicio";

  </script>';

    return;
}

?>

<script>
    // window.facturama().facturama;
</script>

<div class="content-wrapper">

    <section class="content-header">

        <h1>

            Config. Facturación

        </h1>

        <ol class="breadcrumb">

            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li class="active">Config. Facturación</li>

        </ol>

    </section>

    <section class="content">

        <div class="box">

            <div class="box-header with-border">

            </div>

            <div class="box-body">
                
                <button onclick="testCliente()">Probar</button>

            </div>

        </div>

    </section>

</div>