<?php
class ControladorApartados
{

    static public function ctrMostrarApartados($item, $valor)
    {

        $tabla = "pagos";

        $respuesta = ModeloApartados::mdlMostrarApartados($tabla, $item, $valor);

        return $respuesta;
    }

    static public function ctrSumarApartados($item, $valor)
    {

        $tabla = "pagos";

        $respuesta = ModeloApartados::mdlSumarApartados($tabla, $item, $valor);

        return $respuesta;
    }

    static public function ctrMostrarAbonos($item, $valor)
    {

        $tabla = "pagos";

        $respuesta = ModeloApartados::mdlMostrarAbonos($tabla, $item, $valor);

        return $respuesta;
    }
}
