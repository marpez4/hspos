<?php

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/categorias.controlador.php";
require_once "../modelos/categorias.modelo.php";

class TablaAltaProductos
{

    public function mostrarTablaProductos()
    {

        $item = null;
        $valor = null;
        $orden = "id";

        $productos = ControladorProductos::ctrMostrarAltaProductos($item, $valor, $orden);

        if (count($productos) == 0) {

            echo '{"data": []}';

            return;
        }

        $datosJson = '{
            "data": [';

        for ($i = 0; $i < count($productos); $i++) {

            $imagen = "<img src='" . $productos[$i]["imagen"] . "' width='40px'>";

            $item = "id";
            $valor = $productos[$i]["id_categoria"];

            $categorias = ControladorCategorias::ctrMostrarCategorias($item, $valor);


            if (isset($_GET["perfilOculto"]) && $_GET["perfilOculto"] == "Especial") {

                $botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarProducto' idProducto='" . $productos[$i]["id"] . "' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pencil'></i></button></div>";
            } else {

                $botones =  "<div class='btn-group'><button class='btn btn-warning btnEditarProducto' idProducto='" . $productos[$i]["id"] . "' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pencil'></i></button><button class='btn btn-danger btnEliminarProducto' idProducto='" . $productos[$i]["id"] . "' codigo='" . $productos[$i]["codigo"] . "' imagen='" . $productos[$i]["imagen"] . "'><i class='fa fa-times'></i></button></div>";
            }

            $compra = number_format($productos[$i]["precio_compra"], 2);
            $venta = number_format($productos[$i]["precio_venta"], 2);
            $ml = number_format($productos[$i]["precio_ml"], 2);
            $cf = number_format($productos[$i]["precio_cliente"], 2);

            $datosJson .= '[
                "' . ($i + 1) . '",
                "' . $imagen . '",
                "' . $productos[$i]["codigo"] . '",
                "' . $productos[$i]["nombre"] . '",
                "' . $categorias["categoria"] . '",
                "$' . $compra . '",
                "$' . $venta . '",
                "$' . $ml . '",
                "$' . $cf . '",
                "' . $productos[$i]["fecha"] . '",
                "' . $botones . '"
              ],';
        }

        $datosJson = substr($datosJson, 0, -1);

        $datosJson .=   '] 

		 }';

        echo $datosJson;
    }
}

/*=============================================
ACTIVAR TABLA DE PRODUCTOS
=============================================*/
$activarProductos = new TablaAltaProductos();
$activarProductos->mostrarTablaProductos();
